import 'package:course_app/section12_shoppingApp_backend&HTTP/data/categories.dart';
import 'package:course_app/section12_shoppingApp_backend&HTTP/models/grocery_item.dart';
import 'package:course_app/section12_shoppingApp_backend&HTTP/widgets/new_term.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});
  @override
  State<GroceryList> createState() {
    return _GroceryListState();
  }
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _groceryList = [];
  var _isLoading = true;
  String? _error;
  @override
  void initState() {
    _loadItemsFromFirestore();

    super.initState();
  }

  void _loadItemsFromFirestore() async {
    final url = Uri.https(
        'courseapps-d3fab-default-rtdb.firebaseio.com', 'Grocery-List.json');

    try {final response = await http.get(url);
    if (response.statusCode >= 400) {
      setState(() {
        _error = 'Faild To Fetch Data. Please Try Again Later.';
      });
    }

    if (response.body == 'null') {// or  if (response.statusCode >= 400) in other databases , but here in firebase the string 'null' is enough ya asmaa 
      setState(() {
        _isLoading = false;
      });
      return;
    }

    final Map<String, dynamic> listData = json.decode(response.body);
    final List<GroceryItem> loadedItems = [];

    for (final item in listData.entries) {
      final category = categories.entries
          .firstWhere(
            (categoryElement) =>
                categoryElement.value.title == item.value['category'],
          )
          .value;
      loadedItems.add(
        GroceryItem(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          category: category,
        ),
      );
    }
    setState(() {
      _groceryList = loadedItems;
      _isLoading = false;
    });
    } catch (error) {
      setState(() {
        _error = 'Something went wrong! Please try again later.';
      });
    }

    }
    

  void _openAddItemScreen() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (context) => const NewItemScreen(),
      ),
    );
    if (newItem == null) {
      return;
    }

    setState(() {
      _groceryList.add(newItem);
    });
  }

  void _removeItem(GroceryItem item) async {
    final deletionUrl = Uri.https(
        'courseapps-d3fab-default-rtdb.firebaseio.com',
        'Grocery-List/${item.id}.json');
    final expenseIndex = _groceryList.indexOf(item);

    setState(() {
      _groceryList.remove(item);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(milliseconds: 3000),
        content: Text('You have just deleted an Grocery Item'),
      ),
    );
    final deletionResonse = await http.delete(deletionUrl);
    if (deletionResonse.statusCode >= 400) {
      //undo deletion
      setState(() {
        _groceryList.insert(expenseIndex, item);
      });

      //show error happen during deletion
      // ignore: use_build_context_synchronously
      if (!context.mounted) {
        return;
      }
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(milliseconds: 3000),
          content: Text(
              'Something went wrong during deletion.Please try again later!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text("Oh.. No Items To Show Here, Yet.. Try Adding Some!"),
    );
    if (_isLoading) {
      content = const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (_groceryList.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryList.length,
        itemBuilder: (context, index) => Dismissible(
          background: Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Container(color: Theme.of(context).colorScheme.background),
          ),
          key: ValueKey(_groceryList[index].id),
          onDismissed: (direction) {
            _removeItem(_groceryList[index]);
          },
          child: ListTile(
            title: Text(_groceryList[index].name),
            leading: Container(
              width: 24,
              height: 24,
              color: _groceryList[index].category.color,
            ),
            trailing: Text(
              _groceryList[index].quantity.toString(),
            ),
          ),
        ),
      );
    }

    if (_error != null) {
      content = Center(
        child: Text(_error!),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Asmaa's Groceries List"),
        actions: [
          IconButton(
            onPressed: _openAddItemScreen,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}

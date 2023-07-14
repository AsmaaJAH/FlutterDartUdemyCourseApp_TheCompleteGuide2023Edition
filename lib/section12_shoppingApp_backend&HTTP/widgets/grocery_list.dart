import 'package:course_app/section12_shoppingApp_backend&HTTP/models/grocery_item.dart';
import 'package:course_app/section12_shoppingApp_backend&HTTP/widgets/new_term.dart';
import 'package:flutter/material.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});
  @override
  State<GroceryList> createState() {
    return _GroceryListState();
  }
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryList = [];
  void _openAddItemScreen() async {
    final newUserItem = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const NewItemScreen(),
      ),
    );
    if (newUserItem == null) {
      return;
    }
    setState(() {
      _groceryList.add(newUserItem);
    });
  }

  void _removeItem(GroceryItem item) {
    final expenseIndex = _groceryList.indexOf(item);
    setState(() {
      _groceryList.remove(item);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 3000),
        content: const Text('You have just deleted an Expense'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _groceryList.insert(expenseIndex, item);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text("Oh.. No Items To Show Here, Yet.. Try Adding Some!"),
    );
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

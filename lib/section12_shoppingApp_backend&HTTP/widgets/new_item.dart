import 'dart:convert';

import 'package:course_app/section12_shoppingApp_backend&HTTP/models/grocery_item.dart';
import 'package:course_app/section12_shoppingApp_backend&HTTP/data/categories.dart';
import 'package:course_app/section12_shoppingApp_backend&HTTP/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewItemScreen extends StatefulWidget {
  const NewItemScreen({super.key});
  @override
  State<NewItemScreen> createState() {
    return _NewItemScreenState();
  }
}

class _NewItemScreenState extends State<NewItemScreen> {
  final _formKey = GlobalKey<FormState>();
  var _enteredItemName = '';
  var _enteredQuantity = 1;
  var _selectedCatgory = categories[Categories.vegetables]!;
  var _isSending = false;

  void _saveItemData() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isSending = true;
      });
      final url = Uri.https(
          'courseapps-d3fab-default-rtdb.firebaseio.com', 'Grocery-List.json');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(
          {
            'name': _enteredItemName,
            'quantity': _enteredQuantity,
            'category': _selectedCatgory.title,
          },
        ),
      );

      final Map<String, dynamic> result = json.decode(response.body);

      // ignore: use_build_context_synchronously
      if (!context.mounted) {
        return;
      }

      Navigator.of(context).pop(GroceryItem(
        id: result['name'],
        name: _enteredItemName,
        quantity: _enteredQuantity,
        category: _selectedCatgory,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Item To Your Grocery'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  maxLength: 100,
                  decoration: const InputDecoration(
                    label: Text(
                      "Item Name",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1 ||
                        value.trim().length > 100) {
                      return 'Must be between 1 and 100 characters.';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _enteredItemName = newValue!;
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          label: Text(
                            'Quantity',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        initialValue: _enteredQuantity.toString(),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              int.tryParse(value) == null ||
                              int.tryParse(value)! < 0) {
                            return 'Kindly, Enter a valid positive number.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _enteredQuantity = int.parse(value!);
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: DropdownButtonFormField(
                        value: _selectedCatgory,
                        items: [
                          for (final category in categories
                              .entries) //entries to transform any map to an itrable list ya asmaa
                            DropdownMenuItem(
                              value: category.value,
                              child: Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    color: category.value.color,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(category.value.title),
                                ],
                              ),
                            ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _selectedCatgory = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        // If the button is pressed, return color, otherwise return another color
                        if (states.contains(MaterialState.pressed)) {
                          return Theme.of(context).colorScheme.onBackground;
                        }
                        return Theme.of(context).colorScheme.background;
                      })),
                      onPressed: _isSending
                          ? null
                          : () {
                              _formKey.currentState!.reset();
                            },
                      child: const Text('Reset'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(backgroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Theme.of(context).colorScheme.onBackground;
                        }
                        return Theme.of(context).colorScheme.background;
                      })),
                      onPressed: _isSending ? null : _saveItemData,
                      child: _isSending
                          ? const SizedBox(
                              height: 15,
                              width: 15,
                              child: CircularProgressIndicator(),
                            )
                          : const Text('Save Item'),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

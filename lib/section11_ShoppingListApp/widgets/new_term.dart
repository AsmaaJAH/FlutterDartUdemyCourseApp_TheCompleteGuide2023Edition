import 'package:course_app/section11_ShoppingListApp/data/categories.dart';
import 'package:flutter/material.dart';

class NewItemScreen extends StatefulWidget {
  const NewItemScreen({super.key});
  @override
  State<NewItemScreen> createState() {
    return _NewItemScreenState();
  }
}

class _NewItemScreenState extends State<NewItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
            child: Column(
          children: [
            TextFormField(
              maxLength: 100,
              decoration: const InputDecoration(
                label: Text("Item Name"),
              ),
              validator: (valueString) {
                return"error message ";
              },
            ),

             Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DropdownButtonFormField(
                      
                      items: [
                        for (final category in categories.entries) //entries to transform any map to an itrable list ya asmaa
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
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
          ],
        )),
      ),
    );
    
  }
}

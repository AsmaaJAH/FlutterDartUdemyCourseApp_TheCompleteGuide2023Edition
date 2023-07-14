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
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value.trim().length <= 1 ||
                    value.trim().length > 100) {
                  return 'Must be between 1 and 100 characters.';
                }
                return null;
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
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          int.tryParse(value) == null ||
                          int.tryParse(value)! < 0) {
                        return 'Kindly, Enter a valid positive number.';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField(
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
                    onChanged: (value) {},
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
                  onPressed: () {},
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
                  onPressed: () {},
                  child: const Text('Save Item'),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}

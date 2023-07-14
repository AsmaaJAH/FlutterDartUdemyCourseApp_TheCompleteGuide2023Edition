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
          ],
        )),
      ),
    );
    ;
  }
}

import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  @override
  Widget build(context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            maxLength: 75,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              label: Text("Enter Title"),
            ),
          ),
        ],
      ),
    );
  }
}

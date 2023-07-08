import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 75,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              label: Text("Enter Title"),
            ),
          ),
          TextField(
            controller: _amountController,
            maxLength: 75,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              prefixText: '\$',
              label: Text("Enter Amount"),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                  print(_amountController.text);

                },
                child: const Text('Save Expense'),
              ),
              const Spacer(),
                ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                  print(_amountController.text);

                },
                child: const Text('Cancel '),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

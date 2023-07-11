import 'dart:io';

import 'package:course_app/section5&6_expense_tracker_app/model/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Category _selectedCategory = Category.leisure;

  DateTime? _selectedDate;
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _showDialog() {
    if (Platform.isIOS) {
      //error message ios
      showCupertinoDialog(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
                title: const Text("invalid input"),
                content: const Text("CHECK YOUR INPUT AGAIN"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const Text("ok"),
                  ),
                ],
              ));
    } else {
      //error message andriod
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("invalid input"),
          content: const Text("CHECK YOUR INPUT AGAIN"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text("ok"),
            ),
          ],
        ),
      );
    }
  }

  void _submitValidatedData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      _showDialog();
      return;
    }
    widget.onAddExpense(
      Expense(
          title: _titleController.text,
          amount: enteredAmount,
          date: _selectedDate!,
          category: _selectedCategory),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    final keybordSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, keybordSpace + 20),
              child: Column(
                children: [
                  if (width > 600)
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Expanded(
                        child: TextField(
                          controller: _titleController,
                          maxLength: 75,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            label: Text("Enter Title"),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextField(
                          controller: _amountController,
                          maxLength: 75,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            prefixText: '\$',
                            label: Text("Enter Amount"),
                          ),
                        ),
                      ),
                    ])
                  else
                    TextField(
                      controller: _titleController,
                      maxLength: 75,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        label: Text("Enter Title"),
                      ),
                    ),
                  if (width > 600)
                    Row(
                      children: [
                        DropdownButton(
                            value: _selectedCategory, // apeared to user
                            items: Category.values
                                .map(
                                  (category) => DropdownMenuItem(
                                    value:
                                        category, //internal not appeared to user
                                    child: Text(
                                      category.name.toUpperCase(),
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (categoryValue) {
                              if (categoryValue == null) {
                                return;
                              }
                              setState(() {
                                _selectedCategory = categoryValue;
                              });
                            }),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                _selectedDate == null
                                    ? 'No selected date'
                                    : formatter.format(_selectedDate!),
                              ),
                              IconButton(
                                onPressed: _presentDatePicker,
                                icon: const Icon(
                                  Icons.calendar_month,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  else
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _amountController,
                            maxLength: 75,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              prefixText: '\$',
                              label: Text("Enter Amount"),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                _selectedDate == null
                                    ? 'No selected date'
                                    : formatter.format(_selectedDate!),
                              ),
                              IconButton(
                                onPressed: _presentDatePicker,
                                icon: const Icon(
                                  Icons.calendar_month,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  if (width > 600)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: _submitValidatedData,
                          child: const Text('Save Expense'),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel '),
                        ),
                      ],
                    )
                  else
                    Row(
                      children: [
                        DropdownButton(
                            value: _selectedCategory, // apeared to user
                            items: Category.values
                                .map(
                                  (category) => DropdownMenuItem(
                                    value:
                                        category, //internal not appeared to user
                                    child: Text(
                                      category.name.toUpperCase(),
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (categoryValue) {
                              if (categoryValue == null) {
                                return;
                              }
                              setState(() {
                                _selectedCategory = categoryValue;
                              });
                            }),
                        ElevatedButton(
                          onPressed: _submitValidatedData,
                          child: const Text('Save Expense'),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel '),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

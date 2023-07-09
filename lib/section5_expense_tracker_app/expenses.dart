import 'package:course_app/section5_expense_tracker_app/widgets/expenses_list/expenses_list.dart';
import 'package:course_app/section5_expense_tracker_app/model/expense.dart';
import 'package:course_app/section5_expense_tracker_app/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Electricity',
      amount: 299.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Internet',
      amount: 145.69,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Laptop Maintenance',
      amount: 500.00,
      date: DateTime.now(),
      category: Category.education,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) =>  NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
          _registeredExpenses.add(expense);

    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Asmaa's Expense Tracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('data'),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}

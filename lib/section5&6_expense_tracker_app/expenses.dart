import 'package:course_app/section5&6_expense_tracker_app/widgets/chart/chart.dart';
import 'package:course_app/section5&6_expense_tracker_app/widgets/expenses_list/expenses_list.dart';
import 'package:course_app/section5&6_expense_tracker_app/model/expense.dart';
import 'package:course_app/section5&6_expense_tracker_app/widgets/new_expense.dart';
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
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
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
                _registeredExpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(context) {
    final width = MediaQuery.of(context).size.width;
    Widget mainContent = const Center(
      child: Text("No Expenses Found. Start Entering your Expenses now! "),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,// on ios
        title: const Text("Asmaa's Expense Tracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body:width<600? Column(
        children: [
          Chart(
            expenses: _registeredExpenses,
          ),
          Expanded(
            child: mainContent,
          ),
        ],
      ): Row(children: [
          Expanded(
            child: Chart(
              expenses: _registeredExpenses,
            ),
          ),
          Expanded(
            child: mainContent,
          ),
        ],),
    );
  }
}

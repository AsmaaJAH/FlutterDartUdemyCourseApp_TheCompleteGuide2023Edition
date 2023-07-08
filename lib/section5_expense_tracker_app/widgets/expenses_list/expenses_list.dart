import 'package:course_app/section5_expense_tracker_app/widgets/expenses_list/expense_item.dart';
import 'package:course_app/section5_expense_tracker_app/model/expense.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});
  final List<Expense> expenses;

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) =>  ExpenseCard(expense: expenses[index], ),
    );
  }
}
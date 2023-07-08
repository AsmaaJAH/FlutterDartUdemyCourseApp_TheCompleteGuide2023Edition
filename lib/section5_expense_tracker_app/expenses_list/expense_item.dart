import 'package:course_app/section5_expense_tracker_app/model/expense.dart';
import 'package:flutter/material.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({super.key, required this.expense});
  final Expense expense;
  @override
  Widget build(Context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Text(expense.title),
          const SizedBox(height: 5,),
          Row(children: [
            Text('\$${expense.amount.toStringAsFixed(2)}'),
            const Spacer(),
            Row(children: [
               Icon(categoryIcons[expense.category]),
              const SizedBox(width: 10,),
              Text(expense.formattedDate),

            ],),
          ],),


        ],),
      ),
    );
  }
}

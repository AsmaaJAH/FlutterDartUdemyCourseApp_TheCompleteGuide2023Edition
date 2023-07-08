import 'package:flutter/material.dart';

import 'package:course_app/section5_expense_tracker_app/expenses.dart';

void main() {
  runApp(
     MaterialApp(
      theme: ThemeData(useMaterial3: true,),
      home: const Expenses(),
    ),
  );
}
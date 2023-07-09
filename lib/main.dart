import 'package:flutter/material.dart';

import 'package:course_app/section5_expense_tracker_app/expenses.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 1, 253, 203));
void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(255, 149, 245, 226),
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        elevatedButtonTheme:
            ElevatedButtonThemeData(style: ElevatedButton.styleFrom()),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 22,
              ),
            ),
      ),
      home: const Expenses(),
    ),
  );
}

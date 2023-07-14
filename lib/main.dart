import 'package:course_app/section11_ShoppingListApp/widgets/grocery_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asmaa\'s Flutter Groceries',
      theme: ThemeData.light().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 3, 244, 184),
          brightness: Brightness.light,
          surface: Color.fromARGB(255, 3, 255, 217),
        ),
        scaffoldBackgroundColor: Color.fromARGB(255, 172, 248, 227),
      ),
      home: const GroceryList(),
    );
  }
}

import 'package:course_app/section8_Meals_App/models/meal.dart';
import 'package:flutter/material.dart';

class MealsDetailsScreen extends StatelessWidget {
  const MealsDetailsScreen({
    super.key,
    required this.meal,
  });
  final Meal meal;
  @override
  Widget build(Context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 57, 47),
        title: Text(
          meal.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: Image.network(
        meal.imageUrl,
        height: 350,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}

import 'package:course_app/section8_Meals_App/models/meal.dart';
import 'package:flutter/material.dart';

class MealsDetailsScreen extends StatelessWidget {
  const MealsDetailsScreen({
    super.key,
    required this.meal,
    required this.onToggleFavourite,
  });
  final Meal meal;
  final Function(Meal meal) onToggleFavourite;
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 57, 47),
        title: Text(
          meal.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        actions: [
          IconButton(
            onPressed: () {
              onToggleFavourite(meal);
            },
            icon: const Icon(Icons.star),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 350,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 14),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
            ),
            const SizedBox(height: 14),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
              ),
            const SizedBox(height: 24),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
            ),
            const SizedBox(height: 14),
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                child: Text(
                  step,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

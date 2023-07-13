import 'package:course_app/section8_and9_Meals_App/data/dummy_data.dart';
import 'package:course_app/section8_and9_Meals_App/models/category.dart';
import 'package:course_app/section8_and9_Meals_App/models/meal.dart';
import 'package:course_app/section8_and9_Meals_App/screens/meals.dart';
import 'package:course_app/section8_and9_Meals_App/widgets/category_grid_item.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.availableMeals});
  final List<Meal> availableMeals;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 0,
      upperBound: 1,
      duration: const Duration(
        milliseconds: 500,
      ),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animationController,
        child: GridView(
                      padding: const EdgeInsets.all(20),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      children: [
                        for (final category in availableCategories)
                          CategoryGridItem(
                            category: category,
                            onSelectCategory: () {
                              _selectCategory(context, category);
                            },
                          ),
                      ],
                    ),
              builder: (context, child) => Padding(
                                      padding: EdgeInsets.only(
                                        top: 100 - _animationController.value * 100,
                                      ),
                                      child: child,
                                    ),
      ),
    );
  }
}

import 'package:course_app/section10_MealsApp_withAnimations/data/dummy_data.dart';
import 'package:course_app/section10_MealsApp_withAnimations/models/category.dart';
import 'package:course_app/section10_MealsApp_withAnimations/models/meal.dart';
import 'package:course_app/section10_MealsApp_withAnimations/screens/meals.dart';
import 'package:course_app/section10_MealsApp_withAnimations/widgets/category_grid_item.dart';
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
      // lowerBound: 0,
      // upperBound: 1,
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
        builder: (context, child) => SlideTransition(
          position: Tween(
            begin: const Offset(0, 0.4),
            end: const Offset(0, 0),
          ).animate(
            CurvedAnimation(
              parent: _animationController,
              curve: Curves.easeInOut,
            ),
          ),
          child: child,
        ),

        //Padding(
        //                         padding: EdgeInsets.only(
        //                           top: 1000 - _animationController.value * 100,
        //                         ),
        //                         child: child,
        //                       ),
      ),
    );
  }
}

import 'package:course_app/section8_Meals_App/data/dummy_data.dart';
import 'package:course_app/section8_Meals_App/widgets/category_grid_item.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose Category"),
      ),
      body: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/ 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
              CategoryGridItem(category: category,),
          
        ],
      ),
    );
  }
}

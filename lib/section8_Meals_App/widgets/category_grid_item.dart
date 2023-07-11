import 'package:flutter/material.dart';
import 'package:course_app/section8_Meals_App/models/category.dart';

// ignore: must_be_immutable
class CategoryGridItem extends StatelessWidget {
  CategoryGridItem({super.key, required this.category, required this.onSelectCategory});
  final Category category;
  void Function() onSelectCategory; //this is the address only ya asmaa even if the function actually takes parameters 

  @override
  Widget build(context) {
    return InkWell(
      onTap: onSelectCategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.45),
                category.color.withOpacity(0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}

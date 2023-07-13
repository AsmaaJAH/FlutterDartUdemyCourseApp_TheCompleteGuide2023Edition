import 'package:course_app/section8_and9_Meals_App/models/meal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Meal> kInitialMealList = [];

class FavouritesProviderNotifier extends StateNotifier<List<Meal>> {
  FavouritesProviderNotifier() : super(kInitialMealList);

  void toggleMealFavouriteStatus(Meal meal) {
    final alreadyFavourite = state.contains(meal);
    if (alreadyFavourite) {
      //remove meals with the equal IDs
      state = state.where((element) => element.id != meal.id).toList();
    } else {
      //add
      state = [...state, meal];
    }
  }
}

final favouritesProvider =
    StateNotifierProvider<FavouritesProviderNotifier, List<Meal>>((ref) {
  return FavouritesProviderNotifier();
});

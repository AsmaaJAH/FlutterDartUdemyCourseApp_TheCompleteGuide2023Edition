import 'package:course_app/section10_MealsApp_withAnimations/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Meal> kInitialMealList = [];

class FavouritesProviderNotifier extends StateNotifier<List<Meal>> {
  FavouritesProviderNotifier() : super(kInitialMealList);

  bool toggleMealFavouriteStatus(Meal meal) {
    final alreadyFavourite = state.contains(meal);
    bool isAdded=true;
    if (alreadyFavourite) {
      //remove meals with the equal IDs
      state = state.where((element) => element.id != meal.id).toList();
      return !isAdded;
    } else {
      //add
      state = [...state, meal];
      return isAdded;
    }
  }
}

final favouritesProvider =
    StateNotifierProvider<FavouritesProviderNotifier, List<Meal>>((ref) {
  return FavouritesProviderNotifier();
});

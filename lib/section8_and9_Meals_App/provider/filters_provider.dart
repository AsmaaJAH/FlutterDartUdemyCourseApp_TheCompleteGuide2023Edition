import 'dart:ffi';

import 'package:course_app/section8_and9_Meals_App/provider/meals_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

Map<Filter, bool> kInitialMap = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier() : super(kInitialMap);

  void setOneFilterStatus(Filter filter, bool isActice) {
    state = {
      ...state,
      filter: isActice,
    };
  }

  void setAllFiltersStatus(Map<Filter, bool> activeFilters) {
    state = activeFilters;
  }
}

final filterProvider = StateNotifierProvider<FilterNotifier, Map<Filter, bool>>(
  (ref) => FilterNotifier(),
);

//--------------------- 3rd provider depends on all the previous providors ---------------------------------------------
final filteredMealProvider = Provider((ref) {

  final mealsData = ref.watch(mealsProvider);
  final chosenFilters = ref.watch(filterProvider);

  return mealsData.where((meal) {
    if (chosenFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (chosenFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (chosenFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (chosenFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});

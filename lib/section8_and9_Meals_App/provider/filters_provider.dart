import 'dart:ffi';

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

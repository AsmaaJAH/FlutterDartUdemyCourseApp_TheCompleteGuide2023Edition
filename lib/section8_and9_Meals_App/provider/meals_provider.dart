import 'package:course_app/section8_and9_Meals_App/data/dummy_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});

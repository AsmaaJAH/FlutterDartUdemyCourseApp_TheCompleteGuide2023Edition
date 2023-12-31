import 'package:course_app/section11_ShoppingListApp/models/category_model.dart';
import 'package:course_app/section11_ShoppingListApp/models/grocery_item.dart';
import 'package:course_app/section11_ShoppingListApp/data/categories.dart';

 final groceryItems = [
  GroceryItem(
      id: 'a',
      name: 'Milk',
      quantity: 1,
      category: categories[Categories.dairy]!),
  GroceryItem(
      id: 'b',
      name: 'Bananas',
      quantity: 6,
      category: categories[Categories.fruit]!),
  GroceryItem(
      id: 'c',
      name: 'Beef Steak',
      quantity: 1,
      category: categories[Categories.meat]!),
];
import 'package:course_app/section12_shoppingApp_backend&HTTP/models/category_model.dart';
import 'package:course_app/section12_shoppingApp_backend&HTTP/models/grocery_item.dart';
import 'package:course_app/section12_shoppingApp_backend&HTTP/data/categories.dart';

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
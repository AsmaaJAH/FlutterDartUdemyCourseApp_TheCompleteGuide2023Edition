import 'package:course_app/section8_and9_Meals_App/data/dummy_data.dart';
import 'package:course_app/section8_and9_Meals_App/models/meal.dart';
import 'package:course_app/section8_and9_Meals_App/screens/categories.dart';
import 'package:course_app/section8_and9_Meals_App/screens/filters.dart';
import 'package:course_app/section8_and9_Meals_App/screens/meals.dart';
import 'package:course_app/section8_and9_Meals_App/widgets/drawer.dart';
import 'package:flutter/material.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});
  @override
  State<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favouriteMeals = [];
  // ignore: unused_field
  Map<Filter, bool> _chosenFilters = kInitialFilters;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _showSnackBarMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(
          milliseconds: 500,
        ),
        backgroundColor: Theme.of(context).snackBarTheme.backgroundColor,
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _toggleMealFavouriteStatus(Meal meal) {
    final isExisting = _favouriteMeals.contains(meal);

    if (isExisting) {
      setState(() {
        _favouriteMeals.remove(meal);
      });
      _showSnackBarMessage('Meal Is No Longer A Favorite.');
    } else {
      setState(() {
        _favouriteMeals.add(meal);
      });
      _showSnackBarMessage('Meal Is Added To Favorite.');
    }
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'Filters') {
      final resultsFilters =
          await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FilterScreen(currentFilters: _chosenFilters,),
        ),
      );
      setState(() {
        _chosenFilters = resultsFilters ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var activePageTitle = 'Categories';
    final availableMeals = dummyMeals.where((meal) {
      if (_chosenFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_chosenFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_chosenFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_chosenFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoryScreen(
      availableMeals: availableMeals,
      onToggleFavourite: _toggleMealFavouriteStatus,
    );
    
    if (_selectedPageIndex == 1) {
      activePageTitle = 'Favourites';
      activePage = MealsScreen(
        meals: _favouriteMeals,
        onToggleFavourite: _toggleMealFavouriteStatus,
      );
    }
    return Scaffold(
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(
          activePageTitle,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
            backgroundColor: Color.fromARGB(255, 1, 57, 47),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}

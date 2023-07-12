import 'package:course_app/section8_Meals_App/models/meal.dart';
import 'package:course_app/section8_Meals_App/screens/categories.dart';
import 'package:course_app/section8_Meals_App/screens/meals.dart';
import 'package:course_app/section8_Meals_App/widgets/drawer.dart';
import 'package:flutter/material.dart';

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

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _showSnackBarMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(duration: const Duration(milliseconds: 500,),backgroundColor: Theme.of(context).snackBarTheme.backgroundColor,content: Text(message, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold,),),),
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
  void _setScreen(String identifier){
    if(identifier== 'Filters'){

    }else{
      Navigator.of(context).pop;
    }

  }
  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoryScreen(
      onToggleFavourite: _toggleMealFavouriteStatus,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePageTitle = 'Favourites';
      activePage = MealsScreen(
        meals: _favouriteMeals,
        onToggleFavourite: _toggleMealFavouriteStatus,
      );
    }
    return Scaffold(
      drawer: MainDrawer(onSelectScreen: _setScreen,),
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(
          activePageTitle,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
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

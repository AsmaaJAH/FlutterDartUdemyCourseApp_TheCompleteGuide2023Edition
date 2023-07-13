import 'package:course_app/section8_and9_Meals_App/provider/favourites_provider.dart';
import 'package:course_app/section8_and9_Meals_App/screens/categories.dart';
import 'package:course_app/section8_and9_Meals_App/screens/filters.dart';
import 'package:course_app/section8_and9_Meals_App/screens/meals.dart';
import 'package:course_app/section8_and9_Meals_App/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:course_app/section8_and9_Meals_App/provider/filters_provider.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});
  @override
  ConsumerState<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'Filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FilterScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var activePageTitle = 'Categories';
    final availableMeals=ref.watch(filteredMealProvider);

    Widget activePage = CategoryScreen(
      availableMeals: availableMeals,
    );

    if (_selectedPageIndex == 1) {
      final favouriteMeals = ref.watch(favouritesProvider);
      activePageTitle = 'Favourites';
      activePage = MealsScreen(
        meals: favouriteMeals,
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

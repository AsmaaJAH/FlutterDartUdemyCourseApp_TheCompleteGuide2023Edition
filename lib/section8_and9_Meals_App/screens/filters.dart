import 'package:flutter/material.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilters});
  final Map<Filter, bool> currentFilters;
  @override
  State<FilterScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianFilterSet = widget.currentFilters[Filter.vegetarian]!;
    _veganFilterSet = widget.currentFilters[Filter.vegan]!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          title: const Text(
            "Filters",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          )),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              activeTrackColor: Theme.of(context).colorScheme.onBackground,
              selectedTileColor: Theme.of(context).colorScheme.onBackground,
              value: _glutenFreeFilterSet,
              onChanged: (isSwitched) {
                setState(() {
                  _glutenFreeFilterSet = isSwitched;
                });
              },
              title: Text(
                'Gluten-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: Text(
                'No Gluten in these meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 20,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                right: 40,
                left: 40,
              ),
            ),
            SwitchListTile(
              tileColor: Theme.of(context).colorScheme.primary,
              activeTrackColor: Theme.of(context).colorScheme.onBackground,
              selectedTileColor: Theme.of(context).colorScheme.onBackground,
              value: _lactoseFreeFilterSet,
              onChanged: (isSwitched) {
                setState(() {
                  _lactoseFreeFilterSet = isSwitched;
                });
              },
              title: Text(
                'Lactose-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: Text(
                'No Lactose in these meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Colors.black,
                      fontSize: 20,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                right: 40,
                left: 40,
              ),
            ),
            SwitchListTile(
              activeTrackColor: Theme.of(context).colorScheme.onBackground,
              selectedTileColor: Theme.of(context).colorScheme.onBackground,
              value: _vegetarianFilterSet,
              onChanged: (isSwitched) {
                setState(() {
                  _vegetarianFilterSet = isSwitched;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: Text(
                'vegetarian Recipe ingredients Only are in these meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 20,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                right: 40,
                left: 40,
              ),
            ),
            SwitchListTile(
              tileColor: Theme.of(context).colorScheme.primary,
              activeTrackColor: Theme.of(context).colorScheme.onBackground,
              selectedTileColor: Theme.of(context).colorScheme.onBackground,
              value: _veganFilterSet,
              onChanged: (isSwitched) {
                setState(() {
                  _veganFilterSet = isSwitched;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: Text(
                'Vegan Recipe ingredients Only are in these meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Colors.black,
                      fontSize: 20,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                right: 40,
                left: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:course_app/section8_and9_Meals_App/provider/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({super.key});
  @override
  ConsumerState<FilterScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    final currentActiveFilters = ref.read(filterProvider);
    _glutenFreeFilterSet = currentActiveFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = currentActiveFilters[Filter.lactoseFree]!;
    _vegetarianFilterSet = currentActiveFilters[Filter.vegetarian]!;
    _veganFilterSet = currentActiveFilters[Filter.vegan]!;

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
          ref.read(filterProvider.notifier).setAllFiltersStatus({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
          //remove this line, no need for it now
          //Navigator.of(context).pop();
          return true;
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

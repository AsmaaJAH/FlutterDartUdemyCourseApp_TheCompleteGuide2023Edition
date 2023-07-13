import 'package:flutter/material.dart';
import 'package:course_app/section8_and9_Meals_App/provider/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          title: const Text(
            "Filters",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          )),
      body: Column(
        children: [
          SwitchListTile(
            activeTrackColor: Theme.of(context).colorScheme.onBackground,
            selectedTileColor: Theme.of(context).colorScheme.onBackground,
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (isSwitched) {
              ref
                  .read(filterProvider.notifier)
                  .setOneFilterStatus(Filter.glutenFree, isSwitched);
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
                        value: activeFilters[Filter.lactoseFree]!,
            onChanged: (isSwitched) {
              ref
                  .read(filterProvider.notifier)
                  .setOneFilterStatus(Filter.lactoseFree, isSwitched);
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
                        value: activeFilters[Filter.vegetarian]!,
            onChanged: (isSwitched) {
              ref
                  .read(filterProvider.notifier)
                  .setOneFilterStatus(Filter.vegetarian, isSwitched);
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
                        value: activeFilters[Filter.vegan]!,
            onChanged: (isSwitched) {
              ref
                  .read(filterProvider.notifier)
                  .setOneFilterStatus(Filter.vegan, isSwitched);
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
    );
  }
}

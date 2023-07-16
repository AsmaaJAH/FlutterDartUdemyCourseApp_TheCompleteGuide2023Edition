import 'package:course_app/section13_FavouritePlaces_App/models/place.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({
    super.key,
    required this.placesList,
  });
  final List<PlaceBluePrint> placesList;

  @override
  Widget build(BuildContext context) {
    if (placesList.isEmpty) {
      return Center(
        child: Text(
          "No places added yet , try adding some!",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
        ),
      );
    }
    return ListView.builder(
      itemCount: placesList.length,
      itemBuilder: (ctx, index) => ListTile(
        title: Text(
          placesList[index].title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}

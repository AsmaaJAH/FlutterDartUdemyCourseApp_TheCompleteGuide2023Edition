import 'package:course_app/section13_FavouritePlaces_App/models/place.dart';
import 'package:course_app/section13_FavouritePlaces_App/screens/single_place_details.dart';
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
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: FileImage(
            placesList[index].image,
          ),
        ),
        title: Text(
          placesList[index].title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
        ),
        subtitle: Text(
          placesList[index].location.address,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 18,
              ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) =>
                  SinglePlaceDetailScreen(place: placesList[index]),
            ),
          );
        },
      ),
    );
  }
}

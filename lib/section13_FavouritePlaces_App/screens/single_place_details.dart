import 'package:flutter/material.dart';
import 'package:course_app/section13_FavouritePlaces_App/models/place.dart';

class SinglePlaceDetailScreen extends StatelessWidget {
  const SinglePlaceDetailScreen({super.key, required this.place});
  final PlaceBluePrint place;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          place.title,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Text(
          place.title,
           style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}

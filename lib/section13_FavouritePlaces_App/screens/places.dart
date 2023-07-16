import 'package:course_app/section13_FavouritePlaces_App/providers/user_places.dart';
import 'package:course_app/section13_FavouritePlaces_App/screens/add_place.dart';
import 'package:course_app/section13_FavouritePlaces_App/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(userPlacesNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your  Places",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const AddPlacesScreen(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body:  PlacesList(
        placesList: userPlaces,
      ),
    );
  }
}

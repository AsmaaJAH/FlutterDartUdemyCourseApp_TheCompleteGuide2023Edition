import 'package:course_app/section13_FavouritePlaces_App/providers/user_places.dart';
import 'package:course_app/section13_FavouritePlaces_App/screens/add_place.dart';
import 'package:course_app/section13_FavouritePlaces_App/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerStatefulWidget {
  const PlacesScreen({super.key});

  @override
  ConsumerState<PlacesScreen> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends ConsumerState<PlacesScreen> {
  late Future<void> _placeFuture;
  @override
  void initState() {
    super.initState();
    _placeFuture =
        ref.read(userPlacesNotifierProvider.notifier).loadPlacesViaDatabase();
  }

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(5, 15, 5, 10),
        child: FutureBuilder(
          future: _placeFuture,
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? const Center(child: CircularProgressIndicator(),)
                  : PlacesList(
                      placesList: userPlaces,
                    ),
        ),
      ),
    );
  }
}

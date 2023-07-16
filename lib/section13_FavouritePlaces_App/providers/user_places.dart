import 'dart:io';
import 'package:course_app/section13_FavouritePlaces_App/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPlacesNotifier extends StateNotifier<List<PlaceBluePrint>> {
  UserPlacesNotifier() : super(const []);
  void addPlace(String title, File image, PlaceLocation location) {
    final newPlace = PlaceBluePrint(title: title,image: image, location:location );
    state = [newPlace, ...state];
  }
}

final userPlacesNotifierProvider = StateNotifierProvider<UserPlacesNotifier, List<PlaceBluePrint>>((ref) => UserPlacesNotifier(),);

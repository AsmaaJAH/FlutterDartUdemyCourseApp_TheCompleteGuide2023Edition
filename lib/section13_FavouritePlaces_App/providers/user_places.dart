import 'dart:io';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:course_app/section13_FavouritePlaces_App/models/place.dart';

class UserPlacesNotifier extends StateNotifier<List<PlaceBluePrint>> {
  UserPlacesNotifier() : super(const []);
  void addPlace(String title, File image, PlaceLocation location) async {
    final appDirectory = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(image.path);
    final copiedImage = await image.copy('${appDirectory.path}/$fileName');
    final newPlace =
        PlaceBluePrint(title: title, image: copiedImage, location: location);
    state = [newPlace, ...state];
  }
}

final userPlacesNotifierProvider =
    StateNotifierProvider<UserPlacesNotifier, List<PlaceBluePrint>>(
  (ref) => UserPlacesNotifier(),
);

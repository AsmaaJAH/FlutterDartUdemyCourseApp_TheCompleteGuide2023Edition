import 'dart:io';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import 'package:course_app/section13_FavouritePlaces_App/models/place.dart';

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  //open or create if not exist
  final db = await sql.openDatabase(
    path.join(dbPath, 'places.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT , image TEXT, latitude REAL, longitude REAL, address TEXT)');
    },
    version: 1,
  );
  return db;
}

class UserPlacesNotifier extends StateNotifier<List<PlaceBluePrint>> {
  UserPlacesNotifier() : super(const []);
  Future<void> loadPlacesViaDatabase() async {
    final db = await _getDatabase();
    final placesData = await db.query('user_places');
    final places = placesData
        .map(
          (row) => PlaceBluePrint(
            id: row['id'] as String,
            title: row['title'] as String,
            image: File(row['image'] as String),
            location: PlaceLocation(
              latitude: row['latitude'] as double,
              longitude: row['longitude'] as double,
              address: row['address'] as String,
            ),
          ),
        )
        .toList();
    state = places;
  }

  void addPlace(String title, File image, PlaceLocation location) async {
    final appDirectory = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(image.path);
    final copiedImage = await image.copy('${appDirectory.path}/$fileName');
    final newPlace =
        PlaceBluePrint(title: title, image: copiedImage, location: location);

    final db = await _getDatabase();
    db.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      'latitude': newPlace.location.latitude,
      'longitude': newPlace.location.longitude,
      'address': newPlace.location.address,
    });
    state = [newPlace, ...state];
  }
}

final userPlacesNotifierProvider =
    StateNotifierProvider<UserPlacesNotifier, List<PlaceBluePrint>>(
  (ref) => UserPlacesNotifier(),
);

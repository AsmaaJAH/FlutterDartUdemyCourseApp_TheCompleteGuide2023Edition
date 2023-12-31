import 'dart:io';
import 'package:course_app/section13_FavouritePlaces_App/models/place.dart';
import 'package:course_app/section13_FavouritePlaces_App/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:course_app/section13_FavouritePlaces_App/providers/user_places.dart';
import 'package:course_app/section13_FavouritePlaces_App/widgets/image_input.dart';

class AddPlacesScreen extends ConsumerStatefulWidget {
  const AddPlacesScreen({super.key});
  @override
  ConsumerState<AddPlacesScreen> createState() {
    return _AddPlacesScreenState();
  }
}

class _AddPlacesScreenState extends ConsumerState<AddPlacesScreen> {
  final _titleController = TextEditingController();
  File? _userCameraImage;
  PlaceLocation? _location;
  void _savePlace() {
    final enteredTitle = _titleController.text;
    if (enteredTitle.isEmpty || _userCameraImage == null || _location == null) {
      return;
    }
    ref.read(userPlacesNotifierProvider.notifier).addPlace(
          enteredTitle,
          _userCameraImage!,
          _location!,
        );
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add New Place",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: "Enter Place Title",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                controller: _titleController,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              //native camera image input
              ImageInput(
                onPickedImage: (image) {
                  _userCameraImage = image;
                },
              ),
              const SizedBox(height: 20),
              LocationInput(
                onSelectLocation: (userLocation) {
                  _location = userLocation;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _savePlace,
                icon: const Icon(Icons.add),
                label: const Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

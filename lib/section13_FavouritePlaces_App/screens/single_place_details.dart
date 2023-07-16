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
      body: Stack(children: [
        Image.file(place.image,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,),
      ],),
    );
  }
}

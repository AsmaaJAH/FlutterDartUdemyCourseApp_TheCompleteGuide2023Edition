import 'package:flutter/material.dart';
import 'package:course_app/section13_FavouritePlaces_App/models/place.dart';

class SinglePlaceDetailScreen extends StatelessWidget {
  const SinglePlaceDetailScreen({super.key, required this.place});
  final PlaceBluePrint place;

  String get locationImage {
    final lat = place.location.latitude;
    final lng = place.location.longitude;
    //return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng=&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$lat,$lng&key=AIzaSyDLcwxUggpPZo8lcbH0TB4Crq5SJjtj4ag';
    return 'https://cdn.sanity.io/images/f4joeudg/production/7f846197ab0edd09d1793a203d4b9016a2c22fa4-400x250.png';
  }

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
      body: Stack(
        children: [
          Image.file(
            place.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
           Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(locationImage),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black54,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Text(
                    place.location.address,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
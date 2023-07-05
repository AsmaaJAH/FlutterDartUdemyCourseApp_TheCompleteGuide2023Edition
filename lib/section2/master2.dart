import 'package:course_app/section2/gradient_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( const MaterialApp(
    home: Scaffold(
      body: GradientContainer([
            Color.fromARGB(255, 23, 234, 216),
            Color.fromARGB(255, 29, 177, 167)
          ],),
    ),
  ));
}

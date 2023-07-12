import 'package:course_app/section8_Meals_App/screens/tabs.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 6, 97, 74),
  ),
  textTheme: GoogleFonts.ebGaramondTextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    theme: theme,
      home: const TabScreen(),
    );
  }
}
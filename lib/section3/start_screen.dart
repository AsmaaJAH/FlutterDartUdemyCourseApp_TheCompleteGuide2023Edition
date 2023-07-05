import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
          ),
          const SizedBox(height: 80),
          const Text(
            "Asmaa's 2nd Task App",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              side: BorderSide(width: 5.0, color: Colors.white),
            ),
            child: const Text(
              'Take Quiz',
              style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20, ),
            ),
          )
        ],
      ),
    );
  }
}

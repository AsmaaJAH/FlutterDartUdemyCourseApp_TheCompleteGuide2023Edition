import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.takeQuiz, {super.key});
  final void Function() takeQuiz;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(190, 255, 255, 255),
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
          OutlinedButton.icon(
            onPressed: takeQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              side: const BorderSide(width: 5.0, color: Colors.white),
            ),
            icon: const Icon(Icons.arrow_right_alt_sharp),
            label: const Text(
              'Take Quiz',
              style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20, ),
            ),
          )
        ],
      ),
    );
  }
}

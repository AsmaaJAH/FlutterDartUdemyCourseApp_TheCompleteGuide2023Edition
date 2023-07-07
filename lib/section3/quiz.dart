import 'package:course_app/section3/data/questions.dart';
import 'package:course_app/section3/screens/questions_screen.dart';
import 'package:course_app/section3/screens/results_screen.dart';
import 'package:course_app/section3/screens/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }


  void addUserAnswer(String userAnswer) {
    selectedAnswers.add(userAnswer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        selectedAnswers = [];
        activeScreen='results-screen';
      });
    }
  }


  @override
  Widget build(context) {
        Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: addUserAnswer,
      );
    }else if(activeScreen == 'results-screen'){
      screenWidget = ResultsScreen( userchosenAnswer: selectedAnswers);
      
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 3, 182, 170),
                Color.fromARGB(255, 94, 249, 228),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:course_app/section3/answer_button.dart';
import 'package:course_app/section3/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

void here() {}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuesIndex = 0;
  void pressAnswerButton() {
    setState(() {
      currentQuesIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuesIndex];
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestion.text,
                style: GoogleFonts.ebGaramond(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              ...currentQuestion.getShuffledAnswers().map(
                (item) {
                  return AnswerButton(answer: item, onTap: pressAnswerButton,);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

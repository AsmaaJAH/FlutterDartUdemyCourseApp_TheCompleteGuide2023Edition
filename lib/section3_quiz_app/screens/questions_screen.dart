import 'package:flutter/material.dart';
import 'package:course_app/section3_quiz_app/answer_button.dart';
import 'package:course_app/section3_quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});
  final void Function(String userAnswer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuesIndex = 0;
  void pressAnswerButton(String selectedUserAnswer) {
    widget.onSelectAnswer(selectedUserAnswer);
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
          margin: const EdgeInsets.all(30),
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
              const SizedBox(height: 30),
              ...currentQuestion.getShuffledAnswers().map(
                (answerItem) {
                  return AnswerButton(
                    answer: answerItem,
                    onTap: () {
                      pressAnswerButton(answerItem);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

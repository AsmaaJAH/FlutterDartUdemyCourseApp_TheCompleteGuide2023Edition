import 'package:course_app/section3/answer_button.dart';
import 'package:course_app/section3/data/questions.dart';
import 'package:course_app/section3/questions_summary.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.userchosenAnswer});
  final List<String> userchosenAnswer;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < userchosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': userchosenAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotQuestions=questions.length;
    final numCorrectAns= summaryData.where((item){
      return item['correct_answer']==item['user_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered $numCorrectAns out of $numTotQuestions questions correctly!'),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {},
              child: AnswerButton(answer: "Restart Quiz!", onTap: () {}),
            )
          ],
        ),
      ),
    );
  }
}

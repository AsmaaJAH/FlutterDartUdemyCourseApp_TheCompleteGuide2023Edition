import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((item) {
            return Row(
              children: [
                Text(((item['question_index'] as int )+1).toString()),
                Expanded(
                  child: Column(children: [
                    Text(item['question'] as String),
                    Text(item['correct_answer'] as String),
                    Text(item['user_answer'] as String),
                  ],),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

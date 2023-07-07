import 'package:course_app/section3_quiz_app/questions_summary/summary_item.dart';
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
          children: [...summaryData.map((item)=> SummaryItem(item))],
        ),
      ),
    );
  }
}

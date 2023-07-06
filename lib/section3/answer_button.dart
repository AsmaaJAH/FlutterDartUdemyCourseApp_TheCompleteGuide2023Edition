import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({required this.answer, required this.onTap, super.key});
  final String answer;
  final void Function()? onTap;
  @override
  Widget build(context) {
    return ElevatedButton(
    
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
        backgroundColor: Color.fromARGB(255, 80, 243, 205),
        foregroundColor: Colors.black,

        shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(40),
 ),

        ),
      onPressed: onTap,
      child: Text(answer, style: const TextStyle(fontWeight:  FontWeight.bold),),
    );
  }
}

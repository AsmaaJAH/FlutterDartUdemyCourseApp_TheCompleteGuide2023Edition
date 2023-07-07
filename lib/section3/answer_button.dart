import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({required this.answer, required this.onTap, super.key});
  final String answer;
  final void Function()? onTap;
  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
      
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
          backgroundColor: const  Color.fromARGB(255, 80, 243, 205),
          foregroundColor: Colors.black,
    
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(40),
     ),
    
          ),
        onPressed: onTap,
        child: Text(answer, textAlign: TextAlign.center,style: const TextStyle(fontSize:16 ,fontWeight:  FontWeight.bold),),
      ),
    );
  }
}

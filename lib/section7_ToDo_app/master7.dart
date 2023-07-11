import 'package:course_app/section7_ToDo_app/keys/keys.dart';
// import 'package:course_app/section7_ToDo_app/ui_updates_demo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 5, 255, 117),
          title: const Text("Asmaa's ToDo Chackable App", style: TextStyle(fontWeight: FontWeight.bold,),),
        ),
        body: const Keys(),
      ),
    );
  }
}

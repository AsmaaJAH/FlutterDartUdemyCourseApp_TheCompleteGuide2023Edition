import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("choose Category"),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 5 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      children: const [
            Text('1', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
            Text('2', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
            Text('3', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
            Text('4', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
            Text('5', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
            Text('6', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),

      ],),
    );
  }
}

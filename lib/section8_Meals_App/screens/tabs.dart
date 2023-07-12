import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});
  @override
  State<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("data"),
      ),
      body: const Text("fkjhkjf"),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {},
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}

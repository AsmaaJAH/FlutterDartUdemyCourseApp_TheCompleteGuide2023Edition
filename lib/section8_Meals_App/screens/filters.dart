import 'package:flutter/material.dart';

class FiterScreen extends StatefulWidget {
  const FiterScreen({super.key});
  @override
  State<FiterScreen> createState() {
    return _FiterScreenState();
  }
}

class _FiterScreenState extends State<FiterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Filters")),
      body: Column(
        children: [
          SwitchListTile(
            value: true,
            onChanged: (here) {},
            title: Text(
              'Gluten-Free',
              style:
                Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            subtitle: Text(
              'No Gluten in these meals',
              style:
                Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SearchNavScreen extends StatefulWidget {
  const SearchNavScreen({super.key});

  @override
  State<SearchNavScreen> createState() => _SearchNavScreenState();
}

class _SearchNavScreenState extends State<SearchNavScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Search Screen"),
      ),
    );
  }
}

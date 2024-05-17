import 'package:flutter/material.dart';

class LibraryNavScreen extends StatefulWidget {
  const LibraryNavScreen({super.key});

  @override
  State<LibraryNavScreen> createState() => _LibraryNavScreenState();
}

class _LibraryNavScreenState extends State<LibraryNavScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),body: Center(child: Text("Library"),),);
  }
}
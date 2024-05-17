import 'package:flutter/material.dart';

class PremiumNavScreen extends StatefulWidget {
  const PremiumNavScreen({super.key});

  @override
  State<PremiumNavScreen> createState() => _PremiumNavScreenState();
}

class _PremiumNavScreenState extends State<PremiumNavScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),body: Center(child: Text("Premium Screen"),),);
  }
}
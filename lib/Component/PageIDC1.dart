import 'package:flutter/material.dart';

class PageIDC1 extends StatelessWidget {
  const PageIDC1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ClipRRect(
            child: Container(
          child: Image.asset('lib/Image/epikpost.png'),
        )),
      ),
    );
  }
}

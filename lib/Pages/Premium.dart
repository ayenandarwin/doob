import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Premium extends StatefulWidget {
  const Premium({super.key});

  @override
  State<Premium> createState() => _PremiumState();
}

class _PremiumState extends State<Premium> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/Icons/pay.svg',
                height: 40,
              ),
              Text(
                'Premium',
                style: TextStyle(
                    fontFamily: 'Century',
                    color: Color(0xffff9800),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}

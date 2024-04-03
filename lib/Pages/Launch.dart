import 'package:doob/Pages/Welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      // Navigator.pushNamed(context, '/welcome');
      Get.off(Welcome());
      //passedCheck();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffff9800),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.13,
            ),
            Center(
              child: Image.asset(
                'lib/Image/DOOB.png',

                height: 90,
                //scale: 0.1,
              ),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            Text(
              'Welcome to doob',
              //'Welcome to doob'.tr,
              style: TextStyle(
                  fontSize: 30, fontFamily: 'Century', color: Colors.white),
            ),
            // Lottie.asset('assets/icons/loading2.json', width: 150, height: 150),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

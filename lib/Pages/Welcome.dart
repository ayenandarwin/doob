import 'package:doob/Pages/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //     centerTitle: true,
        //     backgroundColor: CustomColor.blue,
        //     title: Text(
        //       '2D Myanmar',
        //       style: TextStyle(fontSize: 22, color: CustomColor.white),
        //     )),
        // backgroundColor: CustomColor.black,
        // backgroundColor: Color(0xffff9800),
        body: Stack(
          children: [
            Container(
              child: Image.asset(
                'lib/Image/Listen_to_music.png',
              ),
            ),
            // Image.asset(
            //   'lib/Image/Listen_to_music.png',
            // ),
            Container(
              margin: EdgeInsets.only(top: size.height / 1.8),
              height: size.height / 5 * 2,
              decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        40,
                      ),
                      topRight: Radius.circular(40))),
            ),
            // Container(
            //   margin: EdgeInsets.only(
            //     top: 75,
            //     left: 12,
            //   ),
            //   child: Row(
            //     children: [
            //       Container(
            //         width: MediaQuery.of(context).size.width * 0.44,
            //         height: MediaQuery.of(context).size.height * 0.05,
            //         padding: EdgeInsets.symmetric(horizontal: 16),
            //         decoration: BoxDecoration(
            //             //color: CustomColor.purple,
            //             borderRadius: BorderRadius.circular(30)),
            //         child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //             children: [

            //             ]),
            //       ),
            //       SizedBox(
            //         width: 16,
            //       ),

            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Container(
                  //   // margin: EdgeInsets.only(top: size.height / 1.8),
                  //   // height: size.height / 0.9,
                  //   child: Image.asset(
                  //     'lib/Image/Balloon.png',
                  //   ),
                  // ),
                  Container(
                    margin: EdgeInsets.only(
                      top: size.height / 1.7,
                      left: 20,
                    ),
                    child: Row(
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              style: TextStyle(
                                fontFamily: "Century",
                                wordSpacing: 2,
                                // letterSpacing: 1,
                                color: Color(0xffffffff),
                                fontSize: 22,
                                // fontWeight: FontWeight.bold
                              ),
                              children: [
                                TextSpan(text: 'From the '),
                                TextSpan(
                                    text: 'latest ',
                                    style: TextStyle(color: Color(0xffFF9800))),
                                TextSpan(text: 'to the\n '),
                                TextSpan(
                                    text: 'greatest ',
                                    style: TextStyle(color: Color(0xffFF9800))),
                                TextSpan(
                                    text:
                                        'hits, play your \n favorite tracks on '),
                                TextSpan(
                                    text: 'doob\n ',
                                    style: TextStyle(color: Color(0xffFF9800))),
                                TextSpan(text: 'now!'),
                              ]),
                        ),

                        // Text(
                        //   'From the latest to the\n greastest hits, play your\n favorite tracks on doob\n now!',
                        //   textAlign: TextAlign.center,
                        //   style: TextStyle(
                        //       fontSize: 20,
                        //       fontFamily: 'Century',
                        //       color: Colors.white),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Get.off(SignIn());
                      // Navigator.pushNamed(context, '/signIn');
                    },
                    child: Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Color(0xffff9800),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Text(
                          'Get Started',
//'Get Started'.tr,
                          style: TextStyle(
                              fontFamily: 'Century',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

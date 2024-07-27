import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../MusicPlayer/MusicPlayerNew.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({
    super.key,
  });

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                                // Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            Text(
                              'Notification',
                              // textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Century',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.more_vert,
                                size: 25,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 90),
                        child: Image.asset(
                          'assets/Image/bell_off.png',
                          width: 100,
                          height: 100,
                        ),
                      ),
                      Text(
                        'Noting Here Right Now ! ! !',
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Century',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xffff9800)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Tag the notification setting button\n below and check again',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Century',
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Albums extends StatelessWidget {
  const Albums({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.off(() => MusicPlayerNew());
        //Get.off(NewReleaseMoreDetails());

        //  Navigator.pushNamed(context, '/NewReleaseMoreDetails');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          // decoration: BoxDecoration(
          //   color: Colors.grey.withOpacity(0.4),
          //   color: Color.fromARGB(255, 194, 211, 226),
          //   borderRadius: const BorderRadius.all(
          //     Radius.circular(10),
          //   ),
          // ),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/Image/joji.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'grainy days',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Century",
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    Text(
                      'Joji',
                      style: TextStyle(
                          color: Color(0xff8A9A9D),
                          fontFamily: "Century",
                          // fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/favoriteDetails');
                },
                child: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}

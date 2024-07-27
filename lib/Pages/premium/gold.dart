import 'package:flutter/material.dart';

class GoldScreen extends StatefulWidget {
  const GoldScreen({super.key});

  @override
  State<GoldScreen> createState() => _GoldScreenState();
}

class _GoldScreenState extends State<GoldScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(left: 16, right: 16, top: 70),
            child: Container(
              padding: EdgeInsets.all(16),
              // margin: EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).size.height * 0.75,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  color: Color(0xffC9940D),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                  //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 90,
                    ),
                    Center(
                      child: Text(
                        'Gold Member',
                        style: TextStyle(
                            fontFamily: 'Century',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.done,
                          color: Colors.white,
                        ),
                        Text(
                          '6 Months Full Access',
                          style: TextStyle(
                              fontFamily: 'Century',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 12),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.done,
                          color: Colors.white,
                        ),
                        Text(
                          'High Quality songs',
                          style: TextStyle(
                              fontFamily: 'Century',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 12),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.done,
                          color: Colors.white,
                        ),
                        Text(
                          'Exclusive songs',
                          style: TextStyle(
                              fontFamily: 'Century',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 12),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.done,
                          color: Colors.white,
                        ),
                        Text(
                          'Background play music',
                          style: TextStyle(
                              fontFamily: 'Century',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 12),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.done,
                          color: Colors.white,
                        ),
                        Text(
                          'Listen full songs',
                          style: TextStyle(
                              fontFamily: 'Century',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 12),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.done,
                          color: Colors.white,
                        ),
                        Text(
                          'Follow artist & other user',
                          style: TextStyle(
                              fontFamily: 'Century',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 12),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.done,
                          color: Colors.white,
                        ),
                        Text(
                          'Create own playlists',
                          style: TextStyle(
                              fontFamily: 'Century',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 12),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.done,
                          color: Colors.white,
                        ),
                        Text(
                          'Ad-free music Listening',
                          style: TextStyle(
                              fontFamily: 'Century',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 12),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.done,
                          color: Colors.white,
                        ),
                        Text(
                          'Share songs, albums, playlists and \nartists',
                          style: TextStyle(
                              fontFamily: 'Century',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 12),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.done,
                          color: Colors.white,
                        ),
                        Text(
                          'Download songs on 1 device',
                          style: TextStyle(
                              fontFamily: 'Century',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 12),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.done,
                          color: Colors.white,
                        ),
                        Text(
                          'Cancel anytime',
                          style: TextStyle(
                              fontFamily: 'Century',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color(0xffff9800),
                                Colors.white,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          color: Color(0xffff9800),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            '15 USD',
                            style: TextStyle(
                                fontFamily: 'Century',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Center(
                      child: Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Color(0xffff9800),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            'Subscribe Now',
                            style: TextStyle(
                                fontFamily: 'Century',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/Image/GoldMember.png'),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

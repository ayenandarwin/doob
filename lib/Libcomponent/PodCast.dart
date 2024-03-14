import 'dart:ffi';

import 'package:flutter/material.dart';

class Podcast extends StatefulWidget {
  const Podcast({super.key});

  @override
  State<Podcast> createState() => _PodcastState();
}

class _PodcastState extends State<Podcast> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 20,
      ),
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.white,
                                    Color(0xffff9800),
                                    Color(0xffff9800),
                                  ],
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft),

                              borderRadius: BorderRadius.circular(100),
                              // color: Color(0xffff9800)
                            ),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Icon(Icons.favorite_border),
                            )),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        "Your Liked Podcasts",
                        style: TextStyle(
                            fontFamily: "Century",
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.swap_vert,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'A - Z',
                    style: TextStyle(
                        fontFamily: "Century",
                        fontSize: 14,
                        color: Color(0xffff9800),
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, right: 10, left: 10, bottom: 20),
              child: Container(
                child: Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/musicplayer');
                        },
                        child: PodCastCard()),
                    PodCastCard(),
                    PodCastCard(),
                    PodCastCard(),
                    PodCastCard(),
                    PodCastCard(),
                    PodCastCard(),
                    PodCastCard(),
                    PodCastCard(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PodCastCard extends StatelessWidget {
  const PodCastCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        child: Row(
          children: [
            Container(
              height: 70,
              width: 70,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'lib/Image/Eric.png',
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
                    'Mark Of NCT 127 Never Stops Talking,Can Anyone Fact Check This Convo?!',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Century",
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'DaeBak Show w/Eric Nam',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Color(0xff8A9A9D),
                      fontSize: 12,
                      fontFamily: "Century",
                      // fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

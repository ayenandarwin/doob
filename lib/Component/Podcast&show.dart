import 'dart:ffi';

import 'package:doob/MusicPlayer/MusicPlayer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PodcastAndShow extends StatefulWidget {
  const PodcastAndShow({super.key});

  @override
  State<PodcastAndShow> createState() => _PodcastAndShowState();
}

class _PodcastAndShowState extends State<PodcastAndShow> {
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
              padding: const EdgeInsets.only(
                right: 0,
                left: 0,
              ),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmallPodcastAndShowCard(),
                        SizedBox(
                          width: 8,
                        ),
                        SmallPodcastAndShowCard()
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmallPodcastAndShowCard(),
                        SizedBox(
                          width: 8,
                        ),
                        SmallPodcastAndShowCard()
                      ],
                    ),
                    // GestureDetector(
                    //     onTap: () {
                    //       Navigator.of(context).pushNamed('/musicplayer');
                    //     },
                    //     child: PodcastAndShowCard()),
                    // PodcastAndShowCard(),
                    // PodcastAndShowCard(),
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

class PodcastAndShowCard extends StatelessWidget {
  const PodcastAndShowCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => MusicPlayer());
      },
      child: Padding(
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
                      height: 5,
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
      ),
    );
  }
}

class SmallPodcastAndShowCard extends StatelessWidget {
  const SmallPodcastAndShowCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => MusicPlayer());
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.46,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Container(
            decoration: BoxDecoration(
              // color: Colors.grey.withOpacity(0.4),
              color: Colors.white.withOpacity(0.15),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'lib/Image/Eric.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
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
        ),
      ),
    );
  }
}

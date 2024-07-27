import 'dart:ffi';

import 'package:doob/MusicPlayer/MusicPlayer.dart';
import 'package:doob/MusicPlayer/MusicPlayerNew.dart';
import 'package:doob/services/homeFourPodcastProvider.dart';
import 'package:doob/services/homeFourSongProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
        //color: Colors.grey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 16,
                  // right: 10, left: 10,
                  bottom: 20),
              child: Consumer(
                builder: (context, ref, child) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.09,
                    // // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    // decoration: BoxDecoration(
                    //   // color: Colors.grey.withOpacity(0.4),
                    //   color: Colors.white.withOpacity(0.15),
                    //   borderRadius: const BorderRadius.all(
                    //     Radius.circular(10),
                    //   ),
                    // ),
                    //   ref.watch()
                    child: ref.watch(homeFourPodcastServiceProvider).when(
                        data: (fourSongList) {
                      return Container(
                        width: MediaQuery.of(context).size.width,

                        // padding:
                        //     EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        // decoration: BoxDecoration(
                        //   // color: Colors.grey.withOpacity(0.4),
                        //   color: Colors.white.withOpacity(0.15),
                        //   borderRadius: const BorderRadius.all(
                        //     Radius.circular(10),
                        //   ),
                        // ),
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                2, // Adjust the number of columns as needed
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio:
                                2.3, // Adjust the aspect ratio as needed
                          ),
                          // scrollDirection: Axis.horizontal,
                          itemCount: fourSongList!.data!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 0),
                              child: Container(
                                //   width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  // color: Colors.grey.withOpacity(0.4),
                                  color: Colors.white.withOpacity(0.15),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Row(children: [
                                  SizedBox(
                                    height: 70,
                                    width: 70,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        //artistList.data![index].name!,

                                        fourSongList.data![index].cover_photo!,

                                        // 'assets/Image/joji.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 20,
                                  // ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(top: 14),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 6),
                                      //   width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            fourSongList.data![index].name!,
                                            //'Beautiful, You Are',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            softWrap: false,
                                            style: TextStyle(
                                                fontFamily: "Century",
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 14),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '   Ruby Amanfu',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            softWrap: false,
                                            style: TextStyle(
                                                fontFamily: "Century",
                                                // fontWeight: FontWeight.bold,
                                                color: Color(0xff8A9A9D),
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ]),
                              ),
                            );
                          },
                        ),
                      );
                    }, error: (Object error, StackTrace stackTrace) {
                      return Text('$error');
                    }, loading: () {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
                  );
                },
                // child:
              ),
              //  Container(
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           SmartCard(),
              //           SizedBox(
              //             width: 8,
              //           ),
              //           SmartCard()
              //         ],
              //       ),
              //       SizedBox(
              //         height: 8,
              //       ),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           SmartCard(),
              //           SizedBox(
              //             width: 8,
              //           ),
              //           SmartCard()
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
            )
          ],
        ),
      ),
      // Container(
      //   child: Column(
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.only(
      //           right: 0,
      //           left: 0,
      //         ),
      //         child: Container(
      //           child: Column(
      //             children: [
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   SmallPodcastAndShowCard(),
      //                   SizedBox(
      //                     width: 8,
      //                   ),
      //                   SmallPodcastAndShowCard()
      //                 ],
      //               ),

      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   SmallPodcastAndShowCard(),
      //                   SizedBox(
      //                     width: 8,
      //                   ),
      //                   SmallPodcastAndShowCard()
      //                 ],
      //               ),
      //               // GestureDetector(
      //               //     onTap: () {
      //               //       Navigator.of(context).pushNamed('/musicplayer');
      //               //     },
      //               //     child: PodcastAndShowCard()),
      //               // PodcastAndShowCard(),
      //               // PodcastAndShowCard(),
      //             ],
      //           ),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
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
        Get.to(() => MusicPlayerNew());
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
                    'assets/Image/Eric.png',
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
        Get.to(() => MusicPlayerNew());
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
                      'assets/Image/Eric.png',
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

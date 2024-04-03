import 'package:doob/Component/NewReleaseMoreDetails.dart';
import 'package:doob/Component/song.dart';
import 'package:doob/Libcomponent/AlbumsTabs.dart';
import 'package:doob/Libcomponent/Artist.dart';
import 'package:doob/Libcomponent/Tracks.dart';
import 'package:doob/MusicPlayer/MusicPlayer.dart';
import 'package:doob/services/albumIdServiceProvider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class NewReleaseDetails extends StatefulWidget {
  // final String? id;
  // final String? name;
  // final String? type;
  // final String? coverPhoto;

  const NewReleaseDetails({
    super.key,
  });

  @override
  State<NewReleaseDetails> createState() => _NewReleaseDetailsState();
}

class _NewReleaseDetailsState extends State<NewReleaseDetails> {
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
                              'NewReleases',
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
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigator.pushNamed(context, '/search');
                                // Get.off(SongPlayScreen());
                              },
                              child: Icon(
                                Icons.more_vert,
                                size: 25,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),

                      // ref
                      //     .watch(albumIdServiceProvider(widget.id.toString()))
                      //     .when(data: (albumIdList)
                      //     {
                      //   return Column(
                      //     children: [
                      //       Container(
                      //         padding: EdgeInsets.symmetric(
                      //           vertical: 20,
                      //         ),
                      //         child: ClipRRect(
                      //           borderRadius: BorderRadius.circular(10),
                      //           child: Image.network(
                      //             widget.coverPhoto!,
                      //             height: 210,
                      //             width: 210,

                      //             errorBuilder: (BuildContext context,
                      //                 Object exception,
                      //                 StackTrace? stackTrace) {
                      //               // This function is called when the image fails to load
                      //               // Return a new widget to display a dummy image from the internet
                      //               return Image.network(
                      //                 'https://media.istockphoto.com/photos/music-picture-id535427404?k=6&m=535427404&s=612x612&w=0&h=en1c7qslpGsVRkrTUHPvBNmA61gPUXl_v8ABMgQoZPY=',
                      //                 width: 210,
                      //                 height: 210,
                      //                 // scale: 1.0,
                      //               );
                      //             },

                      //             // 'lib/Image/joji.png',
                      //             fit: BoxFit.cover,
                      //           ),
                      //           // Image.asset(
                      //           //   'lib/Image/middle.jpg',
                      //           //   fit: BoxFit.cover,
                      //           //   height: 210,
                      //           //   width: 210,
                      //           // ),
                      //         ),
                      //       ),
                      //       Text(
                      //         // albumIdList,
                      //         //widget.id.
                      //         widget.name!,

                      //         // 'Lofi Lofi',
                      //         // textAlign: TextAlign.center,
                      //         style: TextStyle(
                      //             fontFamily: 'Century',
                      //             fontWeight: FontWeight.bold,
                      //             fontSize: 20,
                      //             color: Colors.white),
                      //       ),
                      //       SizedBox(
                      //         height: 2,
                      //       ),
                      //       Text(
                      //         widget.type!,
                      //         //'soft, chill, dreamy, lo-fi beats',
                      //         // textAlign: TextAlign.center,
                      //         style: TextStyle(
                      //           fontFamily: 'Century',
                      //           fontSize: 12,
                      //           color: Color(0xff8A9A9D),
                      //         ),
                      //       ),
                      //       ListView.builder(
                      //           scrollDirection: Axis.vertical,
                      //           shrinkWrap: true,
                      //           // itemCount: albumIdList!.data!.length,
                      //           itemCount: albumIdList!.data!.songs!.length,
                      //           itemBuilder: (context, index) {
                      //             print(
                      //                 'Album Id Length ${albumIdList.data!.songs!.length}');
                      //             if (
                      //                 // albumIdList.data!['songs'] == null
                      //                 albumIdList.data!.songs!.isEmpty) {
                      //               return Padding(
                      //                 padding: const EdgeInsets.only(
                      //                     top: 20,
                      //                     left: 10,
                      //                     right: 10,
                      //                     bottom: 30),
                      //                 child: Container(
                      //                   child: Column(
                      //                     children: [
                      //                       Albums(),
                      //                       Albums(),
                      //                       Albums(),
                      //                       Albums(),
                      //                       Albums(),
                      //                       Albums(),
                      //                       Albums(),
                      //                       Albums(),
                      //                       Albums(),
                      //                       Albums(),
                      //                     ],
                      //                   ),
                      //                 ),
                      //               );
                      //               // Container(
                      //               //   height: 300,
                      //               //   color: Colors.orange,
                      //               // );
                      //             } else {
                      //               return InkWell(
                      //                 onTap: (() {}),
                      //                 child: Padding(
                      //                   padding: const EdgeInsets.symmetric(
                      //                       vertical: 10),
                      //                   child: Container(
                      //                     child: Row(
                      //                       children: [
                      //                         Container(
                      //                           height: 70,
                      //                           width: 70,
                      //                           child: ClipRRect(
                      //                             borderRadius:
                      //                                 BorderRadius.circular(8),
                      //                             child: Image.network(
                      //                               albumIdList
                      //                                   .data!
                      //                                   .songs![index]
                      //                                   .cover_photo!,

                      //                               errorBuilder:
                      //                                   (BuildContext context,
                      //                                       Object exception,
                      //                                       StackTrace?
                      //                                           stackTrace) {
                      //                                 // This function is called when the image fails to load
                      //                                 // Return a new widget to display a dummy image from the internet
                      //                                 return Image.network(
                      //                                   'https://media.istockphoto.com/photos/music-picture-id535427404?k=6&m=535427404&s=612x612&w=0&h=en1c7qslpGsVRkrTUHPvBNmA61gPUXl_v8ABMgQoZPY=',
                      //                                   width: 50,
                      //                                   height: 50,
                      //                                 );
                      //                               },
                      //                               // 'lib/Image/joji.png',
                      //                               fit: BoxFit.cover,
                      //                             ),
                      //                           ),
                      //                         ),
                      //                         SizedBox(
                      //                           width: 20,
                      //                         ),
                      //                         Expanded(
                      //                           flex: 4,
                      //                           child: Column(
                      //                             crossAxisAlignment:
                      //                                 CrossAxisAlignment.start,
                      //                             children: [
                      //                               Text(
                      //                                 // 'SMITHREENS',
                      //                                 albumIdList.data!
                      //                                     .songs![index].name!
                      //                                     .toString(),

                      //                                 style: TextStyle(
                      //                                     color: Colors.white,
                      //                                     fontFamily: "Century",
                      //                                     fontWeight:
                      //                                         FontWeight.bold,
                      //                                     fontSize: 14),
                      //                               ),
                      //                               Text(
                      //                                 albumIdList.data!
                      //                                     .songs![index].type!
                      //                                     .toString(),

                      //                                 //    'Joji',
                      //                                 style: TextStyle(
                      //                                     color:
                      //                                         Color(0xff8A9A9D),
                      //                                     fontFamily: "Century",
                      //                                     // fontWeight: FontWeight.bold,
                      //                                     fontSize: 12),
                      //                               )
                      //                             ],
                      //                           ),
                      //                         )
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 ),
                      //               );
                      //             }
                      //           }),

                      //       Padding(
                      //         padding: const EdgeInsets.only(
                      //             top: 20, left: 10, right: 10, bottom: 30),
                      //         child: Container(
                      //           child: Column(
                      //             children: [
                      //               Albums(),
                      //               Albums(),
                      //               Albums(),
                      //               Albums(),
                      //               Albums(),
                      //               Albums(),
                      //               Albums(),
                      //               Albums(),
                      //               Albums(),
                      //               Albums(),
                      //             ],
                      //           ),
                      //         ),
                      //       )
                      //     ],
                      //   );
                      // }, error: (Object error, StackTrace stackTrace) {
                      //   return Text('$error');
                      // }, loading: () {
                      //   return Center(
                      //     child: CircularProgressIndicator(),
                      //   );
                      // }),

                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 20,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'lib/Image/middle.jpg',
                                fit: BoxFit.cover,
                                height: 210,
                                width: 210,
                              ),
                            ),
                          ),
                          Text(
                            'Lofi Lofi',
                            // textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Century',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'soft, chill, dreamy, lo-fi beats',
                            // textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Century',
                              fontSize: 12,
                              color: Color(0xff8A9A9D),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 10, right: 10, bottom: 30),
                            child: Container(
                              child: Column(
                                children: [
                                  Albums(),
                                  Albums(),
                                  Albums(),
                                  Albums(),
                                  Albums(),
                                  Albums(),
                                  Albums(),
                                  Albums(),
                                  Albums(),
                                  Albums(),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            // child:
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
        Get.off(() => MusicPlayer());
        //Get.off(NewReleaseMoreDetails());

        //  Navigator.pushNamed(context, '/NewReleaseMoreDetails');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          // decoration: BoxDecoration(
          //   // color: Colors.grey.withOpacity(0.4),
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
                    'lib/Image/joji.png',
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

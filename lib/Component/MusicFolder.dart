import 'package:doob/MusicPlayer/MusicPlayer.dart';
import 'package:doob/services/homeFourSongProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../MusicPlayer/MusicPlayerNew.dart';

class MusicFolder extends StatefulWidget {
  const MusicFolder({super.key});

  @override
  State<MusicFolder> createState() => _MusicFolderState();
}

class _MusicFolderState extends State<MusicFolder> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  height: MediaQuery.of(context).size.height * 0.19,
                  // // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  // decoration: BoxDecoration(
                  //   // color: Colors.grey.withOpacity(0.4),
                  //   color: Colors.white.withOpacity(0.15),
                  //   borderRadius: const BorderRadius.all(
                  //     Radius.circular(10),
                  //   ),
                  // ),
                  //   ref.watch()
                  child: ref.watch(homeFourSongServiceProvider).when(
                      data: (fourSongList) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.height * 0.11,
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
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                                //   height: 30,
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
    );
  }
}

// class FloderCard extends StatelessWidget {
//   const FloderCard({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       //width: MediaQuery.of(context).size.width * 0.4,
//       // decoration: BoxDecoration(
//       //   // color: Colors.grey.withOpacity(0.4),
//       //   color: Color.fromARGB(255, 194, 211, 226),
//       //   borderRadius: const BorderRadius.all(
//       //     Radius.circular(10),
//       //   ),
//       // ),
//       child: Row(
//         children: [
//           Container(
//             height: 70,
//             width: 70,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child: Image.asset(
//                 'assets/Image/joji.png',
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 10,
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Beautiful, You Are',
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 1,
//                 softWrap: false,
//                 style: TextStyle(
//                     fontFamily: "Century",
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                     fontSize: 14),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Text(
//                 'Ruby Amanfu',
//                 overflow: TextOverflow.ellipsis,
//                 softWrap: false,
//                 style: TextStyle(
//                     fontFamily: "Century",
//                     // fontWeight: FontWeight.bold,
//                     color: Color(0xff8A9A9D),
//                     fontSize: 12),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

// class SmartCard extends StatelessWidget {
//   const SmartCard({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Get.to(() => MusicPlayerNew());
//       },
//       child: Consumer(
//         builder: (context, ref, child) {
//           return Container(
//             width: MediaQuery.of(context).size.width * 0.46,
//             height: MediaQuery.of(context).size.height * 0.07,
//             // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//             decoration: BoxDecoration(
//               // color: Colors.grey.withOpacity(0.4),
//               color: Colors.white.withOpacity(0.15),
//               borderRadius: const BorderRadius.all(
//                 Radius.circular(10),
//               ),
//             ),
//             //   ref.watch()
//             child: ref.watch(homeFourSongServiceProvider).when(
//                 data: (fourSongList) {
//               return GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2, // Adjust the number of columns as needed
//                   crossAxisSpacing: 5,
//                   mainAxisSpacing: 5,
//                   childAspectRatio: 0.9, // Adjust the aspect ratio as needed
//                 ),
//                 // scrollDirection: Axis.horizontal,
//                 itemCount: fourSongList!.data!.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     // leading: Container(
//                     //   height: 50,
//                     //   width: 50,
//                     //   child: ClipRRect(
//                     //     borderRadius: BorderRadius.circular(8),
//                     //     child: Image.network(
//                     //       //artistList.data![index].name!,

//                     //       fourSongList.data![index].cover_photo!,

//                     //       // 'assets/Image/joji.png',
//                     //       fit: BoxFit.cover,
//                     //     ),
//                     //   ),
//                     // ),
//                     title: Text(
//                       fourSongList.data![index].name!,
//                       // 'Beautiful, You Are',
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 1,
//                       softWrap: false,
//                       style: TextStyle(
//                           fontFamily: "Century",
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                           fontSize: 14),
//                     ),
//                     subtitle: Text(
//                       'Ruby Amanfu',
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 1,
//                       softWrap: false,
//                       style: TextStyle(
//                           fontFamily: "Century",
//                           // fontWeight: FontWeight.bold,
//                           color: Color(0xff8A9A9D),
//                           fontSize: 12),
//                     ),
//                   );
//                   // Row(
//                   //   children: [
//                   //     Container(
//                   //       height: 50,
//                   //       width: 50,
//                   //       child: ClipRRect(
//                   //         borderRadius: BorderRadius.circular(8),
//                   //         child: Image.network(
//                   //           //artistList.data![index].name!,

//                   //           fourSongList.data![index].cover_photo!,

//                   //           // 'assets/Image/joji.png',
//                   //           fit: BoxFit.cover,
//                   //         ),
//                   //       ),
//                   //     ),
//                   //     SizedBox(
//                   //       width: 10,
//                   //     ),
//                   //     Container(
//                   //       width: MediaQuery.of(context).size.width * 0.2,
//                   //       child: Column(
//                   //         crossAxisAlignment: CrossAxisAlignment.start,
//                   //         children: [
//                   //           Text(
//                   //             fourSongList.data![index].name!,
//                   //             // 'Beautiful, You Are',
//                   //             overflow: TextOverflow.ellipsis,
//                   //             maxLines: 1,
//                   //             softWrap: false,
//                   //             style: TextStyle(
//                   //                 fontFamily: "Century",
//                   //                 fontWeight: FontWeight.bold,
//                   //                 color: Colors.white,
//                   //                 fontSize: 14),
//                   //           ),
//                   //           // SizedBox(
//                   //           //   height: 5,
//                   //           // ),
//                   //           Text(
//                   //             'Ruby Amanfu',
//                   //             overflow: TextOverflow.ellipsis,
//                   //             maxLines: 1,
//                   //             softWrap: false,
//                   //             style: TextStyle(
//                   //                 fontFamily: "Century",
//                   //                 // fontWeight: FontWeight.bold,
//                   //                 color: Color(0xff8A9A9D),
//                   //                 fontSize: 12),
//                   //           ),
//                   //         ],
//                   //       ),
//                   //     )
//                   //   ],
//                   // );
//                 },
//               );
//             }, error: (Object error, StackTrace stackTrace) {
//               return Text('$error');
//             }, loading: () {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }),
//           );
//         },
//         // child:
//       ),
//     );
//   }
// }

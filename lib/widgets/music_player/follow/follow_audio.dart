import 'package:doob/Component/playerButton.dart';
import 'package:doob/MusicPlayer/MusicPlayerNew.dart';
import 'package:doob/MusicPlayer/Pause.dart';
import 'package:doob/src/presentation/widgets/comment/cmt_widget.dart';
import 'package:doob/src/providers/wave_icon_provider/wave_icon_provider.dart';
import 'package:doob/widgets/common/music_background_image.dart';
import 'package:doob/widgets/common/option.dart';
import 'package:doob/widgets/music_player/follow/follow_video_detail.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';

class FollowAudioScreen extends ConsumerStatefulWidget {
  const FollowAudioScreen(this._musicData, {super.key});

  final List _musicData;

  @override
  _FollowAudioScreenState createState() => _FollowAudioScreenState();
}

class _FollowAudioScreenState extends ConsumerState<FollowAudioScreen> {
  PageController musicController = PageController();
  late AudioPlayer _audioPlayer;
  bool _isShuffleMode = false;
  bool _isRepeatMode = false;

  bool isReact = true;
  var commentid;
  bool isrepeat = true;
  int? favCount;

  @override
  void initState() {
    _audioPlayer = AudioPlayer();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _toggleShuffleRepeat() {
    setState(() {
      if (!_isShuffleMode && !_isRepeatMode) {
        _isShuffleMode = true;
        _audioPlayer.setShuffleModeEnabled(true);
      } else if (_isShuffleMode) {
        _isShuffleMode = false;
        _isRepeatMode = true;
        _audioPlayer.setShuffleModeEnabled(false);
        _audioPlayer.setLoopMode(LoopMode.one);
      } else if (_isRepeatMode) {
        _isRepeatMode = false;
        _audioPlayer.setLoopMode(LoopMode.off);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final audioLists = widget._musicData!
        .where((item) => item.type.toString() == 'song')
        .toList();
    print("Song list data : ${widget._musicData}");
    return InkWell(
      onTap: () {
        if (_audioPlayer.playing) {
          _audioPlayer.pause();

          ref.read(waveIconTapChangeProvider.notifier).isAudioPlay(false);
          ref.read(pauseChangeProvider.notifier).isAudioPlay(true);
        } else {
          _audioPlayer.play();
          ref.read(waveIconTapChangeProvider.notifier).isAudioPlay(true);
          ref.read(pauseChangeProvider.notifier).isAudioPlay(false);
        }
      },
      child: 
      GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Adjust the number of columns as needed
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: 0.7, // Adjust the aspect ratio as needed
        ),
        // scrollDirection: Axis.horizontal,
        itemCount: audioLists.length,
        itemBuilder: (context, index) {
          favCount = widget._musicData[index].likeCount;
          _audioPlayer
              .setAudioSource(ConcatenatingAudioSource(children: [
            AudioSource.uri(Uri.parse('${audioLists[index].audio}')),
          ]))
              .catchError((error) {
            if (kDebugMode) {
              print("An error occured $error");
            }
            return null;
          });

          return Consumer(
            builder: (context, ref, child) {
              return Stack(
                children: [
                  MusicBackgroundImage(
                    imageUrl: "${audioLists[index].coverPhoto}",
                  ),
                  // Positioned(
                  //   left: 300,
                  //   // top: size.height * 0.34,
                  //   top: size.height * 0.27,
                  //   //top: 250,
                  //   child: Column(
                  //     children: [
                  //       InkWell(
                  //         onTap: () {
                  //           Get.to(() => FollowDetailScreen(audioLists));
                  //         },
                  //         child: Stack(
                  //           children: [
                  //             Padding(
                  //               padding: const EdgeInsets.all(8.0),
                  //               child: ClipRRect(
                  //                 borderRadius: BorderRadius.circular(100),
                  //                 child: Image.asset(
                  //                   'assets/Image/jojipf.jpg',
                  //                   height: 45,
                  //                 ),
                  //               ),
                  //             ),
                  //             Positioned(
                  //               top: 40,
                  //               left: 19,
                  //               child: CircleAvatar(
                  //                 backgroundColor: Color(0xffff9800),
                  //                 radius: 10,
                  //                 child: Icon(
                  //                   Icons.add,
                  //                   fill: 0.5,
                  //                   size: 20,
                  //                   color: Colors.white,
                  //                 ),
                  //               ),
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.only(top: 6),
                  //         child: Option(
                  //           iconWidget: isReact
                  //               ? Icon(
                  //                   Icons.favorite,
                  //                   size: 40,
                  //                   color: Colors.white,
                  //                 )
                  //               : Icon(
                  //                   Icons.favorite,
                  //                   size: 40,
                  //                   color: Color(0xffff9800),
                  //                 ),
                  //           label: isReact
                  //               ? audioLists[index].likeCount.toString()
                  //               : "${audioLists[index].likeCount}",
                  //           onTap: () {
                  //             ref.read(favProvider.notifier).updateLikeCount(
                  //                 audioLists[index].id.toString());
                  //             // ref.invalidate(musicDetailProvider);
                  //             setState(() {
                  //               isReact = !isReact;
                  //             });
                  //             //ref.read(musicDetailProvider.notifier).fetchMusics();
                  //           },
                  //         ),
                  //       ),
                  //       Option(
                  //         iconWidget: Image.asset(
                  //           'assets/Icons/chat.png',
                  //           height: 30,
                  //         ),
                  //         label: audioLists[index].commentCount.toString(),
                  //         onTap: () {
                  //           commentid = audioLists[index].id;
                  //           // commentBottomSheet(context);
                  //           showModalBottomSheet(
                  //             isScrollControlled: true,
                  //             context: context,
                  //             builder: (context) {
                  //               return Container(
                  //                 height: 540,
                  //                 child: CmtWidget(
                  //                   id: audioLists[index].id.toString(),
                  //                 ),
                  //               );
                  //             },
                  //           );
                  //         },
                  //       ),
                  //       Option(
                  //         iconWidget: Image.asset(
                  //           'assets/Icons/paper.png',
                  //           height: 30,
                  //         ),
                  //         label: audioLists[index].shareCount.toString(),
                  //         onTap: () {
                  //           Share.share(audioLists[index].audio.toString());

                  //           //Share.share('com.example.doob');
                  //         },
                  //       ),
                  //       Option(
                  //         iconWidget: Image.asset(
                  //           'assets/Icons/downloading1.png',
                  //           height: 30,
                  //         ),
                  //         label: "0",
                  //         onTap: () {},
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.only(top: 8),
                  //         child: InkWell(
                  //             onTap: () {
                  //               setState(() {});
                  //               //  isrepeat = !isrepeat;
                  //               _toggleShuffleRepeat();
                  //             },
                  //             child:
                  //                 // isrepeat
                  //                 _isShuffleMode
                  //                     ? Image.asset(
                  //                         'assets/Icons/shuffle_copy.png',
                  //                         height: 30)
                  //                     : _isRepeatMode
                  //                         ? Image.asset(
                  //                             'assets/Icons/repeat.png',
                  //                             height: 30)
                  //                         : Image.asset(
                  //                             'assets/Icons/shuffle_copy.png',
                  //                             height: 30)),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Consumer(builder: (context, pauseRef, child) {
                    final pauseChange = pauseRef.watch(pauseChangeProvider);
                    return pauseChange
                        ? Center(
                            child: Icon(
                              Icons.play_arrow,
                              size: 30,
                              color: Colors.white38,
                            ),
                          )
                        : SizedBox.shrink();
                  }),
                  Container(
                    child: Consumer(builder: (context, waveIconRef, child) {
                      final tapChange =
                          waveIconRef.watch(waveIconTapChangeProvider);
                      return Container(
                        margin: EdgeInsets.only(
                            // top: size.height * 0.75),
                            top: size.height * 0.68),
                        child: Center(
                          child: Stack(
                            children: [
                              tapChange
                                  ? Positioned(
                                      top: 8,
                                      left: 40,
                                      child: Center(
                                        child: Container(
                                          width: size.width * 0.68,
                                          child: Lottie.asset(
                                            'assets/lottie/Animation - 1713755104463.json',
                                          ),
                                        ),
                                      ))
                                  : SizedBox.shrink(),
                              PlayerButtons(
                                  _audioPlayer, audioLists[index].lyric),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}



// import 'package:doob/Component/playerButton.dart';
// import 'package:doob/MusicPlayer/MusicPlayerNew.dart';
// import 'package:doob/MusicPlayer/Pause.dart';
// import 'package:doob/src/presentation/widgets/comment/cmt_widget.dart';
// import 'package:doob/src/providers/wave_icon_provider/wave_icon_provider.dart';
// import 'package:doob/widgets/common/music_background_image.dart';
// import 'package:doob/widgets/common/option.dart';
// import 'package:doob/widgets/music_player/follow/follow_video_detail.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:get/get.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:lottie/lottie.dart';
// import 'package:share_plus/share_plus.dart';

// class FollowAudioScreen extends ConsumerStatefulWidget {
//   const FollowAudioScreen(this._musicData, {super.key});

//   final List _musicData;

//   @override
//   _FollowAudioScreenState createState() => _FollowAudioScreenState();
// }

// class _FollowAudioScreenState extends ConsumerState<FollowAudioScreen> {
//   PageController musicController = PageController();
//   late AudioPlayer _audioPlayer;
//   bool _isShuffleMode = false;
//   bool _isRepeatMode = false;

//   bool isReact = true;
//   var commentid;
//   bool isrepeat = true;
//   int? favCount;

//   @override
//   void initState() {
//     _audioPlayer = AudioPlayer();

//     super.initState();
//   }

//   @override
//   void dispose() {
//     _audioPlayer.dispose();
//     super.dispose();
//   }

//   void _toggleShuffleRepeat() {
//     setState(() {
//       if (!_isShuffleMode && !_isRepeatMode) {
//         _isShuffleMode = true;
//         _audioPlayer.setShuffleModeEnabled(true);
//       } else if (_isShuffleMode) {
//         _isShuffleMode = false;
//         _isRepeatMode = true;
//         _audioPlayer.setShuffleModeEnabled(false);
//         _audioPlayer.setLoopMode(LoopMode.one);
//       } else if (_isRepeatMode) {
//         _isRepeatMode = false;
//         _audioPlayer.setLoopMode(LoopMode.off);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     final audioLists = widget._musicData
//         .where((item) => item.type.toString() == 'song')
//         .toList();
//     print("Song list data : ${widget._musicData}");
//     return InkWell(
//       onTap: () {
//         if (_audioPlayer.playing) {
//           _audioPlayer.pause();

//           ref.read(waveIconTapChangeProvider.notifier).isAudioPlay(false);
//           ref.read(pauseChangeProvider.notifier).isAudioPlay(true);
//         } else {
//           _audioPlayer.play();
//           ref.read(waveIconTapChangeProvider.notifier).isAudioPlay(true);
//           ref.read(pauseChangeProvider.notifier).isAudioPlay(false);
//         }
//       },
//       child: LayoutBuilder(
//         builder: (context, constraints) {
//           return ConstrainedBox(
//             constraints: BoxConstraints(
//               maxHeight: constraints.maxHeight,
//             ),
//             child: GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3, // Adjust the number of columns as needed
//                 crossAxisSpacing: 5,
//                 mainAxisSpacing: 5,
//                 childAspectRatio: 0.7, // Adjust the aspect ratio as needed
//               ),
//               itemCount: audioLists.length,
//               itemBuilder: (context, index) {
//                 favCount = widget._musicData[index].likeCount;
//                 _audioPlayer.setAudioSource(
//                   ConcatenatingAudioSource(children: [
//                     AudioSource.uri(Uri.parse('${audioLists[index].audio}')),
//                   ]),
//                 ).catchError((error) {
//                   if (kDebugMode) {
//                     print("An error occurred $error");
//                   }
//                   return null;
//                 });

//                 return Consumer(
//                   builder: (context, ref, child) {
//                     return Stack(
//                       children: [
//                         MusicBackgroundImage(
//                           imageUrl: "${audioLists[index].coverPhoto}",
//                         ),
//                         // You can uncomment and adjust the Positioned widgets if needed
//                         // Positioned(
//                         //   left: 300,
//                         //   top: size.height * 0.27,
//                         //   child: Column(
//                         //     children: [
//                         //       InkWell(
//                         //         onTap: () {
//                         //           Get.to(() => FollowDetailScreen(audioLists));
//                         //         },
//                         //         child: Stack(
//                         //           children: [
//                         //             Padding(
//                         //               padding: const EdgeInsets.all(8.0),
//                         //               child: ClipRRect(
//                         //                 borderRadius: BorderRadius.circular(100),
//                         //                 child: Image.asset(
//                         //                   'assets/Image/jojipf.jpg',
//                         //                   height: 45,
//                         //                 ),
//                         //               ),
//                         //             ),
//                         //             Positioned(
//                         //               top: 40,
//                         //               left: 19,
//                         //               child: CircleAvatar(
//                         //                 backgroundColor: Color(0xffff9800),
//                         //                 radius: 10,
//                         //                 child: Icon(
//                         //                   Icons.add,
//                         //                   fill: 0.5,
//                         //                   size: 20,
//                         //                   color: Colors.white,
//                         //                 ),
//                         //               ),
//                         //             )
//                         //           ],
//                         //         ),
//                         //       ),
//                         //       Padding(
//                         //         padding: const EdgeInsets.only(top: 6),
//                         //         child: Option(
//                         //           iconWidget: isReact
//                         //               ? Icon(
//                         //                   Icons.favorite,
//                         //                   size: 40,
//                         //                   color: Colors.white,
//                         //                 )
//                         //               : Icon(
//                         //                   Icons.favorite,
//                         //                   size: 40,
//                         //                   color: Color(0xffff9800),
//                         //                 ),
//                         //           label: isReact
//                         //               ? audioLists[index].likeCount.toString()
//                         //               : "${audioLists[index].likeCount}",
//                         //           onTap: () {
//                         //             ref.read(favProvider.notifier).updateLikeCount(
//                         //                 audioLists[index].id.toString());
//                         //             setState(() {
//                         //               isReact = !isReact;
//                         //             });
//                         //           },
//                         //         ),
//                         //       ),
//                         //       Option(
//                         //         iconWidget: Image.asset(
//                         //           'assets/Icons/chat.png',
//                         //           height: 30,
//                         //         ),
//                         //         label: audioLists[index].commentCount.toString(),
//                         //         onTap: () {
//                         //           commentid = audioLists[index].id;
//                         //           showModalBottomSheet(
//                         //             isScrollControlled: true,
//                         //             context: context,
//                         //             builder: (context) {
//                         //               return Container(
//                         //                 height: 540,
//                         //                 child: CmtWidget(
//                         //                   id: audioLists[index].id.toString(),
//                         //                 ),
//                         //               );
//                         //             },
//                         //           );
//                         //         },
//                         //       ),
//                         //       Option(
//                         //         iconWidget: Image.asset(
//                         //           'assets/Icons/paper.png',
//                         //           height: 30,
//                         //         ),
//                         //         label: audioLists[index].shareCount.toString(),
//                         //         onTap: () {
//                         //           Share.share(audioLists[index].audio.toString());
//                         //         },
//                         //       ),
//                         //       Option(
//                         //         iconWidget: Image.asset(
//                         //           'assets/Icons/downloading1.png',
//                         //           height: 30,
//                         //         ),
//                         //         label: "0",
//                         //         onTap: () {},
//                         //       ),
//                         //       Padding(
//                         //         padding: const EdgeInsets.only(top: 8),
//                         //         child: InkWell(
//                         //             onTap: () {
//                         //               setState(() {});
//                         //               _toggleShuffleRepeat();
//                         //             },
//                         //             child: _isShuffleMode
//                         //                 ? Image.asset(
//                         //                     'assets/Icons/shuffle_copy.png',
//                         //                     height: 30)
//                         //                 : _isRepeatMode
//                         //                     ? Image.asset(
//                         //                         'assets/Icons/repeat.png',
//                         //                         height: 30)
//                         //                     : Image.asset(
//                         //                         'assets/Icons/shuffle_copy.png',
//                         //                         height: 30)),
//                         //       ),
//                         //     ],
//                         //   ),
//                         // ),
//                         Consumer(builder: (context, pauseRef, child) {
//                           final pauseChange = pauseRef.watch(pauseChangeProvider);
//                           return pauseChange
//                               ? Center(
//                                   child: Icon(
//                                     Icons.play_arrow,
//                                     size: 30,
//                                     color: Colors.white38,
//                                   ),
//                                 )
//                               : SizedBox.shrink();
//                         }),
//                         Container(
//                           child: Consumer(builder: (context, waveIconRef, child) {
//                             final tapChange =
//                                 waveIconRef.watch(waveIconTapChangeProvider);
//                             return Container(
//                               margin: EdgeInsets.only(
//                                   top: size.height * 0.68),
//                               child: Center(
//                                 child: Stack(
//                                   children: [
//                                     tapChange
//                                         ? Positioned(
//                                             top: 8,
//                                             left: 40,
//                                             child: Center(
//                                               child: Container(
//                                                 width: size.width * 0.68,
//                                                 child: Lottie.asset(
//                                                   'assets/lottie/Animation - 1713755104463.json',
//                                                 ),
//                                               ),
//                                             ))
//                                         : SizedBox.shrink(),
//                                     PlayerButtons(
//                                         _audioPlayer, audioLists[index].lyric),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           }),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


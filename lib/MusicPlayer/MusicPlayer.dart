import 'dart:io';

import 'package:doob/Component/PlaylistMoreDetails.dart';
import 'package:doob/Component/playerButton.dart';
import 'package:doob/services/songServiceProvider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:just_audio/just_audio.dart';
import 'package:video_player/video_player.dart';
import 'package:share_plus/share_plus.dart';

class MusicPlayer extends ConsumerStatefulWidget {
  MusicPlayer({super.key});

  //   List<Color> colors = [
  //   Colors.blueAccent,
  //   Colors.greenAccent,
  //   Colors.yellowAccent,
  //   Colors.redAccent
  // ];

  // List<int> duration = [900, 700, 600, 800, 500];

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends ConsumerState<MusicPlayer> {
  PageController controller = PageController();
  PageController musicController = PageController();
  bool isPlaying = true;
  late MusicPlayer _controller;
  bool isicon = false;

  //bool isPaused = true;
  AppLifecycleState? stateChanged;

  List<Color> colors = [
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.yellowAccent,
    Colors.redAccent
  ];

  List<int> duration = [900, 700, 600, 800, 500];
  double _progressValue = 0.0;

  int currentindex = 0;
  double value = 50;

  late AudioPlayer _audioPlayer;
  late Duration? audioDuration;
  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    // initAudioPlayer();

    // _audioPlayer.positionStream.listen((position) {
    //   final duration = _audioPlayer.duration;
    //   //print('>>>>>>>>>>>>>>>>>>>>> $duration');
    //   if (duration != null) {
    //     if (mounted) {
    //       setState(() {
    //         _progressValue = position.inMilliseconds / duration.inMilliseconds;
    //       });
    //     }
    //   }
    // });

    // _audioPlayer.positionStream.listen((position) {
    //   //audioDuration = _audioPlayer.duration!;
    //   final duration = _audioPlayer.duration;

    //   if (duration != null) {
    //     if (mounted) {
    //       setState(() {
    //         _progressValue = position.inMilliseconds / duration.inMilliseconds;
    //       });
    //     }
    //   }
    // });
  }

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   if (state == AppLifecycleState.resumed) {
  //     if (isPaused) {
  //       isPaused = false;
  //       _audioPlayer.play();
  //     }
  //   } else if (state == AppLifecycleState.paused) {
  //     if (_audioPlayer.playing) {
  //       isPaused = true;
  //       _audioPlayer.pause();
  //     }
  //   }
  // }

  Future<void> initAudioPlayer() async {
    try {
      await _audioPlayer.play();
    } catch (e) {
      print('Error loading audio $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final audioDuration = _audioPlayer.duration;
    //  final audioList = ref.watch(songServiceProvider);

    // _audioPlayer
    //     .setAudioSource(ConcatenatingAudioSource(children: [
    //   AudioSource.uri(Uri.parse(''
    //       '${audioList.value!.data!.elementAt(3)}'
    //       //'https://ed-mypages.s3.amazonaws.com/mp3/${audioList.value!.audioBook!.mp3!.file}'
    //       )),
    // ]))
    //     .catchError((error) {
    //   // catch load errors: 404, invalid url ...
    //   if (kDebugMode) {
    //     print("An error occured $error");
    //   }
    //   return null;
    // });
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: InkWell(
            onTap: () async {
              // if (stateChanged == AppLifecycleState.resumed) {
              //   if (isPlaying) {
              //     isPlaying = false;
              //     _audioPlayer.play();
              //   }
              // } else if (stateChanged == AppLifecycleState.paused) {
              //   if (_audioPlayer.playing) {
              //     isPlaying = true;
              //     _audioPlayer.pause();
              //   }
              // }

              // if (isPlaying) {
              //    audioDuration = _audioPlayer.duration;

              //   _audioPlayer.pause();
              // } else {
              //   try {
              //     if (audioDuration != null) {
              //       await _audioPlayer.seek(audioDuration);
              //     }
              //     await _audioPlayer.play();
              //   } catch (e) {
              //     print("Error playing audio: $e");
              //   }
              // }

              if (isPlaying) {
                // audioDuration = _audioPlayer.duration;
                print(audioDuration);
                print("**************** not woriking");
                _audioPlayer.pause();
              } else {
                try {
                  print("play now");
                  print(audioDuration);
                  //  _audioPlayer.play();
                  _audioPlayer.seek(audioDuration).then((value) async {
                    await _audioPlayer.play();
                  });
                } catch (e) {
                  print('Error occur $e');
                  //  _audioPlayer.play();
                }
                setState(() {
                  isPlaying = !isPlaying;
                });
              }
            },
            child: Consumer(
              builder: (context, ref, child) {
                return Stack(
                  children: [
                    PageView(
                      controller: controller,
                      onPageChanged: (value) {
                        print(currentindex.toString() + 'bjasbfajbdfjbad');
                        setState(() {
                          currentindex = value;
                        });
                      },
                      children: [
                        ref.watch(songServiceProvider).when(data: (songList) {
                          return PageView.builder(
                            controller: musicController,
                            itemCount: songList!.data!.length,
                            itemBuilder: (context, index) {
                              // try {
                              //   _audioPlayer.setAudioSource(
                              //       ConcatenatingAudioSource(children: [
                              //     AudioSource.uri(Uri.parse(
                              //         '${audioList.value!.data![index].audio}'
                              //         //'https://ed-mypages.s3.amazonaws.com/mp3/${audioList.value!.audioBook!.mp3!.file}'
                              //         )),
                              //   ]));
                              // } on PlayerInterruptedException catch (e) {
                              //   if (kDebugMode) {
                              //     print('Exception $e');
                              //   }
                              //   return null;
                              // }

                              _audioPlayer
                                  .setAudioSource(
                                      ConcatenatingAudioSource(children: [
                                AudioSource.uri(Uri.parse(
                                    '${songList.data![index].audio}'
                                    //'https://ed-mypages.s3.amazonaws.com/mp3/${audioList.value!.audioBook!.mp3!.file}'
                                    )),
                              ]))
                                  .catchError((error) {
                                // catch load errors: 404, invalid url ...
                                if (kDebugMode) {
                                  print("An error occured $error");
                                }
                                return null;
                              });

                              return Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: Image.network(
                                      songList.data![index].cover_photo!,
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.21,

                                      errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace) {
                                        // This function is called when the image fails to load
                                        // Return a new widget to display a dummy image from the internet
                                        return Image.network(
                                          'https://cdn.wallpapersafari.com/64/93/hrC5Ge.jpg',
                                        );
                                      },
                                      // 'lib/Image/joji.png',
                                      fit: BoxFit.cover,
                                    ),
                                    //   Image.asset(
                                    //     'lib/Image/Eric.png',
                                    //     fit: BoxFit.cover,
                                    //   ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4),
                                              child: Stack(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 10),
                                                    child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                        child: Image.asset(
                                                          'lib/Image/jojipf.jpg',
                                                          height: 40,
                                                        )),
                                                  ),
                                                  Container(
                                                    height: 20,
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                      color: Colors.white,
                                                    ),
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.add,
                                                        size: 20,
                                                        color:
                                                            Color(0xffff9800),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.2),
                                                        blurRadius: 20)
                                                  ]),
                                              child: Column(
                                                children: [
                                                  InkWell(
                                                      onTap: () {
                                                        Get.to(() =>
                                                            PlaylistMoreDetails());
                                                        //Navigator.pushNamed(context, '/favoriteDetails');
                                                      },
                                                      child: Image.asset(
                                                        'lib/Icons/4.png',
                                                        height: 50,
                                                      )
                                                      // SvgPicture.asset('lib/Icons/love.svg',
                                                      //     height: 25),
                                                      ),
                                                  Text(
                                                    '5.3M',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: "Century",
                                                        fontSize: 14),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.2),
                                                        blurRadius: 20)
                                                  ]),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                    'lib/Icons/6.png',
                                                    height: 50,
                                                  ),
                                                  // SvgPicture.asset('lib/Icons/comment.svg', height: 25),
                                                  Text(
                                                    '5.3M',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: "Century",
                                                      fontSize: 14,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.2),
                                                        blurRadius: 20)
                                                  ]),
                                              child: Column(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      Share.share(
                                                          'com.example.doob');
                                                    },
                                                    child: Image.asset(
                                                      'lib/Icons/5.png',
                                                      height: 50,
                                                    ),
                                                  ),
                                                  //  SvgPicture.asset('lib/Icons/share.svg', height: 25),
                                                  Text(
                                                    '5.3M',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: "Century",
                                                        fontSize: 14),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.black
                                                              .withOpacity(0.2),
                                                          blurRadius: 20)
                                                    ]),
                                                child: Image.asset(
                                                  'lib/Icons/7.png',
                                                  height: 50,
                                                )
                                                //  SvgPicture.asset('lib/Icons/download.svg',
                                                //     height: 25),
                                                ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.black
                                                              .withOpacity(0.2),
                                                          blurRadius: 20)
                                                    ]),
                                                child: SvgPicture.asset(
                                                    'lib/Icons/repeat.svg',
                                                    height: 25),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.black
                                                              .withOpacity(0.2),
                                                          blurRadius: 20)
                                                    ]),
                                                child: SvgPicture.asset(
                                                    'lib/Icons/Shuffle.svg',
                                                    height: 25),
                                              ),
                                            ),
                                            Container(
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.black
                                                              .withOpacity(0.2),
                                                          blurRadius: 20)
                                                    ]),
                                                child: Image.asset(
                                                  'lib/Icons/8.png',
                                                  height: 50,
                                                )
                                                // SvgPicture.asset('lib/Icons/option.svg', height: 25),
                                                ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        // Padding(
                                        //   padding: const EdgeInsets.symmetric(
                                        //       horizontal: 5),
                                        //   child: Container(
                                        //     child: Row(
                                        //       children: [
                                        //         Text(
                                        //           '1:25',
                                        //           style: TextStyle(
                                        //             color: Colors.white,
                                        //             fontSize: 12,
                                        //           ),
                                        //         ),
                                        //         SizedBox(
                                        //           width: 10,
                                        //         ),
                                        //         Expanded(
                                        //           child: SliderTheme(
                                        //             data: const SliderThemeData(
                                        //               trackShape:
                                        //                   CustomSliderTrackShape(),
                                        //               trackHeight: 2,
                                        //               thumbShape:
                                        //                   RoundSliderThumbShape(
                                        //                       enabledThumbRadius:
                                        //                           4),
                                        //               overlayShape:
                                        //                   CustomSliderOverlayShape(),
                                        //             ),
                                        //             child: Slider(
                                        //               min: 0,
                                        //               max: 100,
                                        //               value: value,
                                        //               activeColor:
                                        //                   Color(0xffffff9800),
                                        //               onChanged: (v) =>
                                        //                   setState(() {
                                        //                 value = v;
                                        //               }),
                                        //             ),
                                        //           ),
                                        //         ),
                                        //         SizedBox(
                                        //           width: 10,
                                        //         ),
                                        //         Text(
                                        //           '3:55',
                                        //           style: TextStyle(
                                        //             color: Colors.white,
                                        //             fontSize: 12,
                                        //           ),
                                        //         ),
                                        //       ],
                                        //     ),
                                        //   ),
                                        // ),
                                        // isPlaying
                                        //     ? Lottie.asset(
                                        //         'asset/lottie/Animation - 1713755104463.json',
                                        //         width: size.width,
                                        //         height: 135)
                                        //     : Container(),

                                        // Container(
                                        //   height: 40,
                                        //   width: 200,
                                        //   decoration: BoxDecoration(
                                        //     color: Color(0xffff9800),
                                        //     borderRadius:
                                        //         BorderRadius.circular(25),
                                        //   ),
                                        //   child: Center(
                                        //     child: Text(
                                        //       'Lyrics',
                                        //       style: TextStyle(
                                        //           fontFamily: 'Century',
                                        //           fontSize: 14,
                                        //           fontWeight: FontWeight.bold,
                                        //           color: Colors.white),
                                        //     ),
                                        //   ),
                                        // ),

                                        PlayerButtons(_audioPlayer),
                                        SizedBox(
                                          height: 20,
                                        )
                                        // Padding(
                                        //   padding: const EdgeInsets.only(
                                        //       left: 10, right: 10, bottom: 20),
                                        //   child: GestureDetector(
                                        //     onTap: () {
                                        //       showDialog(
                                        //         context: context,
                                        //         builder: (context) => Padding(
                                        //           padding:
                                        //               const EdgeInsets.symmetric(
                                        //                   horizontal: 10,
                                        //                   vertical: 100),
                                        //           child: Container(
                                        //             height: 100,
                                        //             decoration: BoxDecoration(
                                        //                 borderRadius:
                                        //                     BorderRadius.circular(
                                        //                         10),
                                        //                 color:
                                        //                     Colors.transparent),
                                        //             child: Column(
                                        //               children: [
                                        //                 Row(
                                        //                   mainAxisAlignment:
                                        //                       MainAxisAlignment
                                        //                           .end,
                                        //                   children: [
                                        //                     GestureDetector(
                                        //                       onTap: () {
                                        //                         Navigator.of(
                                        //                                 context)
                                        //                             .pop();
                                        //                       },
                                        //                       child: Icon(
                                        //                         Icons.cancel,
                                        //                         color:
                                        //                             Colors.white,
                                        //                       ),
                                        //                     ),
                                        //                   ],
                                        //                 ),
                                        //                 Container(
                                        //                   decoration: BoxDecoration(
                                        //                       color:
                                        //                           Colors.black26,
                                        //                       borderRadius:
                                        //                           BorderRadius
                                        //                               .circular(
                                        //                                   15),
                                        //                       border: Border.all(
                                        //                           color: Colors
                                        //                               .white)),
                                        //                   padding: EdgeInsets
                                        //                       .symmetric(
                                        //                           horizontal: 10,
                                        //                           vertical: 10),
                                        //                   // color: Colors.black12,
                                        //                   child: Center(
                                        //                     child: Text(
                                        //                       'You are my sunshine, my only sunshine you make me happy when skies are gray you will never keep dear,how much I love you,please don\'t take my sunshine away.',
                                        //                       textAlign: TextAlign
                                        //                           .center,
                                        //                       style: TextStyle(
                                        //                         fontFamily:
                                        //                             'Century',
                                        //                         // wordSpacing: 2,
                                        //                         fontSize: 16,
                                        //                         fontWeight:
                                        //                             FontWeight
                                        //                                 .bold,
                                        //                         color:
                                        //                             Colors.white,
                                        //                       ),
                                        //                     ),
                                        //                   ),
                                        //                 ),
                                        //               ],
                                        //             ),
                                        //           ),
                                        //         ),
                                        //       );
                                        //     },
                                        //     child:
                                        // Container(
                                        //       height: 40,
                                        //       width: 200,
                                        //       decoration: BoxDecoration(
                                        //         color: Color(0xffff9800),
                                        //         borderRadius:
                                        //             BorderRadius.circular(25),
                                        //       ),
                                        //       child: Center(
                                        //         child: Text(
                                        //           'Lyrics',
                                        //           style: TextStyle(
                                        //               fontFamily: 'Century',
                                        //               fontSize: 14,
                                        //               fontWeight: FontWeight.bold,
                                        //               color: Colors.white),
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  )
                                ],
                              );
                            },
                            scrollDirection: Axis.vertical,
                            // children: [
                            //   MusicScreenCard(),
                            //   MusicScreenCard(),
                            //   MusicScreenCard(),
                            //   MusicScreenCard(),
                            //   MusicScreenCard(),
                            //   MusicScreenCard(),
                            //   MusicScreenCard(),
                            // ],
                          );
                        }, error: (Object error, StackTrace stackTrace) {
                          return Text('$error');
                        }, loading: () {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }),
                        PageView(
                          scrollDirection: Axis.vertical,
                          children: [
                            VideoScreenCard(),
                            VideoScreenCard(),
                            VideoScreenCard(),
                            VideoScreenCard(),
                            VideoScreenCard(),
                            VideoScreenCard(),
                            VideoScreenCard(),
                          ],
                        ),
                        PageView(
                          scrollDirection: Axis.vertical,
                          children: [
                            VideoForYouCard(),
                            VideoForYouCard(),
                            VideoForYouCard(),
                            VideoForYouCard(),
                            VideoForYouCard(),
                            VideoForYouCard(),
                            VideoForYouCard(),
                          ],
                        ),
                        PageView(
                          scrollDirection: Axis.vertical,
                          children: [
                            VideoFollowCard(),
                            VideoFollowCard(),
                            VideoFollowCard(),
                            VideoFollowCard(),
                            VideoFollowCard(),
                            VideoFollowCard(),
                            VideoFollowCard(),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            Colors.black.withOpacity(0.5),
                            Colors.transparent,
                          ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 10,
                                width: 20,
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if (currentindex != 0) {
                                          controller.animateToPage(0,
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.linear);
                                          setState(() {
                                            currentindex = 0;
                                          });
                                        }
                                      },
                                      child: Text(
                                        'Music',
                                        style: TextStyle(
                                            fontFamily: 'Century',
                                            color: currentindex == 0
                                                ? Color(0xffff9800)
                                                : Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (currentindex != 1) {
                                          controller.animateToPage(1,
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.linear);

                                          setState(() {
                                            currentindex = 1;
                                          });
                                        }
                                      },
                                      child: Text(
                                        'Video',
                                        style: TextStyle(
                                            fontFamily: 'Century',
                                            color: currentindex == 1
                                                ? Color(0xffff9800)
                                                : Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (currentindex != 2) {
                                          controller.animateToPage(2,
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.linear);
                                          setState(() {
                                            currentindex = 2;
                                          });
                                        }
                                      },
                                      child: Text(
                                        'For You',
                                        style: TextStyle(
                                            fontFamily: 'Century',
                                            color: currentindex == 2
                                                ? Color(0xffff9800)
                                                : Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (currentindex != 3) {
                                          controller.animateToPage(3,
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.linear);

                                          setState(() {
                                            currentindex = 3;
                                          });
                                        }
                                      },
                                      child: Text(
                                        'Follow',
                                        style: TextStyle(
                                            fontFamily: 'Century',
                                            color: currentindex == 3
                                                ? Color(0xffff9800)
                                                : Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.search,
                                size: 20,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          )),
    );
  }
}

class MusicScreenCard extends StatefulWidget {
  const MusicScreenCard({
    super.key,
  });

  @override
  State<MusicScreenCard> createState() => _MusicScreenCardState();
}

class _MusicScreenCardState extends State<MusicScreenCard> {
  double value = 50;
  bool isPlaying = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          child: Image.asset(
            'lib/Image/Eric.png',
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                'lib/Image/jojipf.jpg',
                                height: 40,
                              )),
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              size: 20,
                              color: Color(0xffff9800),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2), blurRadius: 20)
                    ]),
                    child: Column(
                      children: [
                        InkWell(
                            onTap: () {
                              Get.to(() => PlaylistMoreDetails());
                              //Navigator.pushNamed(context, '/favoriteDetails');
                            },
                            child: Image.asset(
                              'lib/Icons/4.png',
                              height: 50,
                            )
                            // SvgPicture.asset('lib/Icons/love.svg',
                            //     height: 25),
                            ),
                        Text(
                          '5.3M',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Century",
                              fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2), blurRadius: 20)
                    ]),
                    child: Column(
                      children: [
                        Image.asset(
                          'lib/Icons/6.png',
                          height: 50,
                        ),
                        // SvgPicture.asset('lib/Icons/comment.svg', height: 25),
                        Text(
                          '5.3M',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Century",
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2), blurRadius: 20)
                    ]),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Share.share('com.example.doob');
                          },
                          child: Image.asset(
                            'lib/Icons/5.png',
                            height: 50,
                          ),
                        ),
                        //  SvgPicture.asset('lib/Icons/share.svg', height: 25),
                        Text(
                          '5.3M',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Century",
                              fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20)
                      ]),
                      child: Image.asset(
                        'lib/Icons/7.png',
                        height: 50,
                      )
                      //  SvgPicture.asset('lib/Icons/download.svg',
                      //     height: 25),
                      ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20)
                      ]),
                      child:
                          SvgPicture.asset('lib/Icons/repeat.svg', height: 25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20)
                      ]),
                      child:
                          SvgPicture.asset('lib/Icons/Shuffle.svg', height: 25),
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20)
                      ]),
                      child: Image.asset(
                        'lib/Icons/8.png',
                        height: 50,
                      )
                      // SvgPicture.asset('lib/Icons/option.svg', height: 25),
                      ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  child: Row(
                    children: [
                      // Text(
                      //   '1:25',
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 12,
                      //   ),
                      // ),
                      // SizedBox(
                      //   width: 10,
                      // ),
                      // Expanded(
                      //   child: SliderTheme(
                      //     data: const SliderThemeData(
                      //       trackShape: CustomSliderTrackShape(),
                      //       trackHeight: 2,
                      //       thumbShape:
                      //           RoundSliderThumbShape(enabledThumbRadius: 4),
                      //       overlayShape: CustomSliderOverlayShape(),
                      //     ),
                      //     child: Slider(
                      //       min: 0,
                      //       max: 100,
                      //       value: value,
                      //       activeColor: Color(0xffffff9800),
                      //       onChanged: (v) => setState(() {
                      //         value = v;
                      //       }),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   width: 10,
                      // ),
                      // Text(
                      //   '3:55',
                      //   style: TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 12,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 100),
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.transparent),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Icon(
                                      Icons.cancel,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Center(
                                child: Text(
                                  'You are my sunshine, my only sunshine you make me happy when skies are gray you will never keep dear,how much I love you,please don\'t take my sunshine away.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Century',
                                    // wordSpacing: 2,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
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
                        'Lyrics',
                        style: TextStyle(
                            fontFamily: 'Century',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class CustomSliderTrackShape extends RoundedRectSliderTrackShape {
  const CustomSliderTrackShape();
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

class CustomSliderThumbShape extends RoundSliderThumbShape {
  const CustomSliderThumbShape({super.enabledThumbRadius = 10.0});

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    super.paint(context,
        center.translate(-(value - 0.5) / 0.5 * enabledThumbRadius, 0.0),
        activationAnimation: activationAnimation,
        enableAnimation: enableAnimation,
        isDiscrete: isDiscrete,
        labelPainter: labelPainter,
        parentBox: parentBox,
        sliderTheme: sliderTheme,
        textDirection: textDirection,
        value: value,
        textScaleFactor: textScaleFactor,
        sizeWithOverflow: sizeWithOverflow);
  }
}

class CustomSliderOverlayShape extends RoundSliderOverlayShape {
  final double enabledThumbRadius;
  const CustomSliderOverlayShape({this.enabledThumbRadius = 2});

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    super.paint(context,
        center.translate(-(value - 0.5) / 0.5 * enabledThumbRadius, 0.0),
        activationAnimation: activationAnimation,
        enableAnimation: enableAnimation,
        isDiscrete: isDiscrete,
        labelPainter: labelPainter,
        parentBox: parentBox,
        sliderTheme: sliderTheme,
        textDirection: textDirection,
        value: value,
        textScaleFactor: textScaleFactor,
        sizeWithOverflow: sizeWithOverflow);
  }
}

class VideoScreenCard extends StatefulWidget {
  const VideoScreenCard({
    super.key,
  });

  @override
  State<VideoScreenCard> createState() => _VideoScreenCardState();
}

class _VideoScreenCardState extends State<VideoScreenCard> {
  late VideoPlayerController _controller;
  bool isicon = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        if (mounted) {
          setState(() {});
          _controller.play();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            // height: double.infinity,
            child: Center(
          child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller)),
        )),
        GestureDetector(
          onTap: () async {
            if (_controller.value.isPlaying) {
              await _controller.pause();
            } else {
              await _controller.play();
            }
            setState(() {
              isicon = true;
            });
            await Future.delayed(Duration(milliseconds: 500));
            setState(() {
              isicon = false;
            });
          },
          child: Center(
            child: Container(
              color: Colors.transparent,
              height: double.infinity,
              width: double.infinity,
              child: Visibility(
                visible: isicon,
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 80,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                'lib/Image/jojipf.jpg',
                                height: 40,
                              )),
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              size: 20,
                              color: Color(0xffff9800),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20)
                      ]),
                      child: Column(
                        children: [
                          Image.asset('lib/Icons/love.png', height: 25),
                          Text(
                            '5.3M',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Century",
                                fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20)
                      ]),
                      child: Column(
                        children: [
                          Image.asset('lib/Icons/comment.png', height: 25),
                          Text(
                            '5.3M',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Century",
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20)
                      ]),
                      child: Column(
                        children: [
                          Image.asset('lib/Icons/share.png', height: 25),
                          Text(
                            '5.3M',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Century",
                                fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20)
                      ]),
                      child: Column(
                        children: [
                          Image.asset('lib/Icons/download.png', height: 25),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20)
                      ]),
                      child: Column(
                        children: [
                          Image.asset('lib/Icons/option.png', height: 25),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 8,
                  child: VideoProgressIndicator(_controller,
                      allowScrubbing: true,
                      colors: VideoProgressColors(
                          backgroundColor: Colors.white.withOpacity(0.1),
                          bufferedColor: Colors.white.withOpacity(0.3),
                          playedColor: Color(0xffffff9800))),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoForYouCard extends StatefulWidget {
  const VideoForYouCard({
    super.key,
  });

  @override
  State<VideoForYouCard> createState() => _VideoForYouCardState();
}

class _VideoForYouCardState extends State<VideoForYouCard> {
  late VideoPlayerController _controller;
  bool isicon = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
        Uri.parse('https://y.yarn.co/469baa11-a5e2-47cd-a42b-01a5f304c2de.mp4'))
      ..initialize().then((_) {
        if (mounted) {
          setState(() {});
          _controller.play();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            // height: double.infinity,
            child: Center(
          child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller)),
        )),
        GestureDetector(
          onTap: () async {
            if (_controller.value.isPlaying) {
              await _controller.pause();
            } else {
              await _controller.play();
            }
            setState(() {
              isicon = true;
            });
            await Future.delayed(Duration(milliseconds: 500));
            setState(() {
              isicon = false;
            });
          },
          child: Center(
            child: Container(
              color: Colors.transparent,
              height: double.infinity,
              width: double.infinity,
              child: Visibility(
                visible: isicon,
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 80,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                'lib/Image/jojipf.jpg',
                                height: 40,
                              )),
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              size: 20,
                              color: Color(0xffff9800),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20)
                      ]),
                      child: Column(
                        children: [
                          Image.asset('lib/Icons/love.png', height: 25),
                          Text(
                            '5.3M',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Century",
                                fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20)
                      ]),
                      child: Column(
                        children: [
                          Image.asset('lib/Icons/comment.png', height: 25),
                          Text(
                            '5.3M',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Century",
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20)
                      ]),
                      child: Column(
                        children: [
                          Image.asset('lib/Icons/share.png', height: 25),
                          Text(
                            '5.3M',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Century",
                                fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20)
                      ]),
                      child: Column(
                        children: [
                          Image.asset('lib/Icons/download.png', height: 25),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20)
                      ]),
                      child: Column(
                        children: [
                          Image.asset('lib/Icons/option.png', height: 25),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 8,
                  child: VideoProgressIndicator(_controller,
                      allowScrubbing: true,
                      colors: VideoProgressColors(
                          backgroundColor: Colors.white.withOpacity(0.1),
                          bufferedColor: Colors.white.withOpacity(0.3),
                          playedColor: Color(0xffffff9800))),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoFollowCard extends StatefulWidget {
  const VideoFollowCard({
    super.key,
  });

  @override
  State<VideoFollowCard> createState() => _VideoFollowCardState();
}

class _VideoFollowCardState extends State<VideoFollowCard> {
  late VideoPlayerController _controller;
  bool isicon = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        if (mounted) {
          setState(() {});
          _controller.play();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            // height: double.infinity,
            child: Center(
          child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller)),
        )),
        GestureDetector(
          onTap: () async {
            if (_controller.value.isPlaying) {
              await _controller.pause();
            } else {
              await _controller.play();
            }
            setState(() {
              isicon = true;
            });
            await Future.delayed(Duration(milliseconds: 500));
            setState(() {
              isicon = false;
            });
          },
          child: Center(
            child: Container(
              color: Colors.transparent,
              height: double.infinity,
              width: double.infinity,
              child: Visibility(
                visible: isicon,
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 80,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                'lib/Image/jojipf.jpg',
                                height: 40,
                              )),
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              size: 20,
                              color: Color(0xffff9800),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20)
                      ]),
                      child: Column(
                        children: [
                          Image.asset('lib/Icons/love.png', height: 25),
                          Text(
                            '5.3M',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Century",
                                fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20)
                      ]),
                      child: Column(
                        children: [
                          Image.asset('lib/Icons/comment.png', height: 25),
                          Text(
                            '5.3M',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Century",
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20)
                      ]),
                      child: Column(
                        children: [
                          Image.asset('lib/Icons/share.png', height: 25),
                          Text(
                            '5.3M',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Century",
                                fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20)
                      ]),
                      child: Column(
                        children: [
                          Image.asset('lib/Icons/download.png', height: 25),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20)
                      ]),
                      child: Column(
                        children: [
                          Image.asset('lib/Icons/option.png', height: 25),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 8,
                  child: VideoProgressIndicator(_controller,
                      allowScrubbing: true,
                      colors: VideoProgressColors(
                          backgroundColor: Colors.white.withOpacity(0.1),
                          bufferedColor: Colors.white.withOpacity(0.3),
                          playedColor: Color(0xffffff9800))),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

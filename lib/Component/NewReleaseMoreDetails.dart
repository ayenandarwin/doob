import 'package:doob/Component/FavoriteArtists.dart';
import 'package:doob/Component/song.dart';
import 'package:doob/Libcomponent/AlbumsTabs.dart';
import 'package:doob/Libcomponent/Artist.dart';
import 'package:doob/Libcomponent/Tracks.dart';
import 'package:doob/services/albumIdServiceProvider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class NewReleaseMoreDetails extends StatefulWidget {
  // final String? id;
  // final String? name;
  // final String? type;
  // final String? coverPhoto;

  const NewReleaseMoreDetails({
    super.key,
  });

  @override
  State<NewReleaseMoreDetails> createState() => _NewReleaseMoreDetailsState();
}

class _NewReleaseMoreDetailsState extends State<NewReleaseMoreDetails> {
  // final audioPlayer = AudioPlayer();

  bool isPlaying = false;
  bool isFav = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  String formatTime(int seconds) {
    return '${(Duration(seconds: seconds))}'
        .splitMapJoin('.')[0]
        .padLeft(8, '0');
  }

  @override
  void initState() {
    // TODO: implement initState

    // setAudio();
    // audioPlayer.onPlayerStateChanged.listen((state) {
    //   setState(() {
    //     isPlaying = state == PlayerState.playing;
    //   });

    //   audioPlayer.onDurationChanged.listen((newDuration) {
    //     setState(() {
    //       duration = newDuration;
    //     });
    //   });
    // });

    // audioPlayer.onDurationChanged.listen((newPosition) {
    //   setState(() {
    //     position = newPosition;
    //   });
    // });
  }

  // Future setAudio() async {
  //   audioPlayer.setReleaseMode(ReleaseMode.loop);
  //   await audioPlayer.play(UrlSource(
  //       'https://doob.smartcodemm.com/storage/songs/audio/xr2gvVQ7RyvodWMCtynleCnc9q7EiBFHRwnrWDnf.mp3'));
  // }

  @override
  void dispose() {
    // audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // padding: EdgeInsets.symmetric(
                    //     vertical: 20, horizontal: 16),
                    child: ClipRRect(
                      //   borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/Image/pop.png',
                        fit: BoxFit.cover,
                        // height: 210,
                        // width: 210,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            // Navigator.pushNamed(context, '/search');
                            Get.to(() => FavoriteArtists());
                          },
                          child: Icon(
                            Icons.more_horiz,
                            size: 30,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.38),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                              // Text(
                              //   'soft, chill, dreamy, lo-fi beats',
                              //   // textAlign: TextAlign.center,
                              //   style: TextStyle(
                              //     fontFamily: 'Century',
                              //     fontSize: 12,
                              //     color: Color(0xff8A9A9D),
                              //   ),
                              // ),
                            ],
                          ),
                          //  Icon(
                          //           view
                          //               ? Icons.visibility_off
                          //               : Icons.visibility,
                          //           color: Colors.white,
                          //           size: 20,

                          //           // color: Colors.white.withOpacity(0.4),
                          //         ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isFav = !isFav;
                              });
                            },
                            child: Icon(
                              isFav
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: Colors.green,
                              size: 30,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  // Slider(
                  //   min: 0,
                  //   max: duration.inSeconds.toDouble(),
                  //   value: position.inSeconds.toDouble(),
                  //   onChanged: (value) async {
                  //     final position = Duration(seconds: value.toInt());
                  //     audioPlayer.seek(position);
                  //     audioPlayer.resume();
                  //   },
                  // ),
                  // SizedBox(
                  //   height: 0,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //     horizontal: 16,
                  //   ),
                  //   child: Row(
                  //       mainAxisAlignment:
                  //           MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Text(
                  //           formatTime(position.inSeconds),
                  //         ),

                  //         Text(
                  //           formatTime((duration - position).inSeconds),
                  //         ),
                  //         // Text(_formatDuration(position)),
                  //         // Text(formatTime(position)),
                  //       ]),
                  // ),
                  // SizedBox(
                  //   height: 50,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     IconButton(
                  //         icon: const Icon(
                  //           Icons.skip_previous,
                  //           color: Colors.white,
                  //         ),
                  //         onPressed: () {
                  //           setState(() {});
                  //         }
                  //         // widget._audioPlayer.hasPrevious
                  //         //     ? widget._audioPlayer.seekToPrevious
                  //         //     : null,
                  //         ),
                  //     SizedBox(
                  //       width: 30,
                  //     ),
                  //     CircleAvatar(
                  //       maxRadius: 25,
                  //       backgroundColor: const Color(0xffff9800),
                  //       child: IconButton(
                  //         icon: Icon(
                  //           isPlaying ? Icons.pause : Icons.play_arrow,
                  //           color: Colors.white,
                  //         ),
                  //         iconSize: 30.0,
                  //         onPressed: (() async {
                  //           if (isPlaying) {
                  //             await audioPlayer.pause();
                  //           } else {
                  //             //var url =await http.get(Uri.parse(''));
                  //             audioPlayer.play(UrlSource(
                  //                 'https://doob.smartcodemm.com/storage/songs/audio/xr2gvVQ7RyvodWMCtynleCnc9q7EiBFHRwnrWDnf.mp3'));
                  //           }
                  //         }),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 30,
                  //     ),
                  //     IconButton(
                  //         icon: const Icon(
                  //           Icons.skip_next,
                  //           color: Colors.white,
                  //         ),
                  //         onPressed: () {}
                  //         // widget._audioPlayer.hasNext ? widget._audioPlayer.seekToNext : null,
                  //         ),
                  //   ],
                  // ),
                ],
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
        //  Navigator.pushNamed(context, '/NewReleaseMoreDetails');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
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

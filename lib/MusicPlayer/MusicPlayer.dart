 import 'package:comment_box/comment/comment.dart';
import 'package:doob/Component/PlaylistMoreDetails.dart';
import 'package:doob/Component/playerButton.dart';
import 'package:doob/MusicPlayer/ForYouScreen.dart';
import 'package:doob/MusicPlayer/Pause.dart';

import 'package:doob/MusicPlayer/videoplayer.dart';
import 'package:doob/services/songServiceProvider.dart';
import 'package:doob/src/providers/music_provider/like_count_provider.dart';
import 'package:doob/src/providers/wave_icon_provider/wave_icon_provider.dart';
import 'package:doob/utils/sharedPreference.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

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
  bool isicon = false;
  bool isrepeat = true;
  bool isReact = true;

  AppLifecycleState? stateChanged;

  List<Color> colors = [Colors.blueAccent, Colors.greenAccent, Colors.yellowAccent, Colors.redAccent];

  // List<int> duration = [900, 700, 600, 800, 500];
  List<int> duration = [900, 700, 600, 800, 500];

  int currentindex = 0;
  double value = 50;
  var _remove;

  late AudioPlayer _audioPlayer;
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List filedata = [
    {'name': 'Chuks Okwuenu', 'pic': 'https://picsum.photos/300/30', 'message': 'I love to code', 'date': '2021-01-01'},
    {'name': 'Biggi Man', 'pic': 'https://www.adeleyeayodeji.com/img/IMG_20200522_121756_834_2.jpg', 'message': 'Very cool', 'date': '2021-01-01'},
    // {
    //   'name': 'Tunde Martins',
    //   'pic': 'assets/img/userpic.jpg',
    //   'message': 'Very cool',
    //   'date': '2021-01-01 12:00:00'
    // },
    // {
    //   'name': 'Biggi Man',
    //   'pic': 'https://picsum.photos/300/30',
    //   'message': 'Very cool',
    //   'date': '2021-01-01 12:00:00'
    // },
  ];

  Future<dynamic> likeCount(String id) async {
    final token = await SharedPref.getData(key: SharedPref.token);

    final Map<String, dynamic> data = {
      // "order_code": getResult,
    };

    final response = await http.post(
      Uri.parse('https://doob.smartcodemm.com/api/customer/songs/$id/react'),
      headers: {'Accept': 'application/json; charset=UTF-8', 'Authorization': token!},
      body: data,
    );

    print("Like Count *************** ${response.body}");
  }

  Future<dynamic> updateLikeCoun(String id) async {
    final token = await SharedPref.getData(key: SharedPref.token);

    final Map<String, dynamic> data = {
      // "order_code": getResult,
    };

    final response = await http.post(
      Uri.parse('https://doob.smartcodemm.com/api/customer/songs/$id/react'),
      headers: {'Accept': 'application/json; charset=UTF-8', 'Authorization': token!},
      body: data,
    );

    print("Like Count *************** ${response.body}");
  }

  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(color: Colors.blue, borderRadius: new BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(radius: 50, backgroundImage: CommentBox.commentImageParser(imageURLorPath: data[i]['pic'])),
                ),
              ),
              title: Text(
                data[i]['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['message']),
              trailing: Text(data[i]['date'], style: TextStyle(fontSize: 10)),
            ),
          )
      ],
    );
  }

  //late Duration? audioDuration;
  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _remove = true;
  }

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
  }

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

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: InkWell(
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
            child: Consumer(
              builder: (context, ref, child) {
                return Stack(
                  children: [
                    // Icon(
                    //   Icons.play_arrow,
                    //   size: 50,
                    //   color: Colors.orange,
                    // ),
                    // Text("Debug"),
                    PageView(
                      controller: controller,
                      onPageChanged: (value) {
                        // print(currentindex.toString() + 'bjasbfajbdfjbad');
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
                              _audioPlayer
                                  .setAudioSource(ConcatenatingAudioSource(children: [
                                AudioSource.uri(Uri.parse('${songList.data![index].audio}')),
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
                                      // width: MediaQuery.of(context).size.width *
                                      //     0.9,
                                      // height:
                                      //     MediaQuery.of(context).size.height *
                                      //         0.21,
                                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                        // This function is called when the image fails to load
                                        // Return a new widget to display a dummy image from the internet
                                        return Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: Image.network(
                                            'https://cdn.wallpapersafari.com/64/93/hrC5Ge.jpg',
                                            // width: MediaQuery.of(context)
                                            //         .size
                                            //         .width *
                                            //     0.9,
                                          ),
                                        );
                                      },
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    child: Consumer(builder: (context, pauseRef, child) {
                                      final pauseChange = pauseRef.watch(pauseChangeProvider);
                                      print("Pause  ###### : $pauseChange");
                                      return Center(
                                        child: Stack(
                                          children: [
                                            pauseChange
                                                ? Center(
                                                    child: Icon(
                                                      Icons.play_arrow,
                                                      size: 90,
                                                      color: Colors.white38,
                                                    ),
                                                  )
                                                : SizedBox.shrink(),
                                          ],
                                        ),
                                      );
                                    }),
                                  ),

                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                              decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 20)]),
                                              child: Column(
                                                children: [
                                                  InkWell(
                                                    onTap: () async {
                                                      // ref.invalidate(
                                                      //     audioFavProvider);

                                                      // final favBook = await ref
                                                      //     .read(audioFavProvider(
                                                      //             songList
                                                      //                 .data![
                                                      //                     index]
                                                      //                 .id!
                                                      //                 .toString())
                                                      //         .future);
                                                      // final snackbar = SnackBar(
                                                      //     content: Text(
                                                      //         favBook!.data));
                                                      // ScaffoldMessenger.of(
                                                      //         context)
                                                      //     .showSnackBar(
                                                      //         snackbar);
                                                      // // if (favBook.data ==
                                                      //     'Successfully remove from favorite list !') {
                                                      //   //  --songList.data![index]
                                                      //   //       .like_count!.length;

                                                      //   //   songList.data![index].like_count!.removeAt(0);
                                                      // } else {
                                                      //   // ++songList.data![index]
                                                      //   //     .like_count!.length;
                                                      // }

                                                      setState(() {
                                                        isReact = !isReact;
                                                      });
                                                      likeCount(songList.data![index].id.toString());
                                                      // Get.to(() =>
                                                      //     PlaylistMoreDetails());
                                                    },
                                                    child: isReact
                                                        ? Container(
                                                            padding: EdgeInsets.only(top: 20),
                                                            child: Icon(
                                                              Icons.favorite,
                                                              color: Colors.white,
                                                              size: 40,
                                                            ),
                                                          )

                                                        //  Container(
                                                        //     padding:
                                                        //         EdgeInsets
                                                        //             .only(
                                                        //                 top: 16),
                                                        //     child: Image
                                                        //         .asset(
                                                        //       'asset/Icons/heart.png',
                                                        //       height: 30,
                                                        //     ),
                                                        //   )
                                                        : Container(
                                                            padding: EdgeInsets.only(top: 20),
                                                            child: Icon(
                                                              Icons.favorite,
                                                              color: Color(0xffff9800),
                                                              size: 40,
                                                            ),
                                                          ),

                                                    // SvgPicture.asset('lib/Icons/love.svg',
                                                    //     height: 25),
                                                  ),
                                                  Text(
                                                    //   '5.3M',
                                                    songList.data![index].like_count!.toString(),

                                                    // songList.data![index]
                                                    //     .like_count!
                                                    //     .length
                                                    //     .toString() ??
                                                    // '0'

                                                    style: TextStyle(color: Colors.white, fontFamily: "Century", fontSize: 14),
                                                  )
                                                ],
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                //  Get.to(() => Comment());
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: ((context) {
                                                    return SizedBox(
                                                      width: MediaQuery.of(context).size.width,
                                                      height: MediaQuery.of(context).size.height,
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: SingleChildScrollView(
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Container(
                                                                    margin: EdgeInsets.only(left: 120),
                                                                    child: Text(
                                                                      '39 comments',
                                                                      style: TextStyle(color: Colors.black, fontFamily: "Century", fontSize: 16, fontWeight: FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    onTap: () {
                                                                      Get.back();
                                                                      // _remove = !_remove;
                                                                    },
                                                                    child: Icon(
                                                                      Icons.cancel,
                                                                      color: Colors.grey[500],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Container(
                                                                height: 400,
                                                                child: Expanded(
                                                                  child: Container(
                                                                    child: CommentBox(
                                                                      userImage: CommentBox.commentImageParser(imageURLorPath: "assets/img/userpic.jpg"),
                                                                      child: commentChild(filedata),
                                                                      labelText: 'Write a comment...',
                                                                      errorText: 'Comment cannot be blank',
                                                                      withBorder: false,
                                                                      sendButtonMethod: () {
                                                                        if (formKey.currentState!.validate()) {
                                                                          print(commentController.text);
                                                                          setState(() {
                                                                            var value = {
                                                                              'name': 'New User',
                                                                              'pic': 'https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
                                                                              'message': commentController.text,
                                                                              'date': '2021-01-01'
                                                                            };
                                                                            filedata.insert(0, value);
                                                                          });
                                                                          commentController.clear();
                                                                          FocusScope.of(context).unfocus();
                                                                        } else {
                                                                          print("Not validated");
                                                                        }
                                                                      },
                                                                      formKey: formKey,
                                                                      commentController: commentController,
                                                                      backgroundColor: const Color(0xffff9800),
                                                                      textColor: Colors.white,
                                                                      sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                );

                                                // showModalBottomSheet(
                                                //     context: context,
                                                //     builder: ((context) {
                                                //       return SingleChildScrollView(
                                                //         child: Container(
                                                //           width:
                                                //               MediaQuery.of(
                                                //                       context)
                                                //                   .size
                                                //                   .width,
                                                //           height:
                                                //               MediaQuery.of(
                                                //                       context)
                                                //                   .size
                                                //                   .height,
                                                //           child: Padding(
                                                //             padding:
                                                //                 const EdgeInsets
                                                //                     .all(
                                                //                     8.0),
                                                //             child: Column(
                                                //               children: [
                                                //                 Row(
                                                //                   crossAxisAlignment:
                                                //                       CrossAxisAlignment
                                                //                           .start,
                                                //                   mainAxisAlignment:
                                                //                       MainAxisAlignment
                                                //                           .spaceBetween,
                                                //                   children: [
                                                //                     Container(
                                                //                       margin:
                                                //                           EdgeInsets.only(left: 120),
                                                //                       child:
                                                //                           Text(
                                                //                         '39 comments',
                                                //                         style: TextStyle(
                                                //                             color: Colors.black,
                                                //                             fontFamily: "Century",
                                                //                             fontSize: 16,
                                                //                             fontWeight: FontWeight.bold),
                                                //                       ),
                                                //                     ),
                                                //                     InkWell(
                                                //                       onTap:
                                                //                           () {
                                                //                         Get.back();
                                                //                         // setState(
                                                //                         //     () {});
                                                //                         // _remove =
                                                //                         //     !_remove;
                                                //                       },
                                                //                       child:
                                                //                           Icon(
                                                //                         Icons.cancel,
                                                //                         color:
                                                //                             Colors.grey[500],
                                                //                       ),
                                                //                     ),
                                                //                   ],
                                                //                 ),
                                                //                 Container(
                                                //                   child:
                                                //                       CommentBox(
                                                //                     userImage:
                                                //                         CommentBox.commentImageParser(imageURLorPath: "assets/img/userpic.jpg"),
                                                //                     child: commentChild(
                                                //                         filedata),
                                                //                     labelText:
                                                //                         'Write a comment...',
                                                //                     errorText:
                                                //                         'Comment cannot be blank',
                                                //                     withBorder:
                                                //                         false,
                                                //                     sendButtonMethod:
                                                //                         () {
                                                //                       if (formKey
                                                //                           .currentState!
                                                //                           .validate()) {
                                                //                         print(commentController.text);
                                                //                         setState(() {
                                                //                           var value = {
                                                //                             'name': 'New User',
                                                //                             'pic': 'https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
                                                //                             'message': commentController.text,
                                                //                             'date': '2021-01-01 12:00:00'
                                                //                           };
                                                //                           filedata.insert(0, value);
                                                //                         });
                                                //                         commentController.clear();
                                                //                         FocusScope.of(context).unfocus();
                                                //                       } else {
                                                //                         print("Not validated");
                                                //                       }
                                                //                     },
                                                //                     formKey:
                                                //                         formKey,
                                                //                     commentController:
                                                //                         commentController,
                                                //                     backgroundColor:
                                                //                         const Color(0xffff9800),

                                                //                     // backgroundColor: Colors.pink,
                                                //                     textColor:
                                                //                         Colors.white,
                                                //                     sendWidget: Icon(
                                                //                         Icons
                                                //                             .send_sharp,
                                                //                         size:
                                                //                             30,
                                                //                         color:
                                                //                             Colors.white),
                                                //                   ),
                                                //                 ),
                                                //               ],
                                                //             ),
                                                //           ),
                                                //         ),
                                                //       );
                                                //     }))
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 20)]),
                                                child: Column(
                                                  children: [
                                                    // Container(
                                                    //   padding: EdgeInsets.only(
                                                    //       top: 10),
                                                    //   child: Icon(
                                                    //     Icons.bookmark,
                                                    //     color: Colors.white,
                                                    //   ),
                                                    // ),
                                                    Container(
                                                      padding: EdgeInsets.only(top: 20),
                                                      child: Image.asset(
                                                        'asset/Icons/chat.png',
                                                        height: 30,
                                                      ),
                                                    ),
                                                    // SvgPicture.asset('lib/Icons/comment.svg', height: 25),
                                                    Text(
                                                      // '5.3M',
                                                      songList.data![index].comment_count!.toString(),
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
                                            Container(
                                              decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 20)]),
                                              child: Column(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      Share.share('com.example.doob');
                                                    },
                                                    child:
                                                        // Container(
                                                        //   padding:
                                                        //       EdgeInsets.only(
                                                        //           top: 12),
                                                        //   child:
                                                        // Icon(
                                                        //   Icons.bookmark,
                                                        //   color: Colors.white,
                                                        //   size: 30,
                                                        // ),
                                                        // )
                                                        Container(
                                                      padding: EdgeInsets.only(top: 20),
                                                      child: Image.asset(
                                                        'asset/Icons/paper-plane.png',
                                                        //color: Colors.white,
                                                        height: 30,
                                                      ),
                                                    ),
                                                  ),
                                                  //  SvgPicture.asset('lib/Icons/share.svg', height: 25),
                                                  Text(
                                                    '0',
                                                    style: TextStyle(color: Colors.white, fontFamily: "Century", fontSize: 14),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                                decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 20)]),
                                                child:
                                                    // Container(
                                                    //     padding:
                                                    //         EdgeInsets.only(top: 10),
                                                    //     child: Icon(
                                                    //       Icons.bookmark,
                                                    //       color: Colors.white,
                                                    //  )),
                                                    Container(
                                                  padding: EdgeInsets.only(top: 20),
                                                  child: Image.asset(
                                                    'asset/Icons/downloading.png',
                                                    height: 30,
                                                  ),
                                                )
                                                //  SvgPicture.asset('lib/Icons/download.svg',
                                                //     height: 25),
                                                ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 25),
                                              child: Container(
                                                decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 20)]),
                                                child: InkWell(
                                                    onTap: () {
                                                      setState(() {});
                                                      isrepeat = !isrepeat;
                                                    },
                                                    child: isrepeat
                                                        ? Image.asset('asset/Icons/shuffle.png', height: 30)
                                                        // Icon(
                                                        //     Icons.repeat,
                                                        //     color: Colors.white,
                                                        //     size: 30,
                                                        //   )
                                                        : Image.asset('asset/Icons/repeat.png', height: 30)
                                                    // Icon(
                                                    //     Icons.shuffle,
                                                    //     color: Colors.white,
                                                    //     size: 30,
                                                    //   )
                                                    // Image.asset(
                                                    //     'lib/Icons/repeat.svg',
                                                    //     height: 25)
                                                    // : Image.asset(
                                                    //     'lib/Icons/Shuffle.svg'),
                                                    ),
                                              ),
                                            ),
                                            // Padding(
                                            //   padding:
                                            //       const EdgeInsets.symmetric(
                                            //           vertical: 5),
                                            //   child: Container(
                                            //     decoration: BoxDecoration(
                                            //         boxShadow: [
                                            //           BoxShadow(
                                            //               color: Colors.black
                                            //                   .withOpacity(0.2),
                                            //               blurRadius: 20)
                                            //         ]),
                                            //     child: SvgPicture.asset(
                                            //         'lib/Icons/Shuffle.svg',
                                            //         height: 25),
                                            //   ),
                                            //),
                                            // Container(
                                            //     decoration: BoxDecoration(
                                            //         boxShadow: [
                                            //           BoxShadow(
                                            //               color: Colors.black
                                            //                   .withOpacity(0.2),
                                            //               blurRadius: 20)
                                            //         ]),
                                            //     child: Image.asset(
                                            //       'lib/Icons/8.png',
                                            //       height: 55,
                                            //     )
                                            //     // SvgPicture.asset('lib/Icons/option.svg', height: 25),
                                            //     ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Consumer(builder: (context, waveIconRef, child) {
                                      final tapChange = waveIconRef.watch(waveIconTapChangeProvider);
                                      print("yya yya yya  ###### : $tapChange");
                                      return Container(
                                        margin: EdgeInsets.only(top: size.height * 0.68),
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
                                                            'asset/lottie/Animation - 1713755104463.json',
                                                          ),
                                                        ),
                                                      ))
                                                  : SizedBox.shrink(),
                                              PlayerButtons(_audioPlayer,songList.data![index].lyric!),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                  // Align(
                                  //   alignment: Alignment.bottomCenter,
                                  //   child: Column(
                                  //     mainAxisSize: MainAxisSize.min,
                                  //     children: [

                                  //             // Padding(
                                  //             //   padding: const EdgeInsets.only(
                                  //             //       left: 10, right: 10, bottom: 20),
                                  //             //   child: GestureDetector(
                                  //             //     onTap: () {
                                  //             //       showDialog(
                                  //             //         context: context,
                                  //             //         builder: (context) => Padding(
                                  //             //           padding:
                                  //             //               const EdgeInsets.symmetric(
                                  //             //                   horizontal: 10,
                                  //             //                   vertical: 100),
                                  //             //           child: Container(
                                  //             //             height: 100,
                                  //             //             decoration: BoxDecoration(
                                  //             //                 borderRadius:
                                  //             //                     BorderRadius.circular(
                                  //             //                         10),
                                  //             //                 color:
                                  //             //                     Colors.transparent),
                                  //             //             child: Column(
                                  //             //               children: [
                                  //             //                 Row(
                                  //             //                   mainAxisAlignment:
                                  //             //                       MainAxisAlignment
                                  //             //                           .end,
                                  //             //                   children: [
                                  //             //                     GestureDetector(
                                  //             //                       onTap: () {
                                  //             //                         Navigator.of(
                                  //             //                                 context)
                                  //             //                             .pop();
                                  //             //                       },
                                  //             //                       child: Icon(
                                  //             //                         Icons.cancel,
                                  //             //                         color:
                                  //             //                             Colors.white,
                                  //             //                       ),
                                  //             //                     ),
                                  //             //                   ],
                                  //             //                 ),
                                  //             //                 Container(
                                  //             //                   decoration: BoxDecoration(
                                  //             //                       color:
                                  //             //                           Colors.black26,
                                  //             //                       borderRadius:
                                  //             //                           BorderRadius
                                  //             //                               .circular(
                                  //             //                                   15),
                                  //             //                       border: Border.all(
                                  //             //                           color: Colors
                                  //             //                               .white)),
                                  //             //                   padding: EdgeInsets
                                  //             //                       .symmetric(
                                  //             //                           horizontal: 10,
                                  //             //                           vertical: 10),
                                  //             //                   // color: Colors.black12,
                                  //             //                   child: Center(
                                  //             //                     child: Text(
                                  //             //                       'You are my sunshine, my only sunshine you make me happy when skies are gray you will never keep dear,how much I love you,please don\'t take my sunshine away.',
                                  //             //                       textAlign: TextAlign
                                  //             //                           .center,
                                  //             //                       style: TextStyle(
                                  //             //                         fontFamily:
                                  //             //                             'Century',
                                  //             //                         // wordSpacing: 2,
                                  //             //                         fontSize: 16,
                                  //             //                         fontWeight:
                                  //             //                             FontWeight
                                  //             //                                 .bold,
                                  //             //                         color:
                                  //             //                             Colors.white,
                                  //             //                       ),
                                  //             //                     ),
                                  //             //                   ),
                                  //             //                 ),
                                  //             //               ],
                                  //             //             ),
                                  //             //           ),
                                  //             //         ),
                                  //             //       );
                                  //             //     },
                                  //             //     child:
                                  //             // Container(
                                  //             //       height: 40,
                                  //             //       width: 200,
                                  //             //       decoration: BoxDecoration(
                                  //             //         color: Color(0xffff9800),
                                  //             //         borderRadius:
                                  //             //             BorderRadius.circular(25),
                                  //             //       ),
                                  //             //       child: Center(
                                  //             //         child: Text(
                                  //             //           'Lyrics',
                                  //             //           style: TextStyle(
                                  //             //               fontFamily: 'Century',
                                  //             //               fontSize: 14,
                                  //             //               fontWeight: FontWeight.bold,
                                  //             //               color: Colors.white),
                                  //             //         ),
                                  //             //       ),
                                  //             //     ),
                                  //             //   ),
                                  //           //  ),
                                  //  ],
                                  // ),
                                  //  )
                                ],
                              );
                            },
                            scrollDirection: Axis.vertical,
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
                          gradient: LinearGradient(colors: [
                        Colors.black.withOpacity(0.5),
                        Colors.transparent,
                      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if (currentindex != 0) {
                                          controller.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.linear);
                                          setState(() {
                                            currentindex = 0;
                                          });
                                        }
                                      },
                                      child: Text(
                                        'Music',
                                        style: TextStyle(
                                            fontFamily: 'Century', color: currentindex == 0 ? Color(0xffff9800) : Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (currentindex != 1) {
                                          controller.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.linear);

                                          setState(() {
                                            currentindex = 1;
                                          });
                                        }
                                      },
                                      child: Text(
                                        'Video',
                                        style: TextStyle(
                                            fontFamily: 'Century', color: currentindex == 1 ? Color(0xffff9800) : Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (currentindex != 2) {
                                          controller.animateToPage(2, duration: Duration(milliseconds: 500), curve: Curves.linear);
                                          setState(() {
                                            currentindex = 2;
                                          });
                                        }
                                      },
                                      child: Text(
                                        'For You',
                                        style: TextStyle(
                                            fontFamily: 'Century', color: currentindex == 2 ? Color(0xffff9800) : Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (currentindex != 3) {
                                          controller.animateToPage(3, duration: Duration(milliseconds: 500), curve: Curves.linear);

                                          setState(() {
                                            currentindex = 3;
                                          });
                                        }
                                      },
                                      child: Text(
                                        'Follow',
                                        style: TextStyle(
                                            fontFamily: 'Century', color: currentindex == 3 ? Color(0xffff9800) : Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Icon(
                              //   Icons.search,
                              //   size: 20,
                              //   color: Colors.white,
                              // )
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
                    decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 20)]),
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
                          style: TextStyle(color: Colors.white, fontFamily: "Century", fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 20)]),
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
                    decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 20)]),
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
                          style: TextStyle(color: Colors.white, fontFamily: "Century", fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 20)]),
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
                      decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 20)]),
                      child: SvgPicture.asset('lib/Icons/repeat.svg', height: 25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 20)]),
                      child: SvgPicture.asset('lib/Icons/Shuffle.svg', height: 25),
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 20)]),
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
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 100),
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.transparent),
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
                        style: TextStyle(fontFamily: 'Century', fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
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
    super.paint(context, center.translate(-(value - 0.5) / 0.5 * enabledThumbRadius, 0.0),
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
    super.paint(context, center.translate(-(value - 0.5) / 0.5 * enabledThumbRadius, 0.0),
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
    _controller = VideoPlayerController.networkUrl(Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
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
          child: AspectRatio(aspectRatio: _controller.value.aspectRatio, child: VideoPlayer(_controller)),
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
                      decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 20)]),
                      child: Column(
                        children: [
                          Image.asset('lib/Icons/love.png', height: 25),
                          Text(
                            '5.3M',
                            style: TextStyle(color: Colors.white, fontFamily: "Century", fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 20)]),
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
                      decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 20)]),
                      child: Column(
                        children: [
                          Image.asset('lib/Icons/share.png', height: 25),
                          Text(
                            '5.3M',
                            style: TextStyle(color: Colors.white, fontFamily: "Century", fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 20)]),
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
                      decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 20)]),
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
                      colors: VideoProgressColors(backgroundColor: Colors.white.withOpacity(0.1), bufferedColor: Colors.white.withOpacity(0.3), playedColor: Color(0xffffff9800))),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

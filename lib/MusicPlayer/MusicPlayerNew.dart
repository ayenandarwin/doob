import 'package:comment_box/comment/comment.dart';
import 'package:doob/Component/playerButton.dart';
import 'package:doob/MusicPlayer/Pause.dart';
import 'package:doob/MusicPlayer/WaveProgressBar.dart';
import 'package:doob/services/songServiceProvider.dart';
import 'package:doob/utils/sharedPreference.dart';
import 'package:doob/widgets/common/music_background_image.dart';
import 'package:doob/widgets/music_player/taps/follow_tap_screen.dart';
import 'package:doob/widgets/music_player/taps/for_you_tap_screen.dart';
import 'package:doob/widgets/music_player/taps/video_tap_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;

import '../widgets/common/option.dart';
import '../widgets/music_player/page_view_text_btn.dart';

class MusicPlayerNew extends ConsumerStatefulWidget {
  MusicPlayerNew({super.key});
  @override
  _MusicPlayerNewState createState() => _MusicPlayerNewState();
}

class _MusicPlayerNewState extends ConsumerState<MusicPlayerNew> {
  PageController controller = PageController();
  PageController musicController = PageController();
  bool isPlaying = true;
  bool isicon = false;
  bool isrepeat = true;
  bool isReact = true;

  AppLifecycleState? stateChanged;

  List<Color> colors = [
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.yellowAccent,
    Colors.redAccent
  ];
  List<int> duration = [900, 700, 600, 800, 500];

  int currentindex = 0;
  double value = 50;
  var _remove;

  late AudioPlayer _audioPlayer;
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List filedata = [
    {
      'name': 'Chuks Okwuenu',
      'pic': 'https://picsum.photos/300/30',
      'message': 'I love to code',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://www.adeleyeayodeji.com/img/IMG_20200522_121756_834_2.jpg',
      'message': 'Very cool',
      'date': '2021-01-01 12:00:00'
    },
  ];

  Future<dynamic> likeCount(String id) async {
    final token = await SharedPref.getData(key: SharedPref.token);

    final Map<String, dynamic> data = {
      // "order_code": getResult,
    };

    final response = await http.post(
      Uri.parse('https://doob.smartcodemm.com/api/customer/songs/$id/react'),
      headers: {
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': token!
      },
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
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      color: Colors.blue,
                      borderRadius: new BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: CommentBox.commentImageParser(
                          imageURLorPath: data[i]['pic'])),
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
      await _audioPlayer.pause();
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
                    PageView(
                      controller: controller,
                      onPageChanged: (value) {
                        setState(() {
                          currentindex = value;
                        });
                      },
                      children: [
                        ref.watch(songServiceProvider).when(data: (songList) {
                          return PageView.builder(
                            scrollDirection: Axis.vertical,
                            controller: musicController,
                            itemCount: songList!.data!.length,
                            itemBuilder: (context, index) {
                              _audioPlayer
                                  .setAudioSource(
                                      ConcatenatingAudioSource(children: [
                                AudioSource.uri(Uri.parse(
                                    '${songList.data![index].audio}')),
                              ]))
                                  .catchError((error) {
                                if (kDebugMode) {
                                  print("An error occured $error");
                                }
                                return null;
                              });

                              return Stack(
                                children: [
                                  MusicBackgroundImage(
                                    imageUrl:
                                        songList.data![index].cover_photo!,
                                  ),

                                  //Pause Icon
                                  Consumer(builder: (context, pauseRef, child) {
                                    final pauseChange =
                                        pauseRef.watch(pauseChangeProvider);
                                    return pauseChange
                                        ? Center(
                                            child: Icon(
                                              Icons.play_arrow,
                                              size: 90,
                                              color: Colors.white38,
                                            ),
                                          )
                                        : SizedBox.shrink();
                                  }),
                                  //OPTION BAR
                                  Positioned(
                                    left: 300,
                                    top: 150,
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                child: Image.asset(
                                                  'lib/Image/jojipf.jpg',
                                                  height: 40,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 35,
                                              left: 15,
                                              child: CircleAvatar(
                                                backgroundColor: Colors.white,
                                                radius: 10,
                                                child: Icon(
                                                  Icons.add,
                                                  size: 20,
                                                  color: Color(0xffff9800),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Option(
                                          iconWidget: isReact
                                              ? Icon(
                                                  Icons.favorite,
                                                  size: 40,
                                                  color: Colors.white,
                                                )
                                              : Icon(
                                                  Icons.favorite,
                                                  size: 40,
                                                  color: Color(0xffff9800),
                                                ),
                                          label: songList
                                              .data![index].like_count!
                                              .toString(),
                                          onTap: () {
                                            setState(() {
                                              isReact = !isReact;
                                            });
                                            //   ref.invalidate(songServiceProvider);
                                            likeCount(songList.data![index].id
                                                .toString());
                                            ref.invalidate(songServiceProvider);
                                          },
                                        ),
                                        Option(
                                          iconWidget: Image.asset(
                                            'asset/Icons/chat.png',
                                            height: 30,
                                          ),
                                          label: songList
                                              .data![index].comment_count!
                                              .toString(),
                                          onTap: () {
                                            showModalBottomSheet(
                                              context: context,
                                              builder: ((context) {
                                                return SizedBox(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            120),
                                                                child: Text(
                                                                  '39 comments',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontFamily:
                                                                          "Century",
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  Get.back();
                                                                  // _remove = !_remove;
                                                                },
                                                                child: Icon(
                                                                  Icons.cancel,
                                                                  color: Colors
                                                                          .grey[
                                                                      500],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            height: 400,
                                                            child: Expanded(
                                                              child: Container(
                                                                child:
                                                                    CommentBox(
                                                                  userImage: CommentBox
                                                                      .commentImageParser(
                                                                          imageURLorPath:
                                                                              "assets/img/userpic.jpg"),
                                                                  child: commentChild(
                                                                      filedata),
                                                                  labelText:
                                                                      'Write a comment...',
                                                                  errorText:
                                                                      'Comment cannot be blank',
                                                                  withBorder:
                                                                      false,
                                                                  sendButtonMethod:
                                                                      () {
                                                                    if (formKey
                                                                        .currentState!
                                                                        .validate()) {
                                                                      print(commentController
                                                                          .text);
                                                                      setState(
                                                                          () {
                                                                        var value =
                                                                            {
                                                                          'name':
                                                                              'New User',
                                                                          'pic':
                                                                              'https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
                                                                          'message':
                                                                              commentController.text,
                                                                          'date':
                                                                              '2021-01-01'
                                                                        };
                                                                        filedata.insert(
                                                                            0,
                                                                            value);
                                                                      });
                                                                      commentController
                                                                          .clear();
                                                                      FocusScope.of(
                                                                              context)
                                                                          .unfocus();
                                                                    } else {
                                                                      print(
                                                                          "Not validated");
                                                                    }
                                                                  },
                                                                  formKey:
                                                                      formKey,
                                                                  commentController:
                                                                      commentController,
                                                                  backgroundColor:
                                                                      const Color(
                                                                          0xffff9800),
                                                                  textColor:
                                                                      Colors
                                                                          .white,
                                                                  sendWidget: Icon(
                                                                      Icons
                                                                          .send_sharp,
                                                                      size: 30,
                                                                      color: Colors
                                                                          .white),
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
                                            // _remove
                                            //     ? commentBottomSheet(context)
                                            //     : Container();
                                          },
                                        ),
                                        Option(
                                          iconWidget: Image.asset(
                                            'asset/Icons/paper-plane.png',
                                            height: 30,
                                          ),
                                          label: "0",
                                          onTap: () {
                                            Share.share('com.example.doob');
                                          },
                                        ),
                                        Option(
                                          iconWidget: Image.asset(
                                            'asset/Icons/downloading.png',
                                            height: 30,
                                          ),
                                          label: "0",
                                          onTap: () {},
                                        ),
                                        Option(
                                          iconWidget: isrepeat
                                              ? Image.asset(
                                                  'asset/Icons/shuffle.png',
                                                  height: 30,
                                                )
                                              : Image.asset(
                                                  'asset/Icons/repeat.png',
                                                  height: 30),
                                          label: "",
                                          onTap: () {
                                            setState(() {
                                              isrepeat = !isrepeat;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  //SONG CONTROL AND WAVE ICON
                                  Container(
                                    child: Consumer(
                                        builder: (context, waveIconRef, child) {
                                      final tapChange = waveIconRef
                                          .watch(waveIconTapChangeProvider);
                                      return Container(
                                        margin: EdgeInsets.only(
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
                                                          width:
                                                              size.width * 0.68,
                                                          child: Lottie.asset(
                                                            'asset/lottie/Animation - 1713755104463.json',
                                                          ),
                                                        ),
                                                      ))
                                                  : SizedBox.shrink(),
                                              PlayerButtons(_audioPlayer),
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
                        }, error: (Object error, StackTrace stackTrace) {
                          return Text('$error');
                        }, loading: () {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }),
                        VideoTapScreen(),
                        ForYouTapScreen(),
                        FollowTapScreen()
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 50),
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
                      child: PageViewTextButton(
                        controller: controller,
                      ),
                    ),
                  ],
                );
              },
            ),
          )),
    );
  }

  Future<dynamic> commentBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: ((context) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Century",
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.cancel,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }));
  }
}

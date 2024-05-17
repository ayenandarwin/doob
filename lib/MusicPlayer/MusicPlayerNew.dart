import 'package:comment_box/comment/comment.dart';
import 'package:doob/MusicPlayer/Pause.dart';
import 'package:doob/services/songCommentProvider.dart';
import "package:doob/Controller/navController.dart";

import 'package:doob/src/data/repositories/music_repo/comment_repository.dart';
import 'package:doob/src/data/repositories/music_repo/like_count_repository.dart';
import 'package:doob/src/presentation/widgets/comment/cmt_widget.dart';
import 'package:doob/src/providers/music_provider/comment_provider.dart';
import 'package:doob/src/providers/music_provider/like_count_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import '../Component/playerButton.dart';
import '../src/data/repositories/music_repo/music_repository.dart';
import '../src/domain/state/api_state.dart';
import '../src/providers/music_provider/music_provider.dart';
import '../src/providers/wave_icon_provider/wave_icon_provider.dart';
import '../widgets/common/music_background_image.dart';
import '../widgets/common/option.dart';
import '../widgets/music_player/page_view_text_btn.dart';
import '../widgets/music_player/taps/follow_tap_screen.dart';
import '../widgets/music_player/taps/for_you_tap_screen.dart';
import '../widgets/music_player/taps/video_tap_screen.dart';

final musicDetailProvider =
    StateNotifierProvider.autoDispose<MusicProvider, ApiState>((ref) {
  final repository = ref.watch(musicRepositoryProvider);
  return MusicProvider(repository);
});

final favProvider = StateNotifierProvider<LikeCountProvider, ApiState>((ref) {
  final repository = ref.watch(likeCountRepositoryProvider);
  return LikeCountProvider(repository);
});

final cmtProvider = StateNotifierProvider<CommentProvider, ApiState>((ref) {
  final repository = ref.watch(commentRepositoryProvider);
  return CommentProvider(repository);
});

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
  var commentid;
  bool isReact = true;
  bool _isShuffleMode = false;
  bool _isRepeatMode = false;

  String _modeLabel = "Normal";

  AppLifecycleState? stateChanged;

  int currentindex = 0;
  double value = 50;
  var _remove;
  int? favCount;

  late AudioPlayer _audioPlayer;
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  TextEditingController cmtTextController = TextEditingController();

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
  List<dynamic> cmtList = [];

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

  /* Future<dynamic> getUpdateLikeCount() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // var count = await ref.read(favProvider.notifier).updateLikeCount(id.toString());
      ref.read(musicDetailProvider);
      setState(() {});
    });
  } */

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

  Future<dynamic> getCmtList(String id) async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final data = await ref.watch(cmtProvider.notifier).fetchComment(id);

      cmtList = data;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // final NaviController naviController = Get.put(NaviController());
    // if (naviController.currentIndex.value != 2) {
    //   _audioPlayer.pause();
    // } else {
    //   _audioPlayer.play();
    // }

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
                final songState = ref.watch(musicDetailProvider);
                final NaviController naviController = Get.put(NaviController());
                if (naviController != 2) {
                  _audioPlayer.pause();
                } else {
                  _audioPlayer.play();
                }

                


                if (songState is SuccessState) {
                  print("Song list data : ${songState.data}");
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
                          PageView.builder(
                            scrollDirection: Axis.vertical,
                            controller: musicController,
                            itemCount: songState.data.length,
                            itemBuilder: (context, index) {
                              favCount = songState.data[index].likeCount;
                              _audioPlayer
                                  .setAudioSource(
                                      ConcatenatingAudioSource(children: [
                                AudioSource.uri(Uri.parse(
                                    '${songState.data[index].audio}')),
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
                                        "${songState.data[index].coverPhoto}",
                                  ),
                                  Positioned(
                                    left: 300,
                                    top: size.height * 0.34,
                                    //top: 250,
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
                                                  height: 45,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 40,
                                              left: 19,
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    Color(0xffff9800),
                                                radius: 10,
                                                child: Icon(
                                                  Icons.add,
                                                  fill: 0.5,
                                                  size: 20,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 6),
                                          child: Option(
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
                                            label: isReact
                                                ? songState
                                                    .data[index].likeCount
                                                    .toString()
                                                : "${songState.data[index].likeCount}",
                                            // label: songState.data[index].likeCount.toString(),
                                            onTap: () {
                                              ref
                                                  .read(favProvider.notifier)
                                                  .updateLikeCount(songState
                                                      .data[index].id
                                                      .toString());
                                              // ref.invalidate(musicDetailProvider);
                                              setState(() {
                                                isReact = !isReact;
                                              });
                                              //ref.read(musicDetailProvider.notifier).fetchMusics();
                                            },
                                          ),
                                        ),
                                        Option(
                                          iconWidget: Image.asset(
                                            'asset/Icons/chat.png',
                                            height: 30,
                                          ),
                                          label: songState
                                              .data[index].commentCount
                                              .toString(),
                                          onTap: () {
                                            commentid =
                                                songState.data[index].id;
                                            // commentBottomSheet(context);
                                            showModalBottomSheet(
                                              isScrollControlled: true,
                                              context: context,
                                              builder: (context) {
                                                return Container(
                                                  height: 540,
                                                  child: CmtWidget(
                                                    id: songState.data[index].id
                                                        .toString(),
                                                  ),
                                                );
                                              },
                                            );
                                            // showModalBottomSheet(
                                            //     isScrollControlled: true,
                                            //     context: context,
                                            //     builder: ((context) {
                                            //       return Container(
                                            //         decoration: BoxDecoration(
                                            //             borderRadius:
                                            //                 BorderRadius.only(
                                            //                     topLeft: Radius
                                            //                         .circular(
                                            //                             0),
                                            //                     topRight: Radius
                                            //                         .circular(
                                            //                             0))),
                                            //         height:
                                            //             MediaQuery.of(context)
                                            //                     .size
                                            //                     .height /
                                            //                 2.95 *
                                            //                 2,
                                            //         // width: MediaQuery.of(context)
                                            //         //     .size
                                            //         //     .width,
                                            //         // height: MediaQuery.of(context)
                                            //         //     .size
                                            //         //     .height,
                                            //         child: Padding(
                                            //           padding:
                                            //               const EdgeInsets.all(
                                            //                   8.0),
                                            //           child:
                                            //               SingleChildScrollView(
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
                                            //                       margin: EdgeInsets
                                            //                           .only(
                                            //                               left:
                                            //                                   120),
                                            //                       child: Text(
                                            //                         '${songState.data[index].commentCount.toString()} Comments',
                                            //                         style: TextStyle(
                                            //                             color: Colors
                                            //                                 .black,
                                            //                             fontFamily:
                                            //                                 "Century",
                                            //                             fontSize:
                                            //                                 16,
                                            //                             fontWeight:
                                            //                                 FontWeight.bold),
                                            //                       ),
                                            //                     ),
                                            //                     InkWell(
                                            //                       onTap: () {
                                            //                         Get.back();
                                            //                         // _remove = !_remove;
                                            //                       },
                                            //                       child: Icon(
                                            //                         Icons
                                            //                             .cancel,
                                            //                         color: Colors
                                            //                                 .grey[
                                            //                             500],
                                            //                       ),
                                            //                     ),
                                            //                   ],
                                            //                 ),
                                                           
                                                          
                                            //                 Container(
                                            //                   // margin: EdgeInsets
                                            //                   //     .symmetric(
                                            //                   //         horizontal:
                                            //                   //             10),
                                            //                   height: MediaQuery.of(
                                            //                               context)
                                            //                           .size
                                            //                           .height /
                                            //                       3.1 *
                                            //                       2,
                                            //                   child:
                                            //                   Expanded(
                                            //                     child:
                                            //                         Container(
                                            //                       child:
                                            //                           CommentBox(
                                            //                         userImage: CommentBox
                                            //                             .commentImageParser(
                                            //                                 //  imageURLorPath: "assets/img/userpic.jpg"),
                                            //                                 imageURLorPath:
                                            //                                     "lib/Image/dooblogo.png"),
                                            //                         // child: commentChild(
                                            //                         //     filedata),
                                            //                         child: ref
                                            //                             .watch(songCommentServiceProvider(songState
                                            //                                 .data[
                                            //                                     index]
                                            //                                 .id
                                            //                                 .toString()))
                                            //                             .when(data:
                                            //                                 (songComment) {
                                            //                           return ListView.builder(
                                            //                               scrollDirection: Axis.vertical,
                                            //                               controller: musicController,
                                            //                               itemCount: songComment.data!.length,
                                            //                               itemBuilder: (context, index) {
                                            //                                 return Padding(
                                            //                                   padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
                                            //                                   child: ListTile(
                                            //                                     leading: GestureDetector(
                                            //                                       onTap: () async {
                                            //                                         print("Comment Clicked");
                                            //                                       },
                                            //                                       child: Container(
                                            //                                         height: 40.0,
                                            //                                         width: 40.0,
                                            //                                         decoration: new BoxDecoration(color: Colors.blue, borderRadius: new BorderRadius.all(Radius.circular(50))),
                                            //                                         child: CircleAvatar(
                                            //                                             radius: 40,
                                            //                                             backgroundImage: CommentBox.commentImageParser(
                                            //                                               imageURLorPath: songComment.data![index].customer!.profile_photo!,

                                            //                                               //data[i]['pic']
                                            //                                             )),
                                            //                                       ),
                                            //                                     ),
                                            //                                     title: Text(
                                            //                                       songComment.data![index].customer!.name!,

                                            //                                       // data[i]['name'],
                                            //                                       style: TextStyle(fontWeight: FontWeight.bold),
                                            //                                     ),
                                            //                                     subtitle: songComment.data![index].comment_text != null
                                            //                                         ? Text(
                                            //                                             songComment.data![index].comment_text!,
                                            //                                           )
                                            //                                         : Text('test'),
                                            //                                     // subtitle: Text(data[i]['message']),
                                            //                                     //trailing: Text(data[i]['date'], style: TextStyle(fontSize: 10)),
                                            //                                     // trailing: Text(songComment.data![index].customer!.phone!, style: TextStyle(fontSize: 10)),
                                            //                                   ),
                                            //                                 );
                                            //                               });
                                            //                         }, error: (Object
                                            //                                     error,
                                            //                                 StackTrace
                                            //                                     stackTrace) {
                                            //                           return Text(
                                            //                               '$error');
                                            //                         }, loading:
                                            //                                 () {
                                            //                           return Center(
                                            //                             child:
                                            //                                 CircularProgressIndicator(),
                                            //                           );
                                            //                         }),
                                            //                         // backgroundColor:
                                            //                         //     Colors
                                            //                         //         .red,

                                            //                         labelText:
                                            //                             'Write a comment...',

                                            //                         errorText:
                                            //                             'Comment cannot be blank',
                                            //                         // withBorder:
                                            //                         //     true,
                                            //                         sendButtonMethod:
                                            //                             () {
                                            //                           if (formKey
                                            //                               .currentState!
                                            //                               .validate()) {
                                            //                             print(commentController
                                            //                                 .text);
                                            //                             setState(
                                            //                                 () {
                                            //                               var value =
                                            //                                   {
                                            //                                 'name':
                                            //                                     'New User',
                                            //                                 'pic':
                                            //                                     'https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
                                            //                                 'message':
                                            //                                     commentController.text,
                                            //                                 'date':
                                            //                                     '2021-01-01'
                                            //                               };
                                            //                               filedata.insert(
                                            //                                   0,
                                            //                                   value);
                                            //                             });
                                            //                             commentController
                                            //                                 .clear();
                                            //                             FocusScope.of(context)
                                            //                                 .unfocus();
                                            //                           } else {
                                            //                             print(
                                            //                                 "Not validated");
                                            //                           }
                                            //                         },
                                            //                         formKey:
                                            //                             formKey,
                                            //                         commentController:
                                            //                             commentController,
                                            //                         // backgroundColor:
                                            //                         //     const Color(
                                            //                         //         0xffff9800),
                                            //                         textColor:
                                            //                             Colors
                                            //                                 .grey,
                                            //                         sendWidget: Icon(
                                            //                             Icons
                                            //                                 .send_sharp,
                                            //                             size:
                                            //                                 30,
                                            //                             color: Colors
                                            //                                 .grey),
                                            //                       ),
                                            //                     ),
                                            //                   ),
                                                             
                                            //                 ),

                                            //                 TextField(
                                            //                   controller:
                                            //                       cmtTextController,
                                            //                   decoration:
                                            //                       InputDecoration(
                                            //                           border:
                                            //                               OutlineInputBorder(),
                                            //                           labelText:
                                            //                               'Write your comment',
                                            //                           suffixIcon:
                                            //                               IconButton(
                                            //                             icon: Icon(
                                            //                                 Icons.send),
                                            //                             onPressed:
                                            //                                 () {
                                            //                               Map<String, dynamic>
                                            //                                   body =
                                            //                                   {};
                                            //                               body["comment"] =
                                            //                                   cmtTextController.text;
                                            //                               ref.read(cmtProvider.notifier).addComment(
                                            //                                   songState.data[index].id.toString() ?? "",
                                            //                                   body: body);
                                            //                               setState(
                                            //                                   () {
                                            //                                 getCmtList(songState.data[index].id.toString() ??
                                            //                                     "");
                                            //                                 // ref.watch(musicDetailProvider.notifier).fetchMusics();
                                            //                               });
                                            //                               cmtTextController
                                            //                                   .clear();
                                            //                             },
                                            //                           )),
                                            //                 ),
                                            //               ],
                                            //             ),
                                            //           ),
                                            //         ),
                                            //       );
                                            //     }));
                                          },
                                        ),
                                        Option(
                                          iconWidget: Image.asset(
                                            'asset/Icons/paper-plane.png',
                                            height: 30,
                                          ),
                                          label: songState
                                              .data[index].shareCount
                                              .toString(),
                                          onTap: () {
                                            Share.share(songState
                                                .data![index].audio
                                                .toString());

                                            //Share.share('com.example.doob');
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
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8),
                                          child: InkWell(
                                              onTap: () {
                                                setState(() {});
                                                //  isrepeat = !isrepeat;
                                                _toggleShuffleRepeat();
                                              },
                                              child:
                                                  // isrepeat
                                                  _isShuffleMode
                                                      ? Image.asset(
                                                          'asset/Icons/shuffle.png',
                                                          height: 30)
                                                      : _isRepeatMode
                                                          ? Image.asset(
                                                              'asset/Icons/repeat.png',
                                                              height: 30)
                                                          : Image.asset(
                                                              'asset/Icons/shuffle.png',
                                                              height: 30)),
                                        ),
                                        // Option(
                                        //   iconWidget: isrepeat
                                        //       ? Image.asset(
                                        //           'asset/Icons/shuffle.png',
                                        //           height: 30,
                                        //         )
                                        //       : Image.asset(
                                        //           'asset/Icons/repeat.png',
                                        //           height: 30),
                                        //   label: "",
                                        //   onTap: () {},
                                        // ),
                                      ],
                                    ),
                                  ),
                                  // Center(
                                  //   child: Text(
                                  //     "$index",
                                  //     style: TextStyle(color: Colors.white),
                                  //   ),
                                  // ),
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
                                  Container(
                                    child: Consumer(
                                        builder: (context, waveIconRef, child) {
                                      final tapChange = waveIconRef
                                          .watch(waveIconTapChangeProvider);
                                      return Container(
                                        margin: EdgeInsets.only(
                                            top: size.height * 0.75),
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
                                              PlayerButtons(_audioPlayer,
                                                  songState.data[index].lyric),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ],
                              );
                            },
                          ),
                          VideoTapScreen(),
                          ForYouTapScreen(),
                          FollowTapScreen()
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 35),
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
                } else if (songState is LoadingState) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                } else {
                  return Text("");
                }
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

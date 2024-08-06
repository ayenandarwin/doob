import 'package:comment_box/comment/comment.dart';
import 'package:doob/MusicPlayer/Pause.dart';
import 'package:doob/MusicPlayer/downloading_dialog.dart';
import 'package:doob/MusicPlayer/videoplayer.dart';
import 'package:doob/Pages/Explore.dart';
import 'package:doob/Pages/Library.dart';
import 'package:doob/services/songCommentProvider.dart';
import "package:doob/Controller/navController.dart";
import 'package:doob/src/data/repositories/delight_repo/delight_repository.dart';
import 'package:doob/src/data/repositories/music_repo/comment_repository.dart';
import 'package:doob/src/data/repositories/music_repo/like_count_repository.dart';
import 'package:doob/src/presentation/widgets/comment/cmt_widget.dart';
import 'package:doob/src/providers/delight_provider/delight_provider.dart';
import 'package:doob/src/providers/music_provider/comment_provider.dart';
import 'package:doob/src/providers/music_provider/like_count_provider.dart';
import 'package:doob/widgets/music_player/follow/follow_audio_detail.dart';
import 'package:doob/widgets/music_player/taps/delight_fine.dart';
import 'package:doob/widgets/music_player/taps/delight_ok.dart';
import 'package:doob/widgets/music_player/taps/delight_ok_Ok.dart';
import 'package:doob/widgets/music_player/taps/delight_tap.dart';
import 'package:doob/widgets/music_player/taps/delight_tap_screen.dart';
import 'package:doob/widgets/music_player/taps/music_tap_screen.dart';
import 'package:doob/widgets/music_player/taps/video_player_screen.dart';
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
import 'package:http/http.dart' as http;

final musicDetailProvider =
    StateNotifierProvider.autoDispose<MusicProvider, ApiState>((ref) {
  final repository = ref.watch(musicRepositoryProvider);
  return MusicProvider(repository);
});

// final delightDetailProvider =
//     StateNotifierProvider.autoDispose<DelightProvider, ApiState>((ref) {
//   final repository = ref.watch(delightRepositoryProvider);
//   return DelightProvider(repository);
// });

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

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: GestureDetector(
            onTap: () {
              // onPanUpdate: (details) {
              // if (details.delta.dx > 0) {
              //   Get.to(() => Library());
              //   print("Dragging in +X direction");
              // } else {
              //   Get.to(() => Explore());
              //   print("Dragging in -X direction");
              // }

              // if (details.delta.dy > 0)
              //   print("Dragging in +Y direction");
              // else
              //   print("Dragging in -Y direction");

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
                //final delightState = ref.watch(delightDetailProvider);

                // final NaviController naviController = Get.put(NaviController());
                // if (naviController != 2) {
                //   _audioPlayer.pause();
                // } else {
                //   _audioPlayer.play();
                // }

                if (songState is SuccessState) {
                  // print('songstate data ${songState.data}');

                  final songLists = songState.data!
                      .where((item) => item.type.toString() == 'song')
                      .toList();
                  print("Song list data : ${songLists}");

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
                          //Music Page
                          PageView.builder(
                            scrollDirection: Axis.vertical,
                            controller: musicController,
                            itemCount: songLists.length,
                            itemBuilder: (context, index) {
                              var text = songLists[index].audio;

                              List<String> substrings = text.split('/');

                              //  print("It is OK ${songLists.status} ");
                              print("It is OK 1 ${substrings[0]} ");
                              print("It is OK  2 ${substrings[1]} ");
                              print("It is OK 3 ${substrings[2]} ");
                              print("It is OK 4 ${substrings[3]} ");
                              print("It is OK 5 ${substrings[4]} ");
                              print("It is OK 5 ${substrings[5]} ");

                              String audioFile =
                                  "${substrings[3]}/${substrings[4]}/${substrings[5]}";

                              print('audio file path $audioFile');

                              favCount = songLists[index].likeCount;
                              _audioPlayer
                                  .setAudioSource(
                                      ConcatenatingAudioSource(children: [
                                AudioSource.uri(
                                    Uri.parse('${songLists[index].audio}')),
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
                                    imageUrl: "${songLists[index].coverPhoto}",
                                  ),
                                  Positioned(
                                    left: 300,
                                    top: size.height * 0.27,
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.to(() =>
                                                FollowAudioDetailScreen(
                                                    songState.data));
                                          },
                                          child: Stack(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  child: Image.asset(
                                                    'assets/Image/jojipf.jpg',
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
                                                : "${songLists[index].likeCount}",
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
                                            'assets/Icons/chat.png',
                                            height: 30,
                                          ),
                                          label: songState
                                              .data[index].commentCount
                                              .toString(),
                                          onTap: () {
                                            commentid = songLists[index].id;
                                            // commentBottomSheet(context);
                                            showModalBottomSheet(
                                              isScrollControlled: true,
                                              context: context,
                                              builder: (context) {
                                                return Container(
                                                  height: 540,
                                                  child: CmtWidget(
                                                    id: songLists[index]
                                                        .id
                                                        .toString(),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                        Option(
                                          iconWidget: Image.asset(
                                            'assets/Icons/paper.png',
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
                                            'assets/Icons/downloading1.png',
                                            height: 30,
                                          ),
                                          label: "0",
                                          onTap: () async {
                                            //                final downloadBook = await ref
                                            // .read(audioDownloadProvider(audioBookId).future);
                                            // if (songLists.status == true)
                                            // {
                                            //   ref.read(profileDownload);
                                            // }

                                            showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  DownloadingDialog(
                                                urllink: songLists[index].audio,
                                                file: audioFile,
                                                //    '${data.mp3Location}${data.audioBook!.mp3!.file}',
                                                // file: '${data.audioBook!.id}.mp3',
                                              ),
                                            );
                                          },
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
                                                          'assets/Icons/shuffle_copy.png',
                                                          height: 30)
                                                      : _isRepeatMode
                                                          ? Image.asset(
                                                              'assets/Icons/repeat.png',
                                                              height: 30)
                                                          : Image.asset(
                                                              'assets/Icons/shuffle_copy.png',
                                                              height: 30)),
                                        ),
                                      ],
                                    ),
                                  ),
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
                                                          width:
                                                              size.width * 0.68,
                                                          child: Lottie.asset(
                                                            'assets/lottie/Animation - 1713755104463.json',
                                                          ),
                                                        ),
                                                      ))
                                                  : SizedBox.shrink(),
                                              PlayerButtons(_audioPlayer,
                                                  songLists[index].lyric),
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

                          //Video Page
                          VideoPlayerScreen(songLists),

                          //For you page
                          MusicTapScreen(),

                          //Delight Page
                          // DelightTapScreen(),
                          VideoPlayerScreen(songLists),

                          //DelightOK()
                          // DelightScreen(),

                          // DelightFine(),
                          // DelightPage()
                          // NewVideoPlayTwo(songLists),
                          //  VideoPlayerScreen(songLists),
                          // ForYouTapScreen(),
                          //FollowTapScreen()
                        ],
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
                                          'Delight',
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
                              ],
                            ),
                          ),
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
}

// import 'package:doob/MusicPlayer/MusicPlayerNew.dart';
// import 'package:doob/src/data/repositories/delight_repo/delight_repository.dart';
// import 'package:doob/src/domain/model/delight.dart';
// import 'package:doob/src/domain/state/api_state.dart';
// import 'package:doob/src/presentation/widgets/comment/cmt_widget.dart';
// import 'package:doob/src/providers/delight_provider/delight_provider.dart';
// import 'package:doob/widgets/common/option.dart';
// import 'package:doob/widgets/music_player/follow/follow_video_detail.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:get/get.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:video_player/video_player.dart';

// final delightDetailProvider =
//     StateNotifierProvider.autoDispose<DelightProvider, ApiState>((ref) {
//   final repository = ref.watch(delightRepositoryProvider);
//   return DelightProvider(repository);
// });

// class DelightScreen extends ConsumerStatefulWidget {
//   const DelightScreen({super.key});

//   // final List _vData;

//   @override
//   _DelightScreenState createState() => _DelightScreenState();
// }

// class _DelightScreenState extends ConsumerState<DelightScreen> {
//   late Map<int, VideoPlayerController> _controllers;
//   late VideoPlayerController _controller;
//   late PageController _pageController;
//   // late List<Data> delightData; // R
//   int _currentIndex = 0;
//   bool isReact = true;
//   var commentid;
//   bool isrepeat = true;

//   @override
//   void initState() {
//     super.initState();
//     _controllers = {};
//     _pageController = PageController(initialPage: _currentIndex);
//    // _initializeController(_currentIndex);
//   }

//   @override
//   void dispose() {
//     _controllers.values.forEach((controller) => controller.dispose());
//     _pageController.dispose();
//     super.dispose();
//   }

//   Future<void> _initializeController(int index) async {

//     final videoUrl = delightState.data[index].mtv;
//     final controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl!));

//     controller.addListener(() {
//       if (controller.value.hasError) {
//         print('Video player error: ${controller.value.errorDescription}');
//       }
//     });

//     try {
//       await controller.initialize();
//       if (mounted) {
//         setState(() {
//           _controllers[index] = controller;
//           controller.play();
//         });
//       }
//     } catch (e) {
//       print('Error initializing video controller: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Consumer(
//       builder: (context, ref, child) {
//         final delightState = ref.watch(delightDetailProvider);
//         if (delightState is SuccessState) {
//           return PageView.builder(
//             controller: _pageController,
//             scrollDirection: Axis.vertical,
//             itemCount: delightState.data.length,
//             onPageChanged: (index) {
//               setState(() {
//                 _currentIndex = index;
//                 _controller;
//                 // if (!_controllers.containsKey(index)) {
//                 //   _initializeController(index);
//                 // }
//               });
//             },
//             itemBuilder: (context, index) {
//               final controller = _controllers[index];
//               if (controller == null || !controller.value.isInitialized) {
//                 return Center(child: CircularProgressIndicator());
//               }
//               return Stack(
//                 children: [
//                   SizedBox.expand(
//                     child: FittedBox(
//                       fit: BoxFit.cover,
//                       child: SizedBox(
//                         width: controller.value.size?.width ?? 0,
//                         height: controller.value.size?.height ?? 0,
//                         child: VideoPlayer(controller),
//                       ),
//                     ),
//                   ),
//                   // Container(
//                   //  child: Center(
//                   //   child: AspectRatio(
//                   //   aspectRatio: controller.value.aspectRatio,
//                   //   child: VideoPlayer(controller),
//                   // ),
//                   // ),
//                   // ),
//                   GestureDetector(
//                     onTap: () async {
//                       if (controller.value.isPlaying) {
//                         await controller.pause();
//                       } else {
//                         await controller.play();
//                       }
//                       setState(() {});
//                     },
//                     child: Center(
//                       child: Container(
//                         color: Colors.transparent,
//                         height: double.infinity,
//                         width: double.infinity,
//                         child: Visibility(
//                           visible: !controller.value.isPlaying,
//                           child: Icon(
//                             Icons.play_arrow,
//                             size: 80,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     left: 300,
//                     // top: size.height * 0.34,
//                     top: size.height * 0.27,
//                     //top: 250,
//                     child: Column(
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             Get.to(() => FollowDetailScreen(delightState.data));
//                           },
//                           child: Stack(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(100),
//                                   child: Image.asset(
//                                     'assets/Image/jojipf.jpg',
//                                     height: 45,
//                                   ),
//                                 ),
//                               ),
//                               Positioned(
//                                 top: 40,
//                                 left: 19,
//                                 child: CircleAvatar(
//                                   backgroundColor: Color(0xffff9800),
//                                   radius: 10,
//                                   child: Icon(
//                                     Icons.add,
//                                     fill: 0.5,
//                                     size: 20,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 6),
//                           child: Option(
//                             iconWidget: isReact
//                                 ? Icon(
//                                     Icons.favorite,
//                                     size: 40,
//                                     color: Colors.white,
//                                   )
//                                 : Icon(
//                                     Icons.favorite,
//                                     size: 40,
//                                     color: Color(0xffff9800),
//                                   ),
//                             label: isReact
//                                 ? delightState.data[index].likeCount.toString()
//                                 : "${delightState.data[index].likeCount}",
//                             onTap: () {
//                               ref.read(favProvider.notifier).updateLikeCount(
//                                   delightState.data[index].id.toString());
//                               // ref.invalidate(musicDetailProvider);
//                               setState(() {
//                                 isReact = !isReact;
//                               });
//                               //ref.read(musicDetailProvider.notifier).fetchMusics();
//                             },
//                           ),
//                         ),
//                         Option(
//                           iconWidget: Image.asset(
//                             'assets/Icons/chat.png',
//                             height: 30,
//                           ),
//                           label:
//                               delightState.data[index].commentCount.toString(),
//                           onTap: () {
//                             commentid = delightState.data[index].id;
//                             // commentBottomSheet(context);
//                             showModalBottomSheet(
//                               isScrollControlled: true,
//                               context: context,
//                               builder: (context) {
//                                 return Container(
//                                   height: 540,
//                                   child: CmtWidget(
//                                     id: delightState.data[index].id.toString(),
//                                   ),
//                                 );
//                               },
//                             );
//                           },
//                         ),
//                         Option(
//                           iconWidget: Image.asset(
//                             'assets/Icons/paper.png',
//                             height: 30,
//                           ),
//                           label: delightState.data[index].shareCount.toString(),
//                           onTap: () {
//                             Share.share(
//                                 delightState.data[index].audio.toString());

//                             //Share.share('com.example.doob');
//                           },
//                         ),
//                         Option(
//                           iconWidget: Image.asset(
//                             'assets/Icons/downloading1.png',
//                             height: 30,
//                           ),
//                           label: "0",
//                           onTap: () {},
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 8),
//                           child: InkWell(
//                               onTap: () {
//                                 setState(() {});
//                               },
//                               child: isrepeat
//                                   ? Image.asset('assets/Icons/shuffle_copy.png',
//                                       height: 30)
//                                   : Image.asset('assets/Icons/repeat.png',
//                                       height: 30)),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.bottomCenter,
//                     child: Padding(
//                       padding: const EdgeInsets.only(
//                         top: 0,
//                       ),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           SizedBox(
//                             height: 8,
//                             child: VideoProgressIndicator(
//                               controller,
//                               allowScrubbing: true,
//                               colors: VideoProgressColors(
//                                 backgroundColor: Colors.white.withOpacity(0.1),
//                                 bufferedColor: Colors.white.withOpacity(0.3),
//                                 playedColor: Color(0xffffff9800),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           );
//         } else if (delightState.data is LoadingState) {
//           return Center(
//             child: CircularProgressIndicator(
//               color: Colors.white,
//             ),
//           );
//         } else {
//           return Text("");
//         }
//       },
//     );
//   }
// }

import 'package:doob/MusicPlayer/MusicPlayerNew.dart';
import 'package:doob/src/data/repositories/delight_repo/delight_repository.dart';
import 'package:doob/src/domain/model/delight.dart';
import 'package:doob/src/domain/state/api_state.dart';
import 'package:doob/src/presentation/widgets/comment/cmt_widget.dart';
import 'package:doob/src/providers/delight_provider/delight_provider.dart';
import 'package:doob/widgets/common/option.dart';
import 'package:doob/widgets/music_player/follow/follow_video_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

final delightDetailProvider =
    StateNotifierProvider.autoDispose<DelightProvider, ApiState>((ref) {
  final repository = ref.watch(delightRepositoryProvider);
  return DelightProvider(repository);
});

class DelightScreen extends ConsumerStatefulWidget {
  const DelightScreen({super.key});

  // final List _vData;

  @override
  _DelightScreenState createState() => _DelightScreenState();
}

class _DelightScreenState extends ConsumerState<DelightScreen> {
  late Map<int, VideoPlayerController> _controllers;
  late VideoPlayerController _controller;
  late PageController _pageController;
  // late List<Data> delightData; // R
  int _currentIndex = 0;
  bool isReact = true;
  var commentid;
  bool isrepeat = true;

  @override
  void initState() {
    super.initState();
    _controllers = {};
    _pageController = PageController(initialPage: _currentIndex);

    // Accessing the delightDetailProvider value to check if data has been fetched
    final delightState = ref.read(delightDetailProvider);
    if (mounted) {
      if (delightState is SuccessState || delightState is ErrorState) {
        _initializeController(_currentIndex);
      } else if (delightState is InitialState) {
        // Fetch API data if not already fetched
        ref.read(delightDetailProvider.notifier).fetchMusics();
      }
    }
  }



  @override
  void dispose() {
    _controllers.values.forEach((controller) => controller.dispose());
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _initializeController(int index) async {
    final delightState = ref.watch(delightDetailProvider);
    if (delightState is SuccessState && delightState.data.length > index) {
      final videoUrl = delightState.data[index].mtv;
      final controller = VideoPlayerController.network(videoUrl!);

      controller.addListener(() {
        if (controller.value.hasError) {
          print('Video player error: ${controller.value.errorDescription}');
        }
      });

      try {
        await controller.initialize();
        if (mounted) {
          setState(() {
            _controllers[index] = controller;
            controller.play();
          });
        }
      } catch (e) {
        print('Error initializing video controller: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer(
      builder: (context, ref, child) {
        final delightState = ref.watch(delightDetailProvider);
        if (delightState is SuccessState) {
          return PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemCount: delightState.data.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
                _initializeController(index);
              });
            },
            itemBuilder: (context, index) {
              final controller = _controllers[index];
              if (controller == null || !controller.value.isInitialized) {
                return Center(child: CircularProgressIndicator());
              }
              return Stack(
                children: [
                  SizedBox.expand(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: controller.value.size?.width ?? 0,
                        height: controller.value.size?.height ?? 0,
                        child: VideoPlayer(controller),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (controller.value.isPlaying) {
                        await controller.pause();
                      } else {
                        await controller.play();
                      }
                      setState(() {});
                    },
                    child: Center(
                      child: Container(
                        color: Colors.transparent,
                        height: double.infinity,
                        width: double.infinity,
                        child: Visibility(
                          visible: !controller.value.isPlaying,
                          child: Icon(
                            Icons.play_arrow,
                            size: 80,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 300,
                    top: size.height * 0.27,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(() => FollowDetailScreen(delightState.data));
                          },
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
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
                                  backgroundColor: Color(0xffff9800),
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
                          padding: const EdgeInsets.only(top: 6),
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
                                ? delightState.data[index].likeCount.toString()
                                : "${delightState.data[index].likeCount}",
                            onTap: () {
                              ref.read(favProvider.notifier).updateLikeCount(
                                  delightState.data[index].id.toString());
                              setState(() {
                                isReact = !isReact;
                              });
                            },
                          ),
                        ),
                        Option(
                          iconWidget: Image.asset(
                            'assets/Icons/chat.png',
                            height: 30,
                          ),
                          label:
                              delightState.data[index].commentCount.toString(),
                          onTap: () {
                            commentid = delightState.data[index].id;
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return Container(
                                  height: 540,
                                  child: CmtWidget(
                                    id: delightState.data[index].id.toString(),
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
                          label: delightState.data[index].shareCount.toString(),
                          onTap: () {
                            Share.share(
                                delightState.data[index].audio.toString());
                          },
                        ),
                        Option(
                          iconWidget: Image.asset(
                            'assets/Icons/downloading1.png',
                            height: 30,
                          ),
                          label: "0",
                          onTap: () {},
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: InkWell(
                              onTap: () {
                                setState(() {});
                              },
                              child: isrepeat
                                  ? Image.asset('assets/Icons/shuffle_copy.png',
                                      height: 30)
                                  : Image.asset('assets/Icons/repeat.png',
                                      height: 30)),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 8,
                            child: VideoProgressIndicator(
                              controller,
                              allowScrubbing: true,
                              colors: VideoProgressColors(
                                backgroundColor: Colors.white.withOpacity(0.1),
                                bufferedColor: Colors.white.withOpacity(0.3),
                                playedColor: Color(0xffffff9800),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        } else if (delightState is LoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else {
          return Text("");
        }
      },
    );
  }
}

// import 'package:doob/MusicPlayer/MusicPlayerNew.dart';
// import 'package:doob/src/data/repositories/delight_repo/delight_repository.dart';
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

// class DelightTapScreen extends StatefulWidget {
//   const DelightTapScreen({super.key});

//   @override
//   State<DelightTapScreen> createState() => _DelightTapScreenState();
// }

// class _DelightTapScreenState extends State<DelightTapScreen> {
//   // late Map<int, VideoPlayerController> _controllers;
//   late VideoPlayerController _controller;

//   late PageController _pageController;
//   bool isReact = true;
//   var commentid;
//   bool isrepeat = true;

//   @override
//   void initState() {
//     super.initState();
//     // _controllers = {};
//     // _pageController = PageController(initialPage: _currentIndex);
//   }

//   //  @override
//   // void dispose() {
//   //   _controllers.values.forEach((controller) => controller.dispose());
//   //   _pageController.dispose();
//   //   super.dispose();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Consumer(
//       builder: (context, ref, child) {
//         final delightOk = ref.watch(delightDetailProvider);

//         if (delightOk is SuccessState) {
//           print("Delight list data : ${delightOk.data}");
//           return PageView.builder(
//             controller: _pageController,
//             scrollDirection: Axis.vertical,
//             itemCount: delightOk.data.length,
//             onPageChanged: (index) {},
//             itemBuilder: (context, index) {

//               return Stack(
//                 children: [
//                   SizedBox.expand(
//                     child: FittedBox(
//                       fit: BoxFit.cover,
//                       child: SizedBox(
//                         width: _controller.value.size?.width ?? 0,
//                         height: _controller.value.size?.height ?? 0,
//                         child: VideoPlayer(VideoPlayerController.networkUrl(
//                             Uri.parse(delightOk.data[index].mtv))
//                           ..initialize().then((_) {
//                             if (mounted) {
//                               setState(() {});
//                               _controller.play();
//                             }
//                           })),
//                       ),
//                     ),
//                   ),

//                   GestureDetector(
//                     onTap: () async {
//                       if (_controller.value.isPlaying) {
//                         await _controller.pause();
//                       } else {
//                         await _controller.play();
//                       }
//                       setState(() {});
//                     },
//                     child: Center(
//                       child: Container(
//                         color: Colors.transparent,
//                         height: double.infinity,
//                         width: double.infinity,
//                         child: Visibility(
//                           visible: !_controller.value.isPlaying,
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
//                             //   Get.to(() => FollowDetailScreen(delightOk.data));
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
//                                 ? delightOk.data[index].likeCount.toString()
//                                 : "${delightOk.data[index].likeCount}",
//                             onTap: () {
//                               ref.read(favProvider.notifier).updateLikeCount(
//                                   delightOk.data[index].id.toString());
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
//                           label: delightOk.data[index].commentCount.toString(),
//                           onTap: () {
//                             commentid = delightOk.data[index].id;
//                             // commentBottomSheet(context);
//                             showModalBottomSheet(
//                               isScrollControlled: true,
//                               context: context,
//                               builder: (context) {
//                                 return Container(
//                                   height: 540,
//                                   child: CmtWidget(
//                                     id: delightOk.data[index].id.toString(),
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
//                           label: delightOk.data[index].shareCount.toString(),
//                           onTap: () {
//                             Share.share(delightOk.data[index].audio.toString());

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
//                               _controller,
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
//         } else if (delightOk is LoadingState) {
//           return Center(
//             child: CircularProgressIndicator(
//               color: Colors.white,
//             ),
//           );
//         } else {
//           return Text("");
//         }
//       },
//       // child:
//     );
//   }
// }

import 'package:doob/MusicPlayer/MusicPlayerNew.dart';
import 'package:doob/src/data/repositories/delight_repo/delight_repository.dart';
import 'package:doob/src/domain/state/api_state.dart';
import 'package:doob/src/providers/delight_provider/delight_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';
import 'package:doob/src/presentation/widgets/comment/cmt_widget.dart';
import 'package:doob/widgets/common/option.dart';
import 'package:doob/widgets/music_player/follow/follow_video_detail.dart';

final delightDetailProvider =
    StateNotifierProvider.autoDispose<DelightProvider, ApiState>((ref) {
  final repository = ref.watch(delightRepositoryProvider);
  return DelightProvider(repository);
});

class DelightTapScreen extends StatefulWidget {
  const DelightTapScreen({Key? key}) : super(key: key);

  @override
  State<DelightTapScreen> createState() => _DelightTapScreenState();
}

class _DelightTapScreenState extends State<DelightTapScreen> {
  late VideoPlayerController _controller;
  late PageController _pageController;
  bool isReact = true;
  var commentid;
  bool isrepeat = true;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.network(''); // Initialize with empty URL
    _pageController = PageController(); // Initialize the PageController
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the VideoPlayerController
    _pageController.dispose(); // Dispose of the PageController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer(
      builder: (context, ref, child) {
        final delightOk = ref.watch(delightDetailProvider);

        if (delightOk is SuccessState) {
          print("Delight list data : ${delightOk.data}");
          return PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemCount: delightOk.data.length,
            onPageChanged: (index) {},
            itemBuilder: (context, index) {
              _controller = VideoPlayerController.network(
                  delightOk.data[index].mtv.toString());
              return Stack(
                children: [
                  SizedBox.expand(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: _controller.value.size?.width ?? 0,
                        height: _controller.value.size?.height ?? 0,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (_controller.value.isPlaying) {
                        await _controller.pause();
                      } else {
                        await _controller.play();
                      }
                      setState(() {});
                    },
                    child: Center(
                      child: Container(
                        color: Colors.transparent,
                        height: double.infinity,
                        width: double.infinity,
                        child: Visibility(
                          visible: !_controller.value.isPlaying,
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
                    // top: size.height * 0.34,
                    top: size.height * 0.27,
                    //top: 250,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            //   Get.to(() => FollowDetailScreen(delightOk.data));
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
                                ? delightOk.data[index].likeCount.toString()
                                : "${delightOk.data[index].likeCount}",
                            onTap: () {
                              ref.read(favProvider.notifier).updateLikeCount(
                                  delightOk.data[index].id.toString());
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
                          label: delightOk.data[index].commentCount.toString(),
                          onTap: () {
                            commentid = delightOk.data[index].id;
                            // commentBottomSheet(context);
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return Container(
                                  height: 540,
                                  child: CmtWidget(
                                    id: delightOk.data[index].id.toString(),
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
                          label: delightOk.data[index].shareCount.toString(),
                          onTap: () {
                            Share.share(delightOk.data[index].audio.toString());

                            //Share.share('com.example.doob');
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
                              _controller,
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
                  // Other widgets
                ],
              );
            },
          );
        } else if (delightOk is LoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else {
          return Text(
              ""); // Placeholder widget if state is not SuccessState or LoadingState
        }
      },
    );
  }
}

import 'package:doob/MusicPlayer/videoplayer.dart';
import 'package:doob/src/data/repositories/music_repo/music_repository.dart';
import 'package:doob/src/domain/model/song_obj.dart';
import 'package:doob/src/domain/state/api_state.dart';
import 'package:doob/src/providers/music_provider/music_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';


final musicDetailProvider =
    StateNotifierProvider.autoDispose<MusicProvider, ApiState>((ref) {
  final repository = ref.watch(musicRepositoryProvider);
  return MusicProvider(repository);
});

class VideoTapScreen extends StatefulWidget {
  const VideoTapScreen(this._vData, {super.key});

  final List _vData;

  @override
  State<VideoTapScreen> createState() => _VideoTapScreenState();
}

class _VideoTapScreenState extends State<VideoTapScreen> {
  late Map<int, VideoPlayerController> _controllers;
  late PageController _pageController;
  int _currentIndex = 0;

  late VideoPlayerController _controller;
  Future<List<String>>? _videoUrls;

  bool isicon = false;

  @override
  void initState() {
    super.initState();
    _controllers = {};
    _pageController = PageController(initialPage: _currentIndex);
    _initializeController(_currentIndex);
  }

  Future<void> _initializeController(int index) async {
    final controller =
        VideoPlayerController.networkUrl(Uri.parse(widget._vData[index].mtv));
    await controller.initialize();
    if (mounted) {
      setState(() {
        _controllers[index] = controller;
        controller.play();
      });
    }
  }

  @override
  void dispose() {
    _controllers.values.forEach((controller) => controller.dispose());
    _pageController.dispose();
    super.dispose();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _controller =
  //    VideoPlayerController.networkUrl(Uri.parse(
  //       'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'
  //       // widget.songState.data
  //       ))
  //     ..initialize().then((_) {
  //       if (mounted) {
  //         setState(() {});
  //         _controller.play();
  //       }
  //     });
  // }

  @override
  Widget build(BuildContext context) {
    print('Ok **************** ${widget._vData[0].mtv}');
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      itemCount: widget._vData.length,
      onPageChanged: (index) {
        setState(() {
          _currentIndex = index;
          if (!_controllers.containsKey(index)) {
            _initializeController(index);
          }
        });
      },

      ////scrollDirection: Axis.vertical,
      //itemCount: 5,
      itemBuilder: (context, index) {
        final controller = _controllers[index];
        if (controller == null || !controller.value.isInitialized) {
          return Center(child: CircularProgressIndicator());
        }
        return Stack(
          children: [
            Container(
                // height: double.infinity,
                child: Center(
              child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(
                    controller
                      // _controller= VideoPlayerController.networkUrl(Uri.parse(
                      //   widget._vData[index].mtv,
                      // ))
                      //   ..initialize().then((_) {
                      //     if (mounted) {
                      //       setState(() {});
                      //       _controller.play();
                      //     }
                      //   })
                      )),
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
                      visible: !controller.value.isPlaying,
                      child: Icon(
                        Icons.play_arrow,
                        size: 80,
                        color: Colors.white,
                      )),
                  // child: Visibility(
                  //   visible: isicon,
                  //   child: Icon(
                  //     _controller.value.isPlaying
                  //         ? Icons.pause
                  //         : Icons.play_arrow,
                  //     size: 80,
                  //     color: Colors.white,
                  //   ),
                  // ),
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
                                    'assets/Image/jojipf.jpg',
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
                              Image.asset('assets/Icons/love.png', height: 25),
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
                              Image.asset('assets/Icons/comment.png',
                                  height: 25),
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
                              Image.asset('assets/Icons/share.png', height: 25),
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
                              Image.asset('assets/Icons/download.png',
                                  height: 25),
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
                              Image.asset('assets/Icons/option.png',
                                  height: 25),
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
      },
      // children: [

      // VideoScreenCard(),
      //   VideoScreenCard(),
      //   // VideoScreenCard(),
      //   // VideoScreenCard(),
      //   // VideoScreenCard(),
      //   // VideoScreenCard(),
      // ],
    );
  }
}

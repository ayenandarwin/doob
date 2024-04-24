import 'package:doob/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_waveform_progressbar/simple_waveform_progressbar.dart';

class PlayerButtons extends StatefulWidget {
  const PlayerButtons(this._audioPlayer, {super.key});

  final AudioPlayer _audioPlayer;

  //late AudioController _controller;

  //final int duration;
  // final Color color;

  // List<Color> colors = [
  //   Colors.blueAccent,
  //   Colors.greenAccent,
  //   Colors.yellowAccent,
  //   Colors.redAccent
  // ];

  @override
  State<PlayerButtons> createState() => _PlayerButtonsState();
}

class _PlayerButtonsState extends State<PlayerButtons>
    with SingleTickerProviderStateMixin {
  List<Color> colors = [
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.yellowAccent,
    Colors.redAccent
  ];

  List<int> duration = [900, 700, 600, 800, 500];

  late Animation<double> animation;
  late AnimationController animationController;

  double _progressValue = 0.0;
  int currentIndex = 0;
  bool isPlaying = true;

  @override
  void initState() {
    super.initState();
    initAudioPlayer();
    animationController = AnimationController(
        duration: Duration(milliseconds: 1200), vsync: this);

    final curvedAnimation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInCubic);

    animation = Tween<double>(begin: 0, end: 100).animate(curvedAnimation)
      ..addListener(() {
        animationController.repeat(reverse: true);
      });

    // widget._audioPlayer.play();

    // widget._audioPlayer.playerStateStream.listen((state) {
    //   setState(() {
    //     isPlaying == state.playing;
    //   });
    // });

    widget._audioPlayer.positionStream.listen((position) {
      final duration = widget._audioPlayer.duration;
      if (duration != null) {
        if (mounted) {
          setState(() {
            _progressValue = position.inMilliseconds / duration.inMilliseconds;
          });
        }
      }
    });
  }

  Future<void> initAudioPlayer() async {
    try {
      await widget._audioPlayer.play();

      //await widget._audioPlayer.setUrl(widget.audioUrl);
    } catch (e) {
      print('Error loading audio $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final audioDuration = widget._audioPlayer.duration;

    return SizedBox(
      width: size.width * 0.9,
      child: Column(
        children: [
          Stack(
            children: [
              // Container(
              //   child: Lottie.asset(
              //     'asset/lottie/Animation - 1713755104463.json',
              //     width: size.width,
              //   ),
              // ),
              Container(
                padding: EdgeInsets.only(top: 50),
                child: SizedBox(
                  height: 32,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${widget._audioPlayer.position.inMinutes.remainder(60).toString().padLeft(2, '0')}:${(widget._audioPlayer.position.inSeconds.remainder(60)).toString().padLeft(2, '0')}',
                        style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'Century',
                            color: Colors.white),
                      ),
                      // SizedBox(
                      //   width: size.width * 0.68,
                      //   height: 20,
                      //   child: WaveformProgressbar(
                      //     color: Colors.grey,
                      //     //progressColor: Constants.kGradient,
                      //     progressColor: Color(0xffFF9800),
                      //     progress: _progressValue,
                      //     onTap: (progress) {
                      //       var tt = progress;
                      //     },
                      //   ),
                      // ),
                      Container(
                        width: size.width * 0.68,
                        child: LinearProgressIndicator(
                          value: _progressValue,
                          color: const Color(0xffff9800),
                        ),
                      ),
                      Text(
                        '${audioDuration?.inMinutes.remainder(60).toString().padLeft(2, '0')}:${(widget._audioPlayer.duration?.inSeconds.remainder(60)).toString().padLeft(2, '0')}',
                        style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'Century',
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              // StreamBuilder<SequenceState?>(
              //   stream: widget._audioPlayer.sequenceStateStream,
              //   builder: (_, __) {
              //     return _previousButton();
              //   },
              // ),
              // StreamBuilder<Duration>(
              //   stream: widget._audioPlayer.positionStream,
              //   builder: (_, __) {
              //     return _previousSecodsButton();
              //   },
              // ),
              StreamBuilder<PlayerState?>(
                stream: widget._audioPlayer.playerStateStream,
                builder: (_, snapshot) {
                  final playerState = snapshot.data;
                  //final isPlaying = playerState?.playing ?? true;
                  final processingState = playerState?.processingState;
                  //  final processState = snapshot.data?.processingState;
                  if (processingState == ProcessingState.loading ||
                      processingState == ProcessingState.buffering) {
                    // Container(
                    //   height: 40,
                    //   width: 200,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(50),
                    //       color: Color(0xffFF9800)),
                    //   child: Container(
                    //     height: 50,
                    //     alignment: Alignment.center,
                    //     child: SizedBox(
                    //       width: 25,
                    //       height: 25,
                    //       child: CircularProgressIndicator(
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   ),
                    // );
                    return CircleAvatar(
                      maxRadius: 25,
                      backgroundColor: const Color(0xffff9800),
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        width: 25.0,
                        height: 25.0,
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    );
                  } else if (widget._audioPlayer.playing != true) {
                    //   return Container(
                    //     height: 40,
                    //     width: 200,
                    //     decoration: BoxDecoration(
                    //       color: Color(0xffff9800),
                    //       borderRadius: BorderRadius.circular(25),
                    //     ),
                    //     child: Center(
                    //       child: Text(
                    //         'Lyrics',
                    //         style: TextStyle(
                    //             fontFamily: 'Century',
                    //             fontSize: 14,
                    //             fontWeight: FontWeight.bold,
                    //             color: Colors.white),
                    //       ),
                    //     ),
                    //   );
                    return CircleAvatar(
                      maxRadius: 25,
                      backgroundColor: Color(0xffff9800),
                      child: IconButton(
                        icon: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                        iconSize: 30.0,
                        onPressed: widget._audioPlayer.play,
                      ),
                    );
                  } else if (processingState != ProcessingState.completed) {
                    return CircleAvatar(
                      maxRadius: 25,
                      backgroundColor: const Color(0xffff9800),
                      child: IconButton(
                        icon: const Icon(
                          Icons.pause,
                          color: Colors.white,
                        ),
                        iconSize: 30.0,
                        onPressed: widget._audioPlayer.pause,
                      ),
                    );
                  } else {
                    return IconButton(
                      icon: const Icon(
                        Icons.replay,
                      ),
                      iconSize: 40.0,
                      onPressed: () => widget._audioPlayer.seek(Duration.zero,
                          index: widget._audioPlayer.effectiveIndices!.first),
                    );
                  }

                  //  return _playPauseButton(playerState!);
                },
              ),
              // StreamBuilder<Duration>(
              //   stream: widget._audioPlayer.positionStream,
              //   builder: (_, __) {
              //     return _skipSecondsButton();
              //   },
              // ),
              // StreamBuilder<SequenceState?>(
              //   stream: widget._audioPlayer.sequenceStateStream,
              //   builder: (_, __) {
              //     return _nextButton();
              //   },
              // ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget _playPauseButton(PlayerState playerState) {
  //   final processingState = playerState.processingState;
  //   if (processingState == ProcessingState.loading ||
  //       processingState == ProcessingState.buffering) {
  //     return Container(
  //       margin: const EdgeInsets.all(8.0),
  //       width: 64.0,
  //       height: 64.0,
  //       child: const CircularProgressIndicator(),
  //     );
  //   } else if (widget._audioPlayer.playing != true) {
  //     return IconButton(
  //       icon: const Icon(Icons.play_arrow),
  //       iconSize: 64.0,
  //       onPressed: widget._audioPlayer.play,
  //     );
  //   } else if (processingState != ProcessingState.completed) {
  //     return IconButton(
  //       icon: const Icon(Icons.pause),
  //       iconSize: 64.0,
  //       onPressed: widget._audioPlayer.pause,
  //     );
  //   } else {
  //     return IconButton(
  //       icon: const Icon(Icons.replay),
  //       iconSize: 64.0,
  //       onPressed: () => widget._audioPlayer.seek(Duration.zero,
  //           index: widget._audioPlayer.effectiveIndices!.first),
  //     );
  //   }
  // }

  Widget _shuffleButton(BuildContext context, bool isEnabled) {
    return IconButton(
      icon: isEnabled
          ? const Icon(Icons.shuffle, color: Colors.blueAccent)
          : const Icon(Icons.shuffle),
      onPressed: () async {
        final enable = !isEnabled;
        if (enable) {
          await widget._audioPlayer.shuffle();
        }
        await widget._audioPlayer.setShuffleModeEnabled(enable);
      },
    );
  }

  // Widget _previousButton() {
  //   // if (currentIndex > 0) {
  //   //   setState(() {
  //   //     currentIndex--;

  //   //   });
  //   // }
  //   return IconButton(
  //       icon: const Icon(
  //         Icons.skip_previous,
  //         color: Colors.black,
  //       ),
  //       onPressed: () {
  //         setState(() {
  //           widget._audioPlayer.seekToPrevious;
  //         });
  //       }
  //       // widget._audioPlayer.hasPrevious
  //       //     ? widget._audioPlayer.seekToPrevious
  //       //     : null,
  //       );
  // }

  Widget _previousSecodsButton() {
    return IconButton(
      icon: const Icon(
        Icons.replay_10,
        size: 20,
        color: Colors.white,
      ),
      // icon: const Icon(Icons.replay),
      onPressed: () async {
        final currentPosition = await widget._audioPlayer.position;
        final newPosition = currentPosition - const Duration(seconds: 10);
        await widget._audioPlayer.seek(newPosition);
      },
    );
  }

  Widget _nextButton() {
    return IconButton(
        icon: const Icon(
          Icons.skip_next,
          color: Colors.black,
        ),
        onPressed: widget._audioPlayer.seekToNext
        // widget._audioPlayer.hasNext ? widget._audioPlayer.seekToNext : null,
        );
  }

  Widget _skipSecondsButton() {
    return IconButton(
      icon: Icon(
        Icons.forward_10,
        size: 20,
        color: Colors.white,
      ),
      onPressed: () {
        widget._audioPlayer.seek(
            Duration(seconds: widget._audioPlayer.position.inSeconds + 10));
      },
    );
  }

  Widget _repeatButton(BuildContext context, LoopMode loopMode) {
    final icons = [
      const Icon(Icons.repeat),
      Icon(Icons.repeat, color: Theme.of(context).colorScheme.secondary),
      Icon(Icons.repeat_one, color: Theme.of(context).colorScheme.secondary),
    ];
    const cycleModes = [
      LoopMode.off,
      LoopMode.all,
      LoopMode.one,
    ];
    final index = cycleModes.indexOf(loopMode);
    return IconButton(
      icon: icons[index],
      onPressed: () {
        widget._audioPlayer.setLoopMode(
            cycleModes[(cycleModes.indexOf(loopMode) + 1) % cycleModes.length]);
      },
    );
  }
}

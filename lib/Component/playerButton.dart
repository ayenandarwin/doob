import 'dart:async';
import 'package:doob/src/domain/model/lyrics.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lrc/lrc.dart';
import 'package:http/http.dart' as http;
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:video_player/video_player.dart';

class PlayerButtons extends StatefulWidget {
  const PlayerButtons(this._audioPlayer, this.lyrics, {super.key});

  final AudioPlayer _audioPlayer;
  final String lyrics;

  @override
  State<PlayerButtons> createState() => _PlayerButtonsState();
}

class _PlayerButtonsState extends State<PlayerButtons>
    with SingleTickerProviderStateMixin {
  late Future<Map<String, List<String>>> lrcContent;

  final List<int> duration = [900, 700, 600, 800, 500];

 // List<Lyric>? lyrics = [];
  final ItemScrollController itemScrollController = ItemScrollController();
  final ScrollOffsetController scrollOffsetController =
      ScrollOffsetController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  final ScrollOffsetListener scrollOffsetListener =
      ScrollOffsetListener.create();

  late Animation<double> animation;
  late AnimationController animationController;
  late VideoPlayerController controller;

  double _progressValue = 0.0;
  int currentIndex = 0;
  bool isPlaying = true;

  Duration currentDuration = Duration.zero;

  String formatDuration(Duration duration) {
    //  int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);
    int seconds = duration.inSeconds.remainder(60);
    // return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    initAudioPlayer();

    // http.get(Uri.parse('')).then((response) {
    //   String data = response.body;
    //   data
    //       .split('\n')
    //       .map((e) => Lyric(
    //           words: e.split(' ').sublist(1).join(' '),
    //           timestamp: DateFormat("[HH:mm:ss]").parse(e.split(' ')[0])))
    //       .toList();

    //   setState(() {});
    // });
   

   

    

    widget._audioPlayer.positionStream.listen((position) {
      // DateTime dt = DateTime(1970, 1, 1).copyWith(
      //     hour: position.inHours,
      //     minute: position.inMinutes.remainder(60),
      //     second: position.inSeconds.remainder(60));

      // for (int index = 0; index < lyrics!.length; index++) {
      //   if (lyrics![index].timestamp!.isAfter(dt)) {
      //     itemScrollController.scrollTo(
      //         index: index, duration: Duration(milliseconds: 600));
      //     break;
      //   }
      // }

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

  void _seekAudio(Duration duration) {
    widget._audioPlayer.seek(duration);
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

    return SizedBox(
      width: size.width * 0.9,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 42),
                child: SizedBox(
                  height: 32,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formatDuration(
                          widget._audioPlayer.position,
                        ),
                        style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'Century',
                            color: Colors.white),
                      ),


                      InkWell(
                        onTap: () {
                          widget._audioPlayer.seek(Duration(
                              seconds:
                                  widget._audioPlayer.position.inSeconds + 20));
                        },
                        child: Container(
                          width: size.width * 0.65,
                          child: LinearProgressIndicator(
                            value: _progressValue,
                            color: const Color(0xffff9800),
                          ),
                        ),
                      ),

                      widget._audioPlayer.duration != null
                          ? Text(
                              formatDuration(widget._audioPlayer.duration! -
                                  widget._audioPlayer.position),
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: 'Century',
                                  color: Colors.white),
                            )
                          : Text(
                              '00:00',
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
          SizedBox(height: 25.0),
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
                    return 
                    Container(
                      height: 40,
                      width: 200,
                      decoration: 
                      BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xffFF9800)),
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 25,
                          height: 25,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                    // return CircleAvatar(
                    //   maxRadius: 25,
                    //   backgroundColor: const Color(0xffff9800),
                    //   child: Container(
                    //     margin: const EdgeInsets.all(8.0),
                    //     width: 25.0,
                    //     height: 25.0,
                    //     child: const CircularProgressIndicator(
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // );
                  } else if (widget._audioPlayer.playing != true) {
                    return lyricButton();
                    // return CircleAvatar(
                    //   maxRadius: 25,
                    //   backgroundColor: Color(0xffff9800),
                    //   child: IconButton(
                    //     icon: const Icon(
                    //       Icons.play_arrow,
                    //       color: Colors.white,
                    //     ),
                    //     iconSize: 30.0,
                    //     onPressed: widget._audioPlayer.play,
                    //   ),
                    // );
                  } else if (processingState != ProcessingState.completed) {
                    return lyricButton();
                    // return CircleAvatar(
                    //   maxRadius: 25,
                    //   backgroundColor: const Color(0xffff9800),
                    //   child: IconButton(
                    //     icon: const Icon(
                    //       Icons.pause,
                    //       color: Colors.white,
                    //     ),
                    //     iconSize: 30.0,
                    //     onPressed: widget._audioPlayer.pause,
                    //   ),
                    // );
                  } else {
                    return lyricButton();
                    // return IconButton(
                    //   icon: const Icon(
                    //     Icons.replay,
                    //   ),
                    //   iconSize: 40.0,
                    //   onPressed: () => widget._audioPlayer.seek(Duration.zero,
                    //       index: widget._audioPlayer.effectiveIndices!.first),
                    // );
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

  Widget lyricButton() {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 120),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black38,
                  //color: Colors.transparent,
                  border: Border.all(color: Colors.white)),
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
                  // lyrics != null
                  
                  //     ? ScrollablePositionedList.builder(
                  //         itemCount: lyrics!.length,
                  //         itemBuilder: (context, index) {
                  //           // Duration duration =
                  //           //     snapshot.data ?? Duration(seconds: 8);

                  //           // DateTime dt = DateTime(1970, 1, 1).copyWith(
                  //           //     hour: duration.inHours,
                  //           //     minute: duration.inMinutes.remainder(60),
                  //           //     second: duration.inSeconds.remainder(60));
                  //           return Center(
                  //             child: Padding(
                  //               padding:
                  //                   const EdgeInsets.symmetric(horizontal: 16),
                  //               child: widget.lyrics != ""
                  //                   ? Text(
                  //                       // lyrics ?? 'No lyrics available', // Handle null lyrics
                  //                       '${widget.lyrics}',

                  //                       // 'You are my sunshine, my only sunshine you make me happy when skies are gray you will never keep dear,how much I love you,please don\'t take my sunshine away.',
                  //                       textAlign: TextAlign.center,
                  //                       style: TextStyle(
                  //                         fontFamily: 'Century',
                  //                         // wordSpacing: 2,
                  //                         fontSize: 16,
                  //                         fontWeight: FontWeight.bold,
                  //                         color: Colors.white,
                  //                       ),
                  //                     )
                  //                   : Text(
                  //                       // lyrics ?? 'No lyrics available', // Handle null lyrics
                  //                       'No lyrics available',

                  //                       // 'You are my sunshine, my only sunshine you make me happy when skies are gray you will never keep dear,how much I love you,please don\'t take my sunshine away.',
                  //                       textAlign: TextAlign.center,
                  //                       style: TextStyle(
                  //                         fontFamily: 'Century',
                  //                         // wordSpacing: 2,
                  //                         fontSize: 16,
                  //                         fontWeight: FontWeight.bold,
                  //                         color: Colors.white,
                  //                       ),
                  //                     ),
                  //             ),
                  //           );
                  //         },
                  //         //=> Text('Item $index'),
                  //         // Text(lyrics![index].words)
                  //         itemScrollController: itemScrollController,
                  //         scrollOffsetController: scrollOffsetController,
                  //         itemPositionsListener: itemPositionsListener,
                  //         scrollOffsetListener: scrollOffsetListener,
                  //       )
                  //     : SizedBox(),


                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child:
                      widget.lyrics !=""?
                       Text(
                        // lyrics ?? 'No lyrics available', // Handle null lyrics
                        '${widget.lyrics}',

                        // 'You are my sunshine, my only sunshine you make me happy when skies are gray you will never keep dear,how much I love you,please don\'t take my sunshine away.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Century',
                          // wordSpacing: 2,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ):Text(
                        // lyrics ?? 'No lyrics available', // Handle null lyrics
                        'No lyrics available',

                        // 'You are my sunshine, my only sunshine you make me happy when skies are gray you will never keep dear,how much I love you,please don\'t take my sunshine away.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Century',
                          // wordSpacing: 2,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
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

  Widget _previousButton() {
    // if (currentIndex > 0) {
    //   setState(() {
    //     currentIndex--;

    //   });
    // }
    return IconButton(
        icon: const Icon(
          Icons.skip_previous,
          color: Colors.black,
        ),
        onPressed: () {
          setState(() {
            widget._audioPlayer.seekToPrevious;
          });
        }
        // widget._audioPlayer.hasPrevious
        //     ? widget._audioPlayer.seekToPrevious
        //     : null,
        );
  }

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

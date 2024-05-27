import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:share_plus/share_plus.dart';

import '../../../data/repositories/music_repo/music_repository.dart';
import '../../../domain/state/api_state.dart';
import '../../../providers/music_provider/music_provider.dart';
import '../../../providers/pause_provider.dart';
import '../../../providers/wave_icon_provider/wave_icon_provider.dart';
import '../../widgets/comment/cmt_widget.dart';
import '../../widgets/common/music_background_image.dart';
import '../../widgets/common/option.dart';
import "package:doob/Controller/navController.dart";

import '../../widgets/music_player/song_control.dart';

final musicDetailProvider =
    StateNotifierProvider.autoDispose<MusicProvider, ApiState>((ref) {
  final repository = ref.watch(musicRepositoryProvider);
  return MusicProvider(repository);
});

class MusicScreen extends ConsumerStatefulWidget {
  const MusicScreen({super.key});

  @override
  ConsumerState<MusicScreen> createState() => _MusicScreenState();
}

late AudioPlayer _audioPlayer;

class _MusicScreenState extends ConsumerState<MusicScreen> {
  bool isrepeat = true;
  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    //_remove = true;
  }

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final songState = ref.watch(musicDetailProvider);

    final NaviController naviController = Get.put(NaviController());
    if (naviController.currentIndex.value != 2) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play();
    }

    // final tap = ref.watch(bottomTapChangeProvider);
    // if (tap != 2) {
    //   _audioPlayer.pause();
    // } else {
    //   _audioPlayer.play();
    // }
    if (songState is SuccessState) {
      return PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: songState.data.length,
        itemBuilder: (context, index) {
          _audioPlayer.setAudioSource(ConcatenatingAudioSource(children: [
            AudioSource.uri(Uri.parse('${songState.data[index].audio}')),
          ]));

          return InkWell(
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
            child: Container(
              color: Colors.black,
              height: size.height,
              child: Stack(
                children: [
                  MusicBackgroundImage(
                    imageUrl: "${songState.data[index].coverPhoto}",
                  ),
                  Positioned(
                    right: 0,
                    top: 150,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  'assets/Image/jojipf.jpg',
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
                        /* FAV OPTION */
                        Option(
                          iconWidget: Icon(
                            Icons.favorite,
                            size: 40,
                            color: Color(0xffff9800),
                          ),
                          label: songState.data[index].likeCount.toString(),
                          onTap: () {
                            //ref.read(favProvider.notifier).updateLikeCount(songState.data[index].id.toString());
                            // ref.read(musicDetailProvider.notifier).fetchMusics();
                          },
                        ),

                        /* COMMENT OPTION */
                        IconButton(
                          icon: Image.asset(
                            "assets/Icons/chat.png",
                            height: 30,
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return Container(
                                  height: 540,
                                  child: CmtWidget(
                                    id: songState.data[index].id.toString(),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        Text(
                          "${songState.data[index].commentCount}",
                          style: TextStyle(color: Colors.white),
                        ),
                        /* SHARE OPTION */
                        Option(
                          iconWidget: Image.asset(
                            'assets/Icons/paper-plane.png',
                            height: 30,
                          ),
                          label: "0",
                          onTap: () {
                            Share.share('com.example.doob');
                          },
                        ),
                        /* DOWNLOAD OPTION */
                        Option(
                          iconWidget: Image.asset(
                            'assets/Icons/downloading.png',
                            height: 30,
                          ),
                          label: "0",
                          onTap: () {},
                        ),
                        /* SHUFFLE OPTION */
                        Option(
                          iconWidget: isrepeat
                              ? Image.asset(
                                  'assets/Icons/Shuffle.png',
                                  height: 30,
                                )
                              : Image.asset('assets/Icons/repeat.png',
                                  height: 30),
                          label: "",
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  SongControl(
                    audioPlayer: _audioPlayer,
                  ),
                ],
              ),
            ),
          );
        },
      );
    } else if (songState is LoadingState) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Center(
        child: Text("Error"),
      );
    }
  }
}

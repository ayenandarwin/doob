// import 'package:doob/src/providers/pause_provider.dart';
// import 'package:doob/src/data/repositories/music_repo/like_count_repository.dart';
// import 'package:doob/src/presentation/widgets/comment/cmt_widget.dart';
// import 'package:doob/src/providers/music_provider/like_count_provider.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:lottie/lottie.dart';
// import 'package:share_plus/share_plus.dart';

// import '../../../../Component/playerButton.dart';
// import '../../../data/repositories/music_repo/comment_repository.dart';
// import '../../../data/repositories/music_repo/music_repository.dart';
// import '../../../domain/state/api_state.dart';
// import '../../../providers/music_provider/comment_provider.dart';
// import '../../../providers/music_provider/music_provider.dart';
// import '../../../providers/wave_icon_provider/wave_icon_provider.dart';
// import '../../widgets/common/music_background_image.dart';
// import '../../widgets/common/option.dart';
// import '../../widgets/music_player/page_view_text_btn.dart';
// import 'follow_tap_screen.dart';
// import 'for_you_tap_screen.dart';
// import 'video_tap_screen.dart';

// final musicDetailProvider = StateNotifierProvider.autoDispose<MusicProvider, ApiState>((ref) {
//   final repository = ref.watch(musicRepositoryProvider);
//   return MusicProvider(repository);
// });

// final favProvider = StateNotifierProvider<LikeCountProvider, ApiState>((ref) {
//   final repository = ref.watch(likeCountRepositoryProvider);
//   return LikeCountProvider(repository);
// });

// final cmtProvider = StateNotifierProvider<CommentProvider, ApiState>((ref) {
//   final repository = ref.watch(commentRepositoryProvider);
//   return CommentProvider(repository);
// });

// class MusicTapScreen extends ConsumerStatefulWidget {
//   MusicTapScreen({super.key});
//   @override
//   _MusicPlayerNewState createState() => _MusicPlayerNewState();
// }

// class _MusicPlayerNewState extends ConsumerState<MusicTapScreen> {
//   PageController controller = PageController();
//   PageController musicController = PageController();
//   bool isPlaying = true;
//   bool isicon = false;
//   bool isrepeat = true;
//   bool isReact = true;

//   AppLifecycleState? stateChanged;

//   List<Color> colors = [Colors.blueAccent, Colors.greenAccent, Colors.yellowAccent, Colors.redAccent];
//   List<int> duration = [900, 700, 600, 800, 500];

//   int currentindex = 0;
//   double value = 50;
//   var _remove;
//   int? favCount;

//   late AudioPlayer _audioPlayer;
//   final formKey = GlobalKey<FormState>();
//   final TextEditingController commentController = TextEditingController();
//   List filedata = [
//     {'name': 'Chuks Okwuenu', 'pic': 'https://picsum.photos/300/30', 'message': 'I love to code', 'date': '2021-01-01 12:00:00'},
//     {'name': 'Biggi Man', 'pic': 'https://www.adeleyeayodeji.com/img/IMG_20200522_121756_834_2.jpg', 'message': 'Very cool', 'date': '2021-01-01 12:00:00'},
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _audioPlayer = AudioPlayer();
//     _remove = true;
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _audioPlayer.dispose();
//   }

 

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return SafeArea(
//       child: Scaffold(
//           backgroundColor: Colors.black,
//           body: InkWell(
//             onTap: () {
//               if (_audioPlayer.playing) {
//                 _audioPlayer.pause();

//                 ref.read(waveIconTapChangeProvider.notifier).isAudioPlay(false);
//                 ref.read(pauseChangeProvider.notifier).isAudioPlay(true);
//               } else {
//                 _audioPlayer.play();
//                 ref.read(waveIconTapChangeProvider.notifier).isAudioPlay(true);
//                 ref.read(pauseChangeProvider.notifier).isAudioPlay(false);
//               }
//             },
//             child: Consumer(
//               builder: (context, ref, child) {
//                 final songState = ref.watch(musicDetailProvider);

//                 if (songState is SuccessState) 
                
//                 {
//                   print("Song list data : ${songState.data}");
//                   return Stack(
//                     children: [
//                       PageView(
//                         controller: controller,
//                         onPageChanged: (value) {
//                           setState(() {
//                             currentindex = value;
//                           });
//                         },
//                         children: [
//                           PageView.builder(
//                             scrollDirection: Axis.vertical,
//                             controller: musicController,
//                             itemCount: songState.data.length,
//                             itemBuilder: (context, index) {
//                               favCount = songState.data[index].likeCount;
//                               _audioPlayer
//                                   .setAudioSource(ConcatenatingAudioSource(children: [
//                                 AudioSource.uri(Uri.parse('${songState.data[index].audio}')),
//                               ]))
//                                   .catchError((error) {
//                                 if (kDebugMode) {
//                                   print("An error occured $error");
//                                 }
//                                 return null;
//                               });
//                               return Stack(
//                                 children: [
//                                   MusicBackgroundImage(
//                                     imageUrl: "${songState.data[index].coverPhoto}",
//                                   ),
//                                   Positioned(
//                                     left: 300,
//                                     top: 150,
//                                     child: Column(
//                                       children: [
//                                         Stack(
//                                           children: [
//                                             Padding(
//                                               padding: const EdgeInsets.all(8.0),
//                                               child: ClipRRect(
//                                                 borderRadius: BorderRadius.circular(100),
//                                                 child: Image.asset(
//                                                   'assets/Image/jojipf.jpg',
//                                                   height: 40,
//                                                 ),
//                                               ),
//                                             ),
//                                             Positioned(
//                                               top: 35,
//                                               left: 15,
//                                               child: CircleAvatar(
//                                                 backgroundColor: Colors.white,
//                                                 radius: 10,
//                                                 child: Icon(
//                                                   Icons.add,
//                                                   size: 20,
//                                                   color: Color(0xffff9800),
//                                                 ),
//                                               ),
//                                             )
//                                           ],
//                                         ),
//                                         /* FAV OPTION */
//                                         Option(
//                                           iconWidget: isReact
//                                               ? Icon(
//                                                   Icons.favorite,
//                                                   size: 40,
//                                                   color: Colors.white,
//                                                 )
//                                               : Icon(
//                                                   Icons.favorite,
//                                                   size: 40,
//                                                   color: Color(0xffff9800),
//                                                 ),
//                                           label: songState.data[index].likeCount.toString(),
//                                           onTap: () {
//                                             ref.read(favProvider.notifier).updateLikeCount(songState.data[index].id.toString());
//                                             ref.read(musicDetailProvider.notifier).fetchMusics();
//                                           },
//                                         ),

//                                         /* COMMENT OPTION */
//                                         IconButton(
//                                           icon: Image.asset(
//                                             "assets/Icons/chat.png",
//                                             height: 30,
//                                           ),
//                                           onPressed: () {
//                                             showModalBottomSheet(
//                                               isScrollControlled: true,
//                                               context: context,
//                                               builder: (context) {
//                                                 return CmtWidget(
//                                                   id: songState.data[index].id.toString(),
//                                                 );
//                                               },
//                                             );
//                                           },
//                                         ),
//                                         Text(
//                                           "${songState.data[index].commentCount}",
//                                           style: TextStyle(color: Colors.white),
//                                         ),
//                                         /* SHARE OPTION */
//                                         Option(
//                                           iconWidget: Image.asset(
//                                             'assets/Icons/paper-plane.png',
//                                             height: 30,
//                                           ),
//                                           label: "0",
//                                           onTap: () {
//                                             Share.share('com.example.doob');
//                                           },
//                                         ),
//                                         /* DOWNLOAD OPTION */
//                                         Option(
//                                           iconWidget: Image.asset(
//                                             'assets/Icons/downloading.png',
//                                             height: 30,
//                                           ),
//                                           label: "0",
//                                           onTap: () {},
//                                         ),
//                                         /* SHUFFLE OPTION */
//                                         Option(
//                                           iconWidget: isrepeat
//                                               ? Image.asset(
//                                                   'assets/Icons/shuffle.png',
//                                                   height: 30,
//                                                 )
//                                               : Image.asset('assets/Icons/repeat.png', height: 30),
//                                           label: "",
//                                           onTap: () {},
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Container(
//                                     child: Consumer(builder: (context, waveIconRef, child) {
//                                       final tapChange = waveIconRef.watch(waveIconTapChangeProvider);
//                                       return Container(
//                                         margin: EdgeInsets.only(top: size.height * 0.68),
//                                         child: Center(
//                                           child: Stack(
//                                             children: [
//                                               tapChange
//                                                   ? Positioned(
//                                                       top: 8,
//                                                       left: 40,
//                                                       child: Center(
//                                                         child: Container(
//                                                           width: size.width * 0.68,
//                                                           child: Lottie.asset(
//                                                             'asset/lottie/Animation - 1713755104463.json',
//                                                           ),
//                                                         ),
//                                                       ))
//                                                   : SizedBox.shrink(),
//                                               PlayerButtons(_audioPlayer),
//                                             ],
//                                           ),
//                                         ),
//                                       );
//                                     }),
//                                   ),
//                                 ],
//                               );
//                             },
//                           ),
//                           VideoTapScreen(),
//                           ForYouTapScreen(),
//                           FollowTapScreen()
//                         ],
//                       ),
//                       Container(
//                         padding: EdgeInsets.symmetric(horizontal: 50),
//                         height: 50,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                             gradient: LinearGradient(colors: [
//                           Colors.black.withOpacity(0.5),
//                           Colors.transparent,
//                         ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
//                         child: PageViewTextButton(
//                           controller: controller,
//                         ),
//                       ),
//                     ],
//                   );
//                 } else if (songState is LoadingState) {
//                   return Center(
//                     child: CircularProgressIndicator(
//                       color: Colors.white,
//                     ),
//                   );
//                 } else {
//                   return Text("");
//                 }
//               },
//             ),
//           )),
//     );
//   }
// }

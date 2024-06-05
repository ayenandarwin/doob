import 'package:doob/MusicPlayer/MusicPlayerNew.dart';
import 'package:doob/services/songServiceProvider.dart';
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

class DelightFine extends StatefulWidget {
  const DelightFine({Key? key}) : super(key: key);

  @override
  State<DelightFine> createState() => _DelightFineState();
}

class _DelightFineState extends State<DelightFine> {
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
        ref.watch(songServiceProvider).when(data: (delight) {
          return PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemCount: delight!.data!.length,
            onPageChanged: (index) {},
            itemBuilder: (context, index) {
              _controller = VideoPlayerController.network(
                  delight!.data![index].mtv.toString());
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
                  // Other widgets
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
        });
        return Text('');

        // if (delightOk is SuccessState) {
        //   print("Delight list data : ${delightOk.data}");

        // } else if (delightOk is LoadingState) {
        //   return Center(
        //     child: CircularProgressIndicator(
        //       color: Colors.white,
        //     ),
        //   );
        // }
        //  else {
        //   return Text(
        //       ""); // Placeholder widget if state is not SuccessState or LoadingState
        // }
      },
    );
  }
}

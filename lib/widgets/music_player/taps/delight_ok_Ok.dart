import 'package:doob/src/domain/state/api_state.dart';
import 'package:doob/widgets/music_player/taps/delight_ok.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';
import 'package:share_plus/share_plus.dart';

// Your other imports...

class DelightOK extends StatefulWidget {
  const DelightOK({Key? key}) : super(key: key);

  @override
  State<DelightOK> createState() => _DelightOKState();
}

class _DelightOKState extends State<DelightOK> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(); // Initialize the PageController
  }

  @override
  void dispose() {
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
          print('Length is ${delightOk.data}');
          print(
              "Delight list data : ${delightOk.data[0].mtv} lenght is ${delightOk.data.length}");

          return PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemCount: delightOk.data.length,
            onPageChanged: (index) {},
            itemBuilder: (context, index) {
              VideoPlayerController _controller =
                  VideoPlayerController.network(delightOk.data[index].mtv);
              // Initialize the VideoPlayerController with the network URL
              _controller.initialize().then((_) {
                setState(() {});
                print(
                    "videocontroller ok ok  $_controller"); // Ensure the widget rebuilds after initialization
              });

              if (delightOk.data.isEmpty) {
                return Center(
                  child: Text('No data available'),
                );
              } else {
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
                    // Your other widgets...
                  ],
                );
              }
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

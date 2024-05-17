import 'package:doob/src/presentation/bottom_nav_bar/feed_nav/follow_tap_screen.dart';
import 'package:doob/src/presentation/bottom_nav_bar/feed_nav/for_you_tap_screen.dart';
import 'package:doob/src/presentation/bottom_nav_bar/feed_nav/music_screen.dart';
import 'package:doob/src/presentation/bottom_nav_bar/feed_nav/video_tap_screen.dart';
import 'package:flutter/material.dart';

class FeedNavScreen extends StatefulWidget {
  const FeedNavScreen({super.key});

  @override
  State<FeedNavScreen> createState() => _FeedNavScreenState();
}

class _FeedNavScreenState extends State<FeedNavScreen> {
  PageController controller = PageController();
  List<String> tabList = [
    "Music",
    "Video",
    "For you",
    "Blah",
  ];
  tabLabel() {
    List<Widget> tabs = [];
    for (var i = 0; i < tabList.length; i++) {
      tabs.add(Tab(
        text: tabList[i],
      ));
    }
    ;
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabList.length,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [MusicScreen(), VideoTapScreen(), ForYouTapScreen(), FollowTapScreen()],
                ),
                Container(
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    tabAlignment: TabAlignment.start,
                    labelColor: Colors.amber,
                    indicatorColor: Colors.transparent,
                    isScrollable: true,
                    tabs: tabLabel(),
                    onTap: (_) => FocusManager.instance.primaryFocus?.unfocus(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

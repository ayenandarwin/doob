import 'package:doob/MusicPlayer/MusicPlayer.dart';
import 'package:doob/src/presentation/bottom_nav_bar/feed_nav/music_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doob/Controller/navController.dart';
import 'package:doob/Pages/Explore.dart';
import 'package:doob/Pages/Home.dart';
import 'package:doob/Pages/Homenew.dart';
import 'package:doob/Pages/Library.dart';
import 'package:doob/Pages/premium/Premium.dart';
import 'package:doob/utils/global.dart';
import '../MusicPlayer/MusicPlayerNew.dart';

class NaviScreen extends StatefulWidget {
  @override
  _NaviScreenState createState() => _NaviScreenState();
}

class _NaviScreenState extends State<NaviScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(milliseconds: 1000));

  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontFamily: 'Century',
      fontSize: 13);

  final TextStyle selectedLabelStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontFamily: 'Century',
    fontSize: 13,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  buildBottomNavigationMenu(context, naviController) {
    return Obx(() {
      return Visibility(
        visible: naviController.isBottomNavVisible.value,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
          child: SlideTransition(
            position: Tween<Offset>(begin: Offset.zero, end: Offset(0, 2))
                .animate(CurvedAnimation(
                    parent: _controller, curve: Curves.easeInOut)),
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: SizedBox(
                child: BottomNavigationBar(
                  showUnselectedLabels: true,
                  showSelectedLabels: true,
                  onTap: naviController.changePage,
                  currentIndex: naviController.currentIndex.value,
                  backgroundColor: Colors.black,
                  unselectedItemColor: Colors.white,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Color(0xffff9800),
                  unselectedLabelStyle: unselectedLabelStyle,
                  selectedLabelStyle: selectedLabelStyle,
                  items: [
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Image.asset(
                          "assets/Icons/home.png",
                          width: 25,
                          height: 25,
                        ),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Image.asset(
                          "assets/Icons/home.png",
                          color: Color(0xffff9800),
                          width: 25,
                          height: 25,
                        ),
                      ),
                      label: "Home".tr,
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Image.asset(
                          "assets/Icons/search.png",
                          width: 25,
                          height: 25,
                        ),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Image.asset(
                          "assets/Icons/search.png",
                          color: Color(0xffff9800),
                          width: 25,
                          height: 25,
                        ),
                      ),
                      label: "Search".tr,
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Image.asset(
                          "assets/Image/list.png",
                          color: Colors.white,
                          width: 25,
                          height: 25,
                        ),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Image.asset(
                          "assets/Image/list.png",
                          color: Color(0xffff9800),
                          width: 25,
                          height: 25,
                        ),
                      ),
                      label: "Feed".tr,
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Image.asset(
                          "assets/Icons/folder.png",
                          width: 30,
                          height: 30,
                        ),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Image.asset(
                          "assets/Icons/folder.png",
                          color: Color(0xffff9800),
                          width: 30,
                          height: 30,
                        ),
                      ),
                      label: "Library".tr,
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Image.asset(
                          "assets/Icons/feed1.png",
                          width: 30,
                          height: 30,
                        ),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Image.asset(
                          "assets/Icons/feed1.png",
                          color: Color(0xffff9800),
                          width: 30,
                          height: 30,
                        ),
                      ),
                      label: "Premium".tr,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final NaviController naviController = Get.put(NaviController());
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: buildBottomNavigationMenu(context, naviController),
      body: Obx(() => NotificationListener<ScrollUpdateNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification.scrollDelta!.isNegative) {
                naviController.isBottomNavVisible.value = true;
              } else if (!scrollNotification.scrollDelta!.isNegative) {
                naviController.isBottomNavVisible.value = false;
              }
              return true;
            },
            child: IndexedStack(
              index: naviController.currentIndex.value,
              children: [
                Visibility(
                    visible: naviController.currentIndex.value == 0,
                    child: HomeScreen()),
                Visibility(
                    visible: naviController.currentIndex.value == 1,
                    child: Explore()),
                // MusicPlayer(),
                Visibility(
                    visible: naviController.currentIndex.value == 2,
                    child: MusicPlayerNew()),
                // NotificationListener<ScrollUpdateNotification>(
                //   onNotification: (scrollNotification) {
                //     if (scrollNotification.scrollDelta!.isNegative) {
                //       naviController.isBottomNavVisible.value = false;
                //     } else if (!scrollNotification.scrollDelta!.isNegative) {
                //       naviController.isBottomNavVisible.value = true;
                //     }
                //     return true;
                //   },
                //   child: MusicPlayerNew(),
                // ),
                Visibility(
                    visible: naviController.currentIndex.value == 3,
                    child: Library()),
                Visibility(
                    visible: naviController.currentIndex.value == 4,
                    child: Premium()),
              ],
            ),
          )),
    ));
  }
}

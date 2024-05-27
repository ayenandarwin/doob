// import "package:doob/Controller/navController.dart";
// import "package:doob/Pages/Explore.dart";
// import "package:doob/Pages/Home.dart";
// import "package:doob/Pages/Homenew.dart";
// import "package:doob/Pages/Library.dart";
// import "package:doob/Pages/Premium.dart";
// import "package:doob/utils/global.dart";
// import "package:flutter/material.dart";
// import "package:get/get.dart";

// import "../MusicPlayer/MusicPlayerNew.dart";

// class NaviScreen extends StatefulWidget {
//   @override
//   _NaviScreenState createState() => _NaviScreenState();
// }

// class _NaviScreenState extends State<NaviScreen>
//     with SingleTickerProviderStateMixin {
//   late final AnimationController _controller =
//       AnimationController(vsync: this, duration: Duration(milliseconds: 1000));

//   final TextStyle unselectedLabelStyle = TextStyle(
//       color: Colors.white.withOpacity(0.5),
//       fontWeight: FontWeight.w500,
//       fontFamily: 'Century',
//       fontSize: 13);

//   final TextStyle selectedLabelStyle = TextStyle(
//     color: Colors.white,
//     fontWeight: FontWeight.w500,
//     fontFamily: 'Century',
//     fontSize: 13,
//   );

//   bool visible = true;

//   void _onItemTapped(int index) {
//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();

//     setState(() {
//       Global.loginStatus();
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   buildBottomNavigationMenu(context, naviController) {
//     return Obx(() {
//       print('Are u happy');
//       print(naviController.isBottomNavVisible.value);
//       return Visibility(
//         visible: naviController.isBottomNavVisible.value,
//         child: AnimatedContainer(
//           duration: Duration(milliseconds: 1000),
//           curve: Curves.easeInOut,
//           child: SlideTransition(
//             position: Tween<Offset>(begin: Offset.zero, end: Offset(0, 2))
//                 .animate(CurvedAnimation(
//                     parent: _controller,
//                     // AnimationController(vsync: this,duration: Duration(milliseconds: 300)
//                     // ),
//                     curve: Curves.easeInOut)),
//             child: MediaQuery(
//               data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
//               child: SizedBox(
//                 child: BottomNavigationBar(
//                   showUnselectedLabels: true,
//                   showSelectedLabels: true,
//                   onTap: naviController.changePage,
//                   currentIndex: naviController.currentIndex.value,
//                   backgroundColor: Colors.black,
//                   unselectedItemColor: Colors.white,
//                   type: BottomNavigationBarType.fixed,
//                   selectedItemColor: Color(0xffff9800),
//                   unselectedLabelStyle: unselectedLabelStyle,
//                   selectedLabelStyle: selectedLabelStyle,
//                   items: [
//                     BottomNavigationBarItem(
//                       icon: Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 8),
//                         child: Image.asset(
//                           "assets/Icons/home.png",
//                           width: 25,
//                           height: 25,
//                         ),
//                       ),
//                       activeIcon: Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 8),
//                         child: Image.asset(
//                           "assets/Icons/home.png",
//                           color: Color(0xffff9800),
//                           width: 25,
//                           height: 25,
//                         ),
//                       ),
//                       // Container(
//                       //   margin: EdgeInsets.only(bottom: 7),
//                       //   child: Icon(
//                       //     Icons.home_filled,
//                       //     size: 25.0,
//                       //   ),
//                       // ),
//                       label: "Home".tr,
//                       //  label: AppLocalizations.of(context)!.home,
//                     ),
//                     BottomNavigationBarItem(
//                       icon: Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 8),
//                         child: Image.asset(
//                           "assets/Icons/search.png",
//                           width: 25,
//                           height: 25,
//                         ),
//                       ),
//                       activeIcon: Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 8),
//                         child: Image.asset(
//                           "assets/Icons/search.png",
//                           color: Color(0xffff9800),
//                           width: 25,
//                           height: 25,
//                         ),
//                       ),
//                       // Container(
//                       //   margin: EdgeInsets.only(bottom: 7),
//                       //   child: Icon(
//                       //     Icons.search,
//                       //     size: 25.0,
//                       //   ),
//                       // ),
//                       label: "Search".tr,
//                       // label: AppLocalizations.of(context)!.search,

//                       // label: "Search".tr,
//                     ),
//                     BottomNavigationBarItem(
//                       icon: Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 8),
//                         child: Image.asset(
//                           "assets/Image/list.png",
//                           color: Colors.white,
//                           width: 25,
//                           height: 25,
//                         ),
//                       ),
//                       activeIcon: Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 8),
//                         child: Image.asset(
//                           "assets/Image/list.png",
//                           color: Color(0xffff9800),
//                           width: 25,
//                           height: 25,
//                         ),
//                       ),
//                       // Container(
//                       //   margin: EdgeInsets.only(bottom: 7),
//                       //   child: Icon(
//                       //     // Icons.play_circle_outline,
//                       //     Icons.music_note,
//                       //     size: 25.0,
//                       //   ),
//                       // ),
//                       label: "Feed".tr,
//                       // label: AppLocalizations.of(context)!.feed,
//                     ),
//                     BottomNavigationBarItem(
//                       icon: Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 5),
//                         child: Image.asset(
//                           "assets/Icons/folder.png",
//                           //  color: Colors.black,
//                           width: 30,
//                           height: 30,
//                         ),
//                       ),
//                       activeIcon: Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 5),
//                         child: Image.asset(
//                           "assets/Icons/folder.png",
//                           color: Color(0xffff9800),
//                           width: 30,
//                           height: 30,
//                         ),
//                       ),
//                       //  Image.asset(
//                       //   "assets/Icons/library.png", width: 25, height: 25,)

//                       //     Container(
//                       //   margin: EdgeInsets.only(bottom: 7),
//                       //   child: Icon(
//                       //     //  Icons.folder_outlined,
//                       //     Icons.music_video_outlined,
//                       //     size: 25.0,
//                       //   ),
//                       // ),

//                       label: "Library".tr,
//                       // label: AppLocalizations.of(context)!.library,
//                     ),
//                     // BottomNavigationBarItem(
//                     //   icon:
//                     //   Container(
//                     //     margin: EdgeInsets.only(bottom: 7),
//                     //     child: Icon(
//                     //       // Icons.workspace_premium_outlined,
//                     //       Icons.bar_chart_outlined,
//                     //       size: 25.0,
//                     //     ),
//                     //   ),

//                     //   label: "Premium".tr,
//                     //   // label: AppLocalizations.of(context)!.premium,
//                     // ),
//                     BottomNavigationBarItem(
//                       icon: Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 5),
//                         child: Image.asset(
//                           "assets/Icons/feed1.png",
//                           //  color: Colors.black,
//                           width: 30,
//                           height: 30,
//                         ),
//                       ),
//                       //   SvgPicture.asset("assets/Icons/pay.svg", height: 24),
//                       activeIcon: Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 5),
//                         child: Image.asset(
//                           "assets/Icons/feed1.png",
//                           color: Color(0xffff9800),
//                           width: 30,
//                           height: 30,
//                           //   height: 50,
//                         ),
//                       ),
//                       // SvgPicture.asset(
//                       //   "assets/Icons/pay.svg",
//                       //   height: 24,
//                       // ),
//                       label: "Premium".tr,
//                       // label: AppLocalizations.of(context)!.premium,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final NaviController naviController = Get.put(NaviController());
//     bool login = Global.isLogIn;

//     return SafeArea(
//         child: Scaffold(
//       bottomNavigationBar:
//           // naviController.currentIndex.value == 2
//           //     ? null:
//           buildBottomNavigationMenu(context, naviController),
//       body: Obx(() => NotificationListener<ScrollUpdateNotification>(
//             onNotification: (scrollNotification) {
//               print(scrollNotification.metrics.pixels);

//               if (scrollNotification.scrollDelta!.isNegative) {
//                 print('Up');

//                 naviController.isBottomNavVisible.value = true;
//               } else if (!scrollNotification.scrollDelta!.isNegative) {
//                 print('Down');

//                 naviController.isBottomNavVisible.value = false;
//               }

//               return true;
//             },
//             child: IndexedStack(
//               index: naviController.currentIndex.value,
//               children: [
//                 //  Home(),
//                 HomeScreen(),
//                 Explore(),

//                 // MusicPlayer(),
//                 MusicPlayerNew(),
//                 Library(),
//                 Premium(),
//               ],
//             ),
//           )),
//     ));
//   }
// }

import 'package:doob/MusicPlayer/MusicPlayer.dart';
import 'package:doob/src/presentation/bottom_nav_bar/feed_nav/music_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doob/Controller/navController.dart';
import 'package:doob/Pages/Explore.dart';
import 'package:doob/Pages/Home.dart';
import 'package:doob/Pages/Homenew.dart';
import 'package:doob/Pages/Library.dart';
import 'package:doob/Pages/Premium.dart';
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
                HomeScreen(),
                Explore(),
                // MusicPlayer(),
                MusicPlayerNew(),
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
                Library(),
                Premium(),
              ],
            ),
          )),
    ));
  }
}

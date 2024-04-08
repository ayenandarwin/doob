import "dart:ffi";
import "dart:math";

import "package:doob/Component/ScrollToHide.dart";
import "package:doob/Controller/navController.dart";
import "package:doob/MusicPlayer/MusicPlayer.dart";
import "package:doob/Pages/Explore.dart";
import "package:doob/Pages/Home.dart";
import "package:doob/Pages/Library.dart";
import "package:doob/Pages/Premium.dart";
import "package:doob/Pages/SignIn.dart";
import "package:doob/Pages/Welcome.dart";
import "package:doob/Pages/loginCopy.dart";
import "package:doob/utils/global.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:get/get.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:provider/provider.dart";

class NaviScreen extends StatefulWidget {
  @override
  _NaviScreenState createState() => _NaviScreenState();
}

class _NaviScreenState extends State<NaviScreen> {
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

  late ScrollController _scrollController;
  bool visible = true;
  //bool isNavBarVisible = true;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();

    setState(() {
      Global.loginStatus();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  buildBottomNavigationMenu(context, naviController) {
    return Obx(() {
      print('Are u happy');
      print(naviController.isBottomNavVisible.value);
      return Visibility(
        visible: naviController.isBottomNavVisible.value,
        child: AnimatedContainer(
          // height: naviController.isBottomNavVisible.value
          //     ? r
          //     : 0,
          duration: Duration(milliseconds: 300),
          curve: Curves.fastLinearToSlowEaseIn,
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: SizedBox(
              // height: MediaQuery.of(context).size.height * 0.09,
              child: BottomNavigationBar(
                showUnselectedLabels: true,
                showSelectedLabels: true,
                // onTap:(index){
                //            naviController.changePage,

                // },
                onTap: naviController.changePage,

                currentIndex: naviController.currentIndex.value,

                // backgroundColor: Colors.transparent,

                backgroundColor: Colors.black,
                unselectedItemColor: Colors.white,
                //  unselectedItemColor: Colors.black,
                type: BottomNavigationBarType.fixed,

                selectedItemColor: Color(0xffff9800),
                unselectedLabelStyle: unselectedLabelStyle,
                selectedLabelStyle: selectedLabelStyle,
                items: [
                  BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(bottom: 7),
                      child: Icon(
                        Icons.home_filled,
                        size: 25.0,
                      ),
                    ),
                    label: "Home".tr,
                    //  label: AppLocalizations.of(context)!.home,
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(bottom: 7),
                      child: Icon(
                        Icons.search,
                        size: 25.0,
                      ),
                    ),
                    label: "Search".tr,
                    // label: AppLocalizations.of(context)!.search,

                    // label: "Search".tr,
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(bottom: 7),
                      child: Icon(
                        Icons.play_circle_outline,
                        size: 25.0,
                      ),
                    ),
                    label: "Feed".tr,
                    // label: AppLocalizations.of(context)!.feed,
                  ),
                  BottomNavigationBarItem(
                    icon:

                        //  Image.asset(
                        //   "lib/Icons/library.png", width: 25, height: 25,)

                        Container(
                      margin: EdgeInsets.only(bottom: 7),
                      child: Icon(
                        Icons.folder_outlined,
                        size: 25.0,
                      ),
                    ),
                    // activeIcon: Padding(
                    //   padding: const EdgeInsets.all(4.0),
                    //   child: Image.asset(
                    //     "lib/Icons/library.png",
                    //     color: Color(0xffff9800),
                    //     width: 25,
                    //     height: 25,
                    //     //   height: 50,
                    //   ),
                    // ),
                    label: "Library".tr,
                    // label: AppLocalizations.of(context)!.library,
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      margin: EdgeInsets.only(bottom: 7),
                      child: Icon(
                        Icons.workspace_premium_outlined,
                        size: 25.0,
                      ),
                    ),
                    //   SvgPicture.asset("lib/Icons/pay.svg", height: 24),

                    // SvgPicture.asset(
                    //   "lib/Icons/pay.svg",
                    //   height: 24,
                    // ),
                    label: "Premium".tr,
                    // label: AppLocalizations.of(context)!.premium,
                  ),
                  // BottomNavigationBarItem(
                  //   icon: Padding(
                  //     padding: const EdgeInsets.all(2.0),
                  //     child: Image.asset(
                  //       "lib/Icons/feed1.png",
                  //       //  color: Colors.black,
                  //       width: 30,
                  //       height: 30,
                  //     ),
                  //   ),
                  //   //   SvgPicture.asset("lib/Icons/pay.svg", height: 24),
                  //   activeIcon: Padding(
                  //     padding: const EdgeInsets.all(2.0),
                  //     child: Image.asset(
                  //       "lib/Icons/feed1.png",
                  //       color: Color(0xffff9800),
                  //       width: 30,
                  //       height: 30,
                  //       //   height: 50,
                  //     ),
                  //   ),
                  //   // SvgPicture.asset(
                  //   //   "lib/Icons/pay.svg",
                  //   //   height: 24,
                  //   // ),
                  //   label: "Premium".tr,
                  //   // label: AppLocalizations.of(context)!.premium,
                  // ),
                ],
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
    bool login = Global.isLogIn;

    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: buildBottomNavigationMenu(context, naviController),
      body: Obx(() => Container(
            height: MediaQuery.of(context).size.height,
            child: NotificationListener<ScrollUpdateNotification>(
              onNotification: (scrollNotification) {
                final pixels = scrollNotification.metrics.pixels;
                print(scrollNotification.metrics.pixels);

                // if (scrollNotification.metrics.pixels < 50) {
                //   //  if (naviController.isBottomNavVisible.value) {
                //   setState(() {
                //     naviController.scrollOffsetCoinDetail.value =
                //         scrollNotification.metrics.pixels;
                //   });
                //   //}
                // } else {
                //   naviController.scrollOffsetCoinDetail.value = 50;
                // }

                // if (scrollNotification.metrics.pixels >=
                //     scrollNotification.metrics.maxScrollExtent - 200) {
                //   //  if (naviController.isBottomNavVisible.value) {
                //   setState(() {
                //     naviController.isBottomNavVisible.value = true;
                //   });
                //   //}
                // } else {
                //   setState(() {
                //     naviController.isBottomNavVisible.value = false;
                //   });
                // }

                if (scrollNotification.metrics.pixels >= 200) {
                  if (naviController.isBottomNavVisible.value) {
                    setState(() {
                      naviController.isBottomNavVisible = false.obs;
                    });
                  }
                } else {
                  if (!naviController.isBottomNavVisible.value) {
                    setState(() {
                      naviController.isBottomNavVisible = true.obs;
                    });
                  }
                }

                // if (scrollNotification.metrics.pixels -
                //         naviController.position.value >=
                //     naviController.sentitivityFactor.value) {
                //   naviController.position.value =
                //       scrollNotification.metrics.pixels;
                // }
                // if (naviController.position.value -
                //         scrollNotification.metrics.pixels >=
                //     naviController.sentitivityFactor.value) {
                //   naviController.position.value =
                //       scrollNotification.metrics.pixels;
                // }

                // if (naviController.isBottomNavVisible.value) {
                //   setState(() {
                //     naviController.isBottomNavVisible = false.obs;
                //   });
                // }
                //  }
                //  if (scrollNotification.metrics.axisDirection ==
                //     AxisDirection.up) {
                //   if (!naviController.isBottomNavVisible.value) {
                //     setState(() {
                //       naviController.isBottomNavVisible = true.obs;
                //     });
                //   }
                // }

                // if (scrollNotification.metrics.axisDirection ==
                //     AxisDirection.down) {
                //   // if (naviController.isBottomNavVisible.value) {
                //   print('Down');
                //   setState(() {
                //     naviController.isBottomNavVisible.value = false;
                //   });

                //   //}
                // } else if (scrollNotification.metrics.axisDirection ==
                //     AxisDirection.up) {
                //   print('Up');
                //   setState(() {
                //     naviController.isBottomNavVisible.value = true;
                //   });

                // }

                // if (pixels > 0 && naviController.isBottomNavVisible.value) {
                //   // if (naviController.isBottomNavVisible.value) {
                //   print('Down');
                //   setState(() {
                //     naviController.isBottomNavVisible.value = false;
                //   });
                //   //}
                // } else if (pixels <= 0 &&
                //     !naviController.isBottomNavVisible.value) {
                //   print('Up');
                //   // if (!naviController.isBottomNavVisible.value) {
                //   setState(() {
                //     naviController.isBottomNavVisible.value = true;
                //   });
                //   //   //  }
                // }

                return true;
              },
              child: IndexedStack(
                // index:_scrollController;
                index: naviController.currentIndex.value,

                children: [
                  //login ? Home() : SignIn(),
                  Home(),
                  Explore(),
                  MusicPlayer(),
                  Library(),
                  Premium(),
                  //ProfileScreen(),
                  // Global.isLogIn ? ProfileScreen() : LoginScreen(),
                ],
              ),
            ),
          )),
    ));
  }
}

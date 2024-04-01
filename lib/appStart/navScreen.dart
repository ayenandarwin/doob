import "package:doob/Controller/navController.dart";
import "package:doob/MusicPlayer/MusicPlayer.dart";
import "package:doob/Pages/Explore.dart";
import "package:doob/Pages/Home.dart";
import "package:doob/Pages/Library.dart";
import "package:doob/Pages/Premium.dart";
import "package:doob/utils/global.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:get/get.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";

class NaviScreen extends StatefulWidget {
  @override
  _NaviScreenState createState() => _NaviScreenState();
}

class _NaviScreenState extends State<NaviScreen> {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );

  @override
  void initState() {
    super.initState();

    setState(() {
      Global.loginStatus();
    });
  }

  buildBottomNavigationMenu(context, naviController) {
    return Obx(
      () => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.09,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: naviController.changePage,
            currentIndex: naviController.currentIndex.value,
            // backgroundColor: Color.fromRGBO(101, 10, 10, 0.8),
            backgroundColor: Colors.black.withOpacity(0.7),
            unselectedItemColor: Colors.white,
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
                    size: 20.0,
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
                    size: 20.0,
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
                    size: 20.0,
                  ),
                ),
                label: "Feed".tr,
                // label: AppLocalizations.of(context)!.feed,
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    "lib/Icons/library.png", width: 20, height: 20,
                    // Container(
                    //   margin: EdgeInsets.only(bottom: 7),
                    //   child: Icon(
                    //     Icons.folder_outlined,
                    //     size: 20.0,
                    //   ),
                  ),
                ),
                activeIcon: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    "lib/Icons/library.png",
                    color: Color(0xffff9800),
                    width: 20,
                    height: 20,
                    //   height: 50,
                  ),
                ),
                label: "Library".tr,
                // label: AppLocalizations.of(context)!.library,
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Image.asset(
                    "lib/Icons/feed1.png",
                    width: 25,
                    height: 25,
                  ),
                ),
                //   SvgPicture.asset("lib/Icons/pay.svg", height: 24),
                activeIcon: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Image.asset(
                    "lib/Icons/feed1.png",
                    color: Color(0xffff9800),
                    width: 25,
                    height: 25,
                    //   height: 50,
                  ),
                ),
                // SvgPicture.asset(
                //   "lib/Icons/pay.svg",
                //   height: 24,
                // ),
                label: "Premium".tr,
                // label: AppLocalizations.of(context)!.premium,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final NaviController naviController = Get.put(NaviController());
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: buildBottomNavigationMenu(context, naviController),
      body: Obx(() => IndexedStack(
            index: naviController.currentIndex.value,
            children: [
              Home(),
              Explore(),
              MusicPlayer(),
              Library(),
              Premium(),
              //ProfileScreen(),
              // Global.isLogIn ? ProfileScreen() : LoginScreen(),
            ],
          )),
    ));
  }
}
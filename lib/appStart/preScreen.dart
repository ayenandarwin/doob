import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:doob/Controller/isLoginController.dart';
import 'package:doob/Pages/SignIn.dart';
import 'package:doob/Pages/Welcome.dart';
import 'package:doob/Pages/loginCopy.dart';
import 'package:doob/appStart/navScreen.dart';
import 'package:doob/utils/constants.dart';
import 'package:doob/utils/global.dart';
import 'package:doob/utils/sharedPreference.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Controller/navController.dart';

class PreScreen extends StatefulWidget {
  const PreScreen({Key? key}) : super(key: key);

  @override
  _PreScreenState createState() => _PreScreenState();
}

class _PreScreenState extends State<PreScreen> {
  final IsLoginController isLoginController = Get.put(IsLoginController());
  final NaviController naviController = Get.put(NaviController());

  Future<String?> fetchMyBalance() async {
    final token = await SharedPref.getData(key: SharedPref.token);
    print(token);
    var response = await ApiUrl.client.get(
      Uri.parse(ApiUrl.profile),
      headers: <String, String>{
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': '$token',
      },
    );

    print(response.body);
    if (response.statusCode == 200) {
      Get.off(() => NaviScreen());
    } else if (response.statusCode == 403) {
      Global.showBanDialog(context);
    } else {
      SharedPref.clear();
      isLoginController.logout();
      Global.loginStatus();
      Global.isLogIn = false;
      //naviController.currentIndex.value = 3;
      // Get.off(() => LoginScreen());
      Get.to(() => LoginScreen());
      Get.snackbar(
        "Alert",
        "အကောင့်ပြန်ဝင်ပါ",
        backgroundColor: Colors.white,
      );
      return null;
    }
    return null;
  }

  checkConnection() async {
    final token = await SharedPref.getData(key: SharedPref.token);
    print(token);
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      //Get.off(() => NoInternetScreen());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              contentPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              content: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/no_internet.png'),
                        fit: BoxFit.fill)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 70.0, left: 15, right: 15),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          "Alert",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: Text(
                          'You have no internet'.tr + '\n' + 'Try Again'.tr,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                              checkConnection();
                            },
                            child: Container(
                              width: 80,
                              height: 30,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                  // color: CustomColors.mainColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0))),
                              child: Text(
                                'Try Again'.tr,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          });
    } else {
      // await API.client.get(Uri.parse(API.contactUrl)).then((value) {
      //   Global.companyPhone =
      //       jsonDecode(value.body)['data']['company_contact']['phone'];
      //   Global.companyFacebook =
      //       jsonDecode(value.body)['data']['company_contact']['facebook'];
      //   Global.companyLogo = jsonDecode(value.body)['data']['company_contact']
      //       ['media'][0]['original_url'];
      //   // print(phone + "     " + facebook);
      // });
      if (Global.isLogIn) {
        // Get.off(() => NaviScreen());
        fetchMyBalance();
      } else {
        // Get.off(() => LoginScreen());
        Get.to(() => Welcome());
      }

      // Get.off(() => NaviScreen());
    }
  }

  // getAppVersion() async {
  //   String playVersion = "";
  //   var response = await API.client.get(
  //     Uri.parse(API.setting),
  //     headers: <String, String>{
  //       'Accept': 'application/json; charset=UTF-8',
  //     },
  //   );
  //   print(response.body);
  //   if (response.statusCode == 200) {
  //     playVersion = jsonDecode(response.body)['data'].toString();
  //   }

  //   PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //   var localVersion = packageInfo.version.split(".");
  //   var playStoreVersion = playVersion.split(".");
  //   if (int.parse(playStoreVersion[0]) > int.parse(localVersion[0])) {
  //     _showVersionDialog(context, playVersion);
  //   } else if (int.parse(playStoreVersion[0]) == int.parse(localVersion[0])) {
  //     if (int.parse(playStoreVersion[1]) > int.parse(localVersion[1])) {
  //       _showVersionDialog(context, playVersion);
  //     } else if (int.parse(playStoreVersion[1]) == int.parse(localVersion[1])) {
  //       if (int.parse(playStoreVersion[2]) > int.parse(localVersion[2])) {
  //         _showVersionDialog(context, playVersion);
  //       } else {
  //         Get.off(() => NaviScreen());
  //       }
  //     } else {
  //       Get.off(() => NaviScreen());
  //     }
  //   } else {
  //     Get.off(() => NaviScreen());
  //   }
  //   print("Version : ${packageInfo.version}");
  //   setState(() {
  //     Global.version = packageInfo.version;
  //   });
  // }

  bool willPopOut = false;
  Future<bool> willPop() {
    if (willPopOut) {
      // AppUtils.showSnackBar(AppUtils.lang(context, "double_click_to_exit"), _scaffoldKey.currentState);
      willPopOut = true;
    } else {
      SystemNavigator.pop();
    }
    return Future.value(false);
  }

  _showVersionDialog(context, storeVersion) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        willPopOut = true;
        return WillPopScope(
          onWillPop: willPop,
          child: AlertDialog(
            elevation: 5,
            backgroundColor: Colors.grey[200]!.withOpacity(0.9),
            titleTextStyle: TextStyle(
              inherit: false,
              fontSize: 22,
              fontFamily: "WorkSansBold",
            ),
            title: Text(
              "Update Version".tr,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontFamily: "WorkSansBold"),
            ),
            content: Container(
              height: MediaQuery.of(context).size.height * 0.15,
              child: Column(
                children: [
                  Text(
                    storeVersion,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: "WorkSansBold"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "နောက်ဆုံးထွက်သော ဗားရှင်းကို \n ဒေါင်းလုတ်ဆွဲပါ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
            actions: <Widget>[
              GestureDetector(
                onTap: () {
//Global.launchToSite(API.playStoreLink);
                },
                child: Center(
                  child: Container(
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      // color: CustomColors.mainColor,
                      // gradient: LinearGradient(colors: [
                      //   Colors.red.withOpacity(.8),
                      //   Colors.orange.withOpacity(0.8)
                      // ]),
                    ),
                    child: Center(
                      child: Text(
                        "Update Now".tr,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    Global.loginStatus();
    checkConnection();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffff9800),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.13,
            ),
            Center(
              child: Image.asset(
                'lib/Image/DOOB.png',

                height: 90,
                //scale: 0.1,
              ),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            Text(
              'Welcome to doob',
              //'Welcome to doob'.tr,
              style: TextStyle(
                  fontSize: 30, fontFamily: 'Century', color: Colors.white),
            ),
            // Lottie.asset('assets/icons/loading2.json', width: 150, height: 150),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.white,
  //     body: Center(
  //       child: SingleChildScrollView(
  //         child: Column(
  //           children: [
  //             Container(
  //               width: MediaQuery.of(context).size.width * 0.35,
  //               height: MediaQuery.of(context).size.height * 0.35,
  //               decoration: BoxDecoration(
  //                   color: Colors.transparent,
  //                   image: DecorationImage(
  //                     image: AssetImage(
  //                       "assets/icons/appstore.png",
  //                     ),
  //                     scale: 5,
  //                     fit: BoxFit.contain,
  //                   )),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

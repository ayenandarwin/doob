import 'package:doob/Component/help&feedback.dart';
import 'package:doob/Component/privacy&policy.dart';
import 'package:doob/localization/controller/appLanguageController.dart';
import 'package:doob/services/profileServiceProvider.dart';
import 'package:doob/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    String? languageChoice;
    return Consumer(
      builder: (context, ref, child) {
        return SafeArea(
            child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            iconTheme: IconThemeData(color: Colors.white),
            title: Text(
              'Settings'.tr,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Century',
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: ref.watch(profileServiceProvider).when(data: (profileInfo) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset('lib/Image/dooro.jpg',
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                profileInfo.data!.name!,

                                // 'ISAYOONIE',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: 'Century',
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                profileInfo.data!.phone!,
                                style: TextStyle(
                                    fontFamily: 'Century',
                                    fontSize: 14,
                                    color: Colors.white.withOpacity(0.6)),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                //  // data.data.premium
                                //       ? 'Premium User'
                                //       : 'Free User',
                                'Free User',
                                style: const TextStyle(
                                  fontFamily: 'Century',
                                  fontSize: 16,
                                  color: Color(0xff06F94A),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Icon(
                        //   Icons.arrow_forward_ios_rounded,
                        //   color: Colors.white,
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Icon(
                            Icons.favorite_rounded,
                            color: Colors.red,
                            size: 20,
                          ),
                          SizedBox(
                            width: 29,
                          ),
                          Text(
                            'Favorites'.tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Century'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Icon(
                            Icons.bookmark_outline,
                            size: 20,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 29,
                          ),
                          Text(
                            'Saved'.tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Century'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Icon(
                            Icons.download,
                            size: 20,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 29,
                          ),
                          Text(
                            'Download'.tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Century'),
                          ),
                        ],
                      ),
                    ),

                    GetBuilder<AppLanguageController>(
                      init: AppLanguageController(),
                      builder: (controller) {
                        languageChoice = controller.appLocale;
                        // String tempValue = controller.appLocale;

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              child: Icon(
                                Icons.language,
                                color: Colors.white,
                              ),
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "Languages".tr,
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontFamily: 'Century'),
                              ),
                            ),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return StatefulBuilder(builder:
                                      (BuildContext context,
                                          StateSetter setState) {
                                    return AlertDialog(
                                      contentPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.grey,
                                      titleTextStyle: const TextStyle(
                                          fontSize: 20, color: Colors.black),
                                      content: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.35,
                                        // decoration: const BoxDecoration(
                                        //     image: DecorationImage(
                                        //         image: AssetImage(
                                        //             'assets/images/puLanguage.png'),
                                        //         fit: BoxFit.fill)),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            // Padding(
                                            //   padding: const EdgeInsets.only(
                                            //       top: 20.0,
                                            //       left: 15,
                                            //       right: 15),
                                            //   child: Container(
                                            //     height: MediaQuery.of(context)
                                            //             .size
                                            //             .height *
                                            //         0.15,
                                            //   ),
                                            // ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 15),
                                              child: Text(
                                                "Please Choice Language".tr,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontFamily: 'Century',
                                                ),
                                              ),
                                            ),
                                            RadioListTile(
                                              value: 'my_MM',
                                              title: const Text("မြန်မာ"),
                                              groupValue: languageChoice,
                                              onChanged: (val) {
                                                setState(() {
                                                  languageChoice = 'my_MM';
                                                });
                                              },
                                            ),
                                            RadioListTile(
                                              value: 'en_US',
                                              title: const Text("English"),
                                              groupValue: languageChoice,
                                              onChanged: (val) {
                                                setState(() {
                                                  languageChoice = 'en_US';
                                                });
                                              },
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      25.0)),
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  child: const Text("Cancel"),
                                                ),
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      40.0)),
                                                  onPressed: () {
                                                    controller.changeLanguage(
                                                        languageChoice!);
                                                    Get.updateLocale(Locale(
                                                        languageChoice!));
                                                    Global.language =
                                                        languageChoice;
                                                    Get.back();
                                                  },
                                                  child: const Text("Apply"),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                                },
                              );
                            },
                          ),
                        );
                      },
                    ),

                    // InkWell(
                    //   onTap: () {
                    //     Navigator.of(context).pushNamed('/lang');
                    //   },
                    //   child: Container(
                    //     padding: const EdgeInsets.all(20),
                    //     child: Row(
                    //       children: const [
                    //         Icon(
                    //           Icons.language,
                    //           size: 20,
                    //           color: Colors.white,
                    //         ),
                    //         SizedBox(
                    //           width: 29,
                    //         ),
                    //         Text(
                    //           'Language',
                    //           style: TextStyle(
                    //               color: Colors.white,
                    //               fontSize: 14,
                    //               fontWeight: FontWeight.normal,
                    //               fontFamily: 'Century'),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HelpAndFeedback()));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Icon(
                              Icons.help_outline,
                              size: 20,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 29,
                            ),
                            Text(
                              "Help & feedback".tr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Century'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PrivacyAndPolicy()));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Icon(
                              Icons.privacy_tip_outlined,
                              size: 20,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 29,
                            ),
                            Text(
                              "Privacy & policy".tr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Century'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/signIn');
                      },
                      child: Center(
                        child: Container(
                          // padding: const EdgeInsets.all(20),
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Color(0xffff9800),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: Text(
                              'Logout'.tr,
                              style: TextStyle(
                                  fontFamily: 'Century',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Padding(
                    //   padding: const EdgeInsets.only(bottom: 10, top: 30),
                    //   child: Text(
                    //     'Account',
                    //     style: TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 18,
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(bottom: 10),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Text(
                    //         'Email',
                    //         style: TextStyle(
                    //           color: Colors.white,
                    //           fontSize: 16,
                    //           // fontWeight: FontWeight.bold
                    //         ),
                    //       ),
                    //       // Text(
                    //       //   'wakwakmoooo@gmail.com',
                    //       //   style: TextStyle(
                    //       //       color: Colors.white.withOpacity(
                    //       //     0.5,
                    //       //   )),
                    //       // )
                    //     ],
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(bottom: 10),
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       Navigator.of(context).pushNamed('/lang');
                    //     },
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text(
                    //           'Language',
                    //           style: TextStyle(
                    //               color: Colors.white,
                    //               fontSize: 18,
                    //               fontWeight: FontWeight.bold),
                    //         ),
                    //         Text(
                    //           'English',
                    //           style: TextStyle(
                    //             color: Colors.white.withOpacity(0.5),
                    //           ),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            );
          }, error: (Object error, StackTrace stackTrace) {
            return Text('$error');
          }, loading: () {
            Center(
              child: CircularProgressIndicator(),
            );
          }),
        ));
      },
    );
  }
}

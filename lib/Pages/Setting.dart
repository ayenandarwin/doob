import 'package:doob/services/profileServiceProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return SafeArea(
            child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            iconTheme: IconThemeData(color: Colors.white),
            title: Text(
              'Settings',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
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
                      child: const Row(
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
                            'Favourites',
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
                        children: const [
                          Icon(
                            Icons.bookmark_outline,
                            size: 20,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 29,
                          ),
                          Text(
                            'Saved',
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
                        children: const [
                          Icon(
                            Icons.download,
                            size: 20,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 29,
                          ),
                          Text(
                            'Download',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Century'),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/lang');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.language,
                              size: 20,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 29,
                            ),
                            Text(
                              'Language',
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
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.help_outline,
                            size: 20,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 29,
                          ),
                          Text(
                            'Help & feedback',
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
                        children: const [
                          Icon(
                            Icons.privacy_tip_outlined,
                            size: 20,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 29,
                          ),
                          Text(
                            'Privacy & policy',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Century'),
                          ),
                        ],
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
                              'Logout',
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

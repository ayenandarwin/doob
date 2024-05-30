// import 'package:doob/widgets/music_player/follow/follow_favorite.dart';
// import 'package:doob/widgets/music_player/follow/follow_video.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// class FollowDetailScreen extends StatefulWidget {
//   const FollowDetailScreen(this.followData, {super.key});
//   final List followData;

//   @override
//   State<FollowDetailScreen> createState() => _FollowDetailScreenState();
// }

// class _FollowDetailScreenState extends State<FollowDetailScreen> {
//   Widget currenttabs = FollowVideoScreen(widget.followData);
//   int currenttabsID = 0;
//   List tabs = [
//     {
//       "lable": "Tracks",
//      "Page": FollowVideoScreen(widget.followData),
//       "id": 0,
//     },
//     {
//       "lable": "favorite",
//       "Page": FollowFavoriteScreen(),
//       "id": 1,
//     },
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.black,
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(10),
//             child: Container(
//               child: Column(
//                 children: [
//                   Container(
//                     child: Row(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.pop(context);
//                           },
//                           child: Icon(
//                             Icons.arrow_back,
//                             color: Colors.white,
//                             size: 24,
//                           ),
//                         ),
//                         SizedBox(
//                           width: 20,
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         top: 10, right: 10, left: 10, bottom: 20),
//                     child: Container(
//                       child: Column(
//                         children: [
//                           GestureDetector(
//                             onTap: () {},
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(100),
//                                 child: Image.asset(
//                                   'assets/Image/jojipf.jpg',
//                                   height: 100,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Text(
//                             '@ye.yint.aung',
//                             style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: 'Century',
//                                 color: Colors.white),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Container(
//                                 decoration: BoxDecoration(
//                                     border: Border(
//                                   right: BorderSide(
//                                     color: Colors
//                                         .white30, // specify your color here
//                                     width:
//                                         1.0, // specify the width of the border
//                                   ),
//                                 )),
//                                 width: 90,
//                                 child: Text(
//                                   '-',
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white),
//                                 ),
//                               ),
//                               Container(
//                                 decoration: BoxDecoration(
//                                     border: Border(
//                                   right: BorderSide(
//                                     color: Colors
//                                         .white30, // specify your color here
//                                     width:
//                                         1.0, // specify the width of the border
//                                   ),
//                                 )),
//                                 width: 90,
//                                 child: Text(
//                                   '-',
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white),
//                                 ),
//                               ),
//                               Container(
//                                 width: 90,
//                                 child: Text(
//                                   '-',
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white),
//                                 ),
//                               )
//                             ],
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Container(
//                                 height: 40,
//                                 width: 150,
//                                 decoration: BoxDecoration(
//                                   color: Color(0xffff9800),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: Center(
//                                   child: Text(
//                                     'Follow',
//                                     style: TextStyle(
//                                         fontFamily: 'Century',
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.white),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 3,
//                               ),
//                               Container(
//                                 height: 40,
//                                 width: 50,
//                                 decoration: BoxDecoration(
//                                   color: Colors.white38,
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: Center(
//                                     child: Icon(
//                                   Icons.arrow_drop_down,
//                                   color: Colors.white,
//                                 )),
//                               ),

//                               // Container(
//                               //         width: MediaQuery.of(context).size.width *
//                               //             0.85,
//                               //         height: 35,
//                               //         decoration: BoxDecoration(
//                               //             border: Border.all(
//                               //               color: Colors.grey,
//                               //             ),
//                               //             borderRadius:
//                               //                 BorderRadius.circular(5)),
//                               //         //margin: EdgeInsets.all(16),

//                               //         padding:
//                               //             EdgeInsets.symmetric(horizontal: 7),
//                               //         child: DropdownButtonHideUnderline(
//                               //           child: DropdownButton<String>(
//                               //             hint: Text(
//                               //               "Select State",
//                               //               style: TextStyle(fontSize: 12),
//                               //             ),
//                               //             value: value,
//                               //             isExpanded: true,
//                               //             items:
//                               //                 items.map(buildMenuItem).toList(),
//                               //             onChanged: (value) => setState(
//                               //                 () => this.value = value),
//                               //           ),
//                               //         ),

//                               //         // value: selecttownshipDetailPick,
//                               //       ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Text(
//                             'Jerry',
//                             style: TextStyle(
//                                 fontFamily: 'Century',
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           SingleChildScrollView(
//                             scrollDirection: Axis.horizontal,
//                             child: Padding(
//                               padding: const EdgeInsets.only(
//                                   top: 20, bottom: 10, left: 10),
//                               child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Toptab(
//                                       TopTabs: '',
//                                       selected: Container(
//                                           width:
//                                               MediaQuery.of(context).size.width,
//                                           // height: 500,
//                                           height: MediaQuery.of(context)
//                                                   .size
//                                                   .height *
//                                               0.62,
//                                           child: FollowVideoScreen(
//                                               widget.followData)),
//                                     )
//                                   ]
//                                   // tabs.map((e) {
//                                   //   return GestureDetector(
//                                   //     onTap: () {
//                                   //       setState(() {
//                                   //         currenttabs = e['Page'];
//                                   //         currenttabsID = e['id'];
//                                   //       });
//                                   //     },
//                                   //     child: Toptab(
//                                   //       TopTabs: e['lable'],
//                                   //       selected: currenttabsID == e['id'],
//                                   //     ),
//                                   //   );
//                                   // }).toList(),
//                                   ),
//                             ),
//                           ),
//                           Container(
//                               width: MediaQuery.of(context).size.width,
//                               // height: 500,
//                               height: MediaQuery.of(context).size.height * 0.62,
//                               child: FollowVideoScreen(widget.followData)),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Toptab extends StatelessWidget {
//   const Toptab({
//     super.key,
//     required this.TopTabs,
//     required this.selected,
//   });

//   final TopTabs;
//   final selected;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(right: 30),
//       height: 25,
//       decoration: BoxDecoration(
//         border: Border(
//             bottom: BorderSide(
//           color: selected ? Color(0xffff9800) : Colors.transparent,
//         )

//             //  color: Colors.white
//             ),
//         // color: selected ? Color(0xffff9800) : Colors.transparent,
//         //  borderRadius: BorderRadius.circular(20),
//         // borderRadius: BorderRadius.only(
//         //     topRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         child: Center(
//           child: Text(
//             TopTabs,
//             style: TextStyle(
//                 color: selected ? Color(0xffff9800) : Colors.white, fontSize: 16

//                 // color: Colors.white
//                 ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:doob/widgets/music_player/follow/follow_favorite.dart';
import 'package:doob/widgets/music_player/follow/follow_video.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FollowDetailScreen extends StatefulWidget {
  const FollowDetailScreen(this.followData, {super.key});
  final List followData;

  @override
  State<FollowDetailScreen> createState() => _FollowDetailScreenState();
}

class _FollowDetailScreenState extends State<FollowDetailScreen> {
  late Widget currenttabs;
  int currenttabsID = 0;
  late List tabs;

  @override
  void initState() {
    super.initState();
    currenttabs = FollowVideoScreen(widget.followData);
    tabs = [
      {
        "icon": Icons.music_note,
        "Page": FollowVideoScreen(widget.followData),
        "id": 0,
      },
      {
        "icon": Icons.favorite,
        "Page": FollowFavoriteScreen(),
        "id": 1,
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, right: 10, left: 10, bottom: 20),
                    child: Container(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  'assets/Image/jojipf.jpg',
                                  height: 100,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '@ye.yint.aung',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Century',
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                  right: BorderSide(
                                    color: Colors.white30,
                                    width: 1.0,
                                  ),
                                )),
                                width: 90,
                                child: Text(
                                  '-',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                  right: BorderSide(
                                    color: Colors.white30,
                                    width: 1.0,
                                  ),
                                )),
                                width: 90,
                                child: Text(
                                  '-',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Container(
                                width: 90,
                                child: Text(
                                  '-',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 40,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: Color(0xffff9800),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    'Follow',
                                    style: TextStyle(
                                        fontFamily: 'Century',
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Container(
                                height: 40,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white38,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                    child: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Jerry',
                            style: TextStyle(
                                fontFamily: 'Century',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 30, bottom: 20, left: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Toptab(
                                    icon: Icon(Icons.music_note),
                                    selectedColor: Colors
                                        .orange, // Example of selected color
                                    unselectedColor: Colors
                                        .white, // Example of unselected color
                                    selected: currenttabsID == 0,
                                    onTap: () {
                                      setState(() {
                                        currenttabs = tabs[0]['Page'];
                                        currenttabsID = tabs[0]['id'];
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 80,
                                  ),
                                  Toptab(
                                    icon: Icon(
                                      Icons.favorite,
                                    ),
                                    selectedColor: Colors.orange,
                                    unselectedColor: Colors.white,
                                    selected: currenttabsID == 1,
                                    onTap: () {
                                      setState(() {
                                        currenttabs = tabs[1]['Page'];

                                        currenttabsID = tabs[1]['id'];
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.62,
                            child: currenttabs,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class Toptab extends StatelessWidget {
  const Toptab({
    Key? key,
    required this.icon,
    required this.selectedColor, // New property for selected color
    required this.unselectedColor, // New property for unselected color
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  final Icon icon;
  final Color selectedColor;
  final Color unselectedColor;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 30),
        height: 25,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: selected ? Color(0xffff9800) : Colors.transparent,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Center(
            child: Icon(
              icon.icon,
              color: selected ? selectedColor : unselectedColor,
              size: icon.size,
            ),
          ),
        ),
      ),
    );
  }
}

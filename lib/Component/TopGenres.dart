import 'package:doob/Libcomponent/AlbumsTabs.dart';
import 'package:doob/Libcomponent/Artist.dart';
import 'package:doob/Libcomponent/Folder.dart';
import 'package:doob/Libcomponent/Tracks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TopGenres extends StatefulWidget {
  const TopGenres({super.key});

  @override
  State<TopGenres> createState() => _TopGenresState();
}

class _TopGenresState extends State<TopGenres> {
  Widget currenttabs = Tracktabs();
  int currenttabsID = 0;
  List tabs = [
    {
      "lable": "Tracks",
      "Page": Tracktabs(),
      "id": 0,
    },
    {
      "lable": "Artists",
      "Page": Artists(),
      "id": 2,
    },
    {
      "lable": "Albums",
      "Page": AlbumsTabs(),
      "id": 3,
    },
  ];
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
                          width: 120,
                        ),
                        Text(
                          'Top',
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Century',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        GestureDetector(
                          onTap: () {
                            //  Navigator.pushNamed(context, '/search');
                          },
                          child: SvgPicture.asset('assets/Icons/menu.svg',
                              height: 25),

                          // Icon(
                          //   Icons.menu,
                          //   size: 25,
                          //   color: Colors.white,
                          // ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.pushNamed(context, '/search');
                          },
                          child: Icon(
                            Icons.add,
                            size: 25,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    'post 30 Days',
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Century',
                      // fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Color(0xff8A9A9D),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, bottom: 10, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: tabs.map((e) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                currenttabs = e['Page'];
                                currenttabsID = e['id'];
                              });
                            },
                            child: Toptab(
                              TopTabs: e['lable'],
                              selected: currenttabsID == e['id'],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  currenttabs,
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
    super.key,
    required this.TopTabs,
    required this.selected,
  });

  final TopTabs;
  final selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 30),
      height: 25,
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
          color: selected ? Color(0xffff9800) : Colors.transparent,
        )

            //  color: Colors.white
            ),
        // color: selected ? Color(0xffff9800) : Colors.transparent,
        //  borderRadius: BorderRadius.circular(20),
        // borderRadius: BorderRadius.only(
        //     topRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Text(
            TopTabs,
            style: TextStyle(
                color: selected ? Color(0xffff9800) : Colors.white, fontSize: 16

                // color: Colors.white
                ),
          ),
        ),
      ),
    );
  }
}

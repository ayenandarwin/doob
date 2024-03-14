import 'package:doob/Libcomponent/AlbumsTabs.dart';
import 'package:doob/Libcomponent/Artist.dart';
import 'package:doob/Libcomponent/Folder.dart';
import 'package:doob/Libcomponent/PodCast.dart';
import 'package:flutter/material.dart';

class MainSearch extends StatefulWidget {
  const MainSearch({super.key});

  @override
  State<MainSearch> createState() => _MainSearchState();
}

class _MainSearchState extends State<MainSearch> {
  bool _offstage = true;
  Widget currenttabs = Foldertabs();
  int currenttabsID = 0;
  List tabs = [
    {
      "lable": "Folder",
      "Page": Foldertabs(),
      "id": 0,
    },
    {
      "lable": "Playlists",
      "Page": AlbumsTabs(),
      "id": 1,
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
    {
      "lable": "PodCast & Shows",
      "Page": Podcast(),
      "id": 4,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back, color: Colors.white)),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    if (value.isEmpty) {
                      _offstage = true;
                    } else {
                      _offstage = false;
                    }
                  });
                },
                autofocus: true,
                style: TextStyle(
                    decoration: TextDecoration.none, color: Colors.black),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  hintText: 'Browse Library',
                  hintStyle: TextStyle(color: Color(0XFF8A9A9D)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              ),
              Offstage(
                offstage: _offstage,
                child: SingleChildScrollView(
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
                          child: libtab(
                            LableTabs: e['lable'],
                            selected: currenttabsID == e['id'],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.swap_vert,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Recently Search',
                      style: TextStyle(
                          fontFamily: "Century",
                          fontSize: 16,
                          color: Color(0xffff9800),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class libtab extends StatelessWidget {
  const libtab({
    super.key,
    required this.LableTabs,
    required this.selected,
  });

  final LableTabs;
  final selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        color: selected ? Color(0xffff9800) : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Text(
            LableTabs,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

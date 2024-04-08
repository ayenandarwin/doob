import 'package:doob/Libcomponent/AlbumsTabs.dart';
import 'package:doob/Libcomponent/Artist.dart';
import 'package:doob/Libcomponent/Folder.dart';
import 'package:doob/Libcomponent/PodCast.dart';
import 'package:doob/services/albumServiceProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:provider/provider.dart';

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
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
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Text(
                              'Your Library',
                              style: TextStyle(
                                  color: Color(0xffff9800),
                                  fontFamily: "Century",
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/search');
                        },
                        child: Icon(
                          Icons.search,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
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
                          child: Libtab(
                            LableTabs: e['lable'],
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
    );
  }
}

class PlayList extends StatelessWidget {
  const PlayList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        child: Row(
          children: [
            Container(
              height: 70,
              width: 70,
              child: Image.asset(
                'lib/Image/jojipf.jpg',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Joji Playlist',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Century",
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Row(
                    children: [
                      Text(
                        'Playlist',
                        style: TextStyle(
                            color: Color(0xff8A9A9D),
                            fontFamily: "Century",
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                      Text(
                        ' • ',
                        style: TextStyle(
                            color: Color(0xff8A9A9D),
                            fontFamily: "Century",
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                      Text(
                        'Pink Guy',
                        style: TextStyle(
                            color: Color(0xff8A9A9D),
                            fontFamily: "Century",
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Albums extends StatelessWidget {
  const Albums({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/playlistDetails');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          // decoration: BoxDecoration(
          //   // color: Colors.grey.withOpacity(0.4),
          //   color: Color.fromARGB(255, 194, 211, 226),
          //   borderRadius: const BorderRadius.all(
          //     Radius.circular(10),
          //   ),
          // ),
          child: Row(
            children: [
              Container(
                height: 70,
                width: 70,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'lib/Image/joji.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SMITHREENS',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Century",
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    Text(
                      'Joji',
                      style: TextStyle(
                          color: Color(0xff8A9A9D),
                          fontFamily: "Century",
                          // fontWeight: FontWeight.bold,
                          fontSize: 12),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ArtistCard extends StatelessWidget {
  const ArtistCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Container(
        child: Row(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'lib/Image/jojipf.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 4,
              child: Text(
                'Joji',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Century",
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Libtab extends StatelessWidget {
  const Libtab({
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
      height: 25,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        color: selected ? Color(0xffff9800) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        // borderRadius: BorderRadius.only(
        //     topRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
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

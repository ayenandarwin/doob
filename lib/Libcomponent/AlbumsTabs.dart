import 'package:doob/Pages/Library.dart';
import 'package:flutter/material.dart';

class AlbumsTabs extends StatefulWidget {
  const AlbumsTabs({super.key});

  @override
  State<AlbumsTabs> createState() => _AlbumsTabsState();
}

class _AlbumsTabsState extends State<AlbumsTabs> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.white,
                                  Color(0xffff9800),
                                  Color(0xffff9800),
                                ],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft),
                            borderRadius: BorderRadius.circular(100),
                            //color: Color(0xffff9800)
                          ),
                          child: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(
                      "Add New Playlist",
                      style: TextStyle(
                          fontFamily: "Century",
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.white,
                                      Color(0xffff9800),
                                      Color(0xffff9800),
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft),
                                borderRadius: BorderRadius.circular(100),
                                color: Color(0xffff9800)),
                            child: Icon(Icons.favorite_border),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Text(
                        "Your Liked Song",
                        style: TextStyle(
                            fontFamily: "Century",
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
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
                    'Recently played',
                    style: TextStyle(
                        fontFamily: "Century",
                        fontSize: 14,
                        color: Color(0xffff9800),
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 10, right: 10, bottom: 30),
              child: Container(
                child: Column(
                  children: [
                    Albums(),
                    Albums(),
                    Albums(),
                    Albums(),
                    Albums(),
                    Albums(),
                    Albums(),
                    Albums(),
                    Albums(),
                    Albums(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:doob/Pages/Library.dart';
import 'package:flutter/material.dart';

class Foldertabs extends StatefulWidget {
  const Foldertabs({super.key});

  @override
  State<Foldertabs> createState() => _FoldertabsState();
}

class _FoldertabsState extends State<Foldertabs> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 20,
      ),
      child: Container(
        //color: Colors.grey,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/addToPlaylist');
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                                // color: Color(0xffff9800)
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
                              // color: Color(0xffff9800)
                            ),
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
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
            // SizedBox(
            //   height: 10,
            // ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, right: 10, left: 10, bottom: 20),
              child: Container(
                child: Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/folderdetails');
                        },
                        child: FloderCard()),
                    FloderCard(),
                    FloderCard(),
                    FloderCard(),
                    FloderCard(),
                    FloderCard(),
                    FloderCard(),
                    FloderCard(),
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

class FloderCard extends StatelessWidget {
  const FloderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   // color: Colors.grey.withOpacity(0.4),
      //   color: Color.fromARGB(255, 194, 211, 226),
      //   borderRadius: const BorderRadius.all(
      //     Radius.circular(10),
      //   ),
      // ),
      child: Row(
        children: [
          Expanded(flex: 1, child: Image.asset('lib/Icons/folder.png')),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Moods',
                  style: TextStyle(
                      fontFamily: "Century",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 14),
                ),
                Text(
                  '11 songs',
                  style: TextStyle(
                      fontFamily: "Century",
                      // fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 12),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

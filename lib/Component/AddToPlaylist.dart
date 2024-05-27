import 'package:flutter/material.dart';

class AddToPlaylist extends StatefulWidget {
  const AddToPlaylist({super.key});

  @override
  State<AddToPlaylist> createState() => _AddToPlaylistState();
}

class _AddToPlaylistState extends State<AddToPlaylist> {
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
                        Text(
                          'Add to Playlist',
                          style: TextStyle(
                              fontFamily: 'Century',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/createnewplaylist');
                    },
                    child: Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green,
                            blurRadius: 2,
                            spreadRadius: 2,
                            // offset: Offset(1, 1)
                          )
                        ],
                        color: Color(0xffff9800),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Text(
                          'New Playlist',
                          style: TextStyle(
                              fontFamily: 'Century',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      height: 35,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Color(0xff8A9A9D),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FittedBox(
                              child: Text(
                                'Find Playlist',
                                style: TextStyle(
                                    color: Color(0xff8A9A9D),
                                    fontSize: 12,
                                    fontFamily: "Century"),
                              ),
                            )
                          ],
                        ),
                      )
                      ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, right: 10, left: 10, bottom: 20),
                    child: Container(
                      child: Column(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed('/folderdetails');
                              },
                              child: PlaylistCard()),
                          SizedBox(
                            height: 10,
                          ),
                          PlaylistCard(),
                          SizedBox(
                            height: 10,
                          ),
                          PlaylistCard(),
                          SizedBox(
                            height: 10,
                          ),
                          PlaylistCard(),
                          SizedBox(
                            height: 10,
                          ),
                          PlaylistCard(),
                          SizedBox(
                            height: 10,
                          ),
                          PlaylistCard(),
                          SizedBox(
                            height: 10,
                          ),
                          PlaylistCard(),
                          SizedBox(
                            height: 10,
                          ),
                          PlaylistCard(),
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

class PlaylistCard extends StatelessWidget {
  const PlaylistCard({
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              height: 70,
              width: 70,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset('assets/Image/JC.jpg'))),
          SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current favorites',
                  style: TextStyle(
                      fontFamily: "Century",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 14),
                ),
                Text(
                  '20 songs',
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

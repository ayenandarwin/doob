import 'package:doob/Libcomponent/AlbumsTabs.dart';
import 'package:doob/Libcomponent/Artist.dart';
import 'package:doob/Libcomponent/Tracks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PlaylistDetails extends StatefulWidget {
  const PlaylistDetails({super.key});

  @override
  State<PlaylistDetails> createState() => _PlaylistDetailsState();
}

class _PlaylistDetailsState extends State<PlaylistDetails> {
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
                          width: 70,
                        ),
                        Text(
                          'From "PLAYLISTS"',
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Century',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.pushNamed(context, '/search');
                          },
                          child: Icon(
                            Icons.more_vert,
                            size: 25,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'lib/Image/middle.jpg',
                        fit: BoxFit.cover,
                        height: 210,
                        width: 210,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Lofi Lofi',
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Century',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        'soft, chill, dreamy, lo-fi beats',
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Century',
                          fontSize: 12,
                          color: Color(0xff8A9A9D),
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
                ],
              ),
            ),
          ),
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
        Navigator.pushNamed(context, '/playlistMoreDetails');
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
          child:
           Row(
            children: [
              Container(
                height: 50,
                width: 50,
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
                      'grainy days',
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
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  //Navigator.pushNamed(context, 'favoriteDetails');
                },
                child: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:doob/Libcomponent/AlbumsTabs.dart';
import 'package:doob/Libcomponent/Artist.dart';
import 'package:doob/Libcomponent/Tracks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PlaylistMoreDetails extends StatefulWidget {
  const PlaylistMoreDetails({super.key});

  @override
  State<PlaylistMoreDetails> createState() => _PlaylistMoreDetailsState();
}

class _PlaylistMoreDetailsState extends State<PlaylistMoreDetails> {
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
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.favorite_outline,
                            color: Color(0xffff9800),
                            size: 20,
                          ),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.pushNamed(context, '/search');
                          },
                          child: Icon(
                            Icons.add,
                            size: 20,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/Image/manic.jpg',
                        fit: BoxFit.cover,
                        height: 180,
                        width: 200,
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
                            color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30, right: 10, left: 10, bottom: 20),
                        child: Container(
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed('/folderdetails');
                                },
                                child: FloderCard(
                                  image: Image.asset(
                                    'assets/Icons/add.png',
                                  ),
                                  text: 'Add to playlist',
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/queue');
                                },
                                child: FloderCard(
                                  image: Image.asset(
                                    'assets/Icons/add1.png',
                                  ),
                                  text: 'Add to queue',
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              FloderCard(
                                image: Image.asset(
                                  'assets/Icons/remove.png',
                                ),
                                text: 'Remove from playlist',
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              FloderCard(
                                image: Image.asset(
                                  'assets/Icons/sale.png',
                                ),
                                text: 'Modify tags',
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              FloderCard(
                                image: Image.asset(
                                  'assets/Icons/artist.png',
                                ),
                                text: 'View Artists',
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              FloderCard(
                                image: Image.asset(
                                  'assets/Icons/disc.png',
                                ),
                                text: 'View Album',
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              FloderCard(
                                image: Image.asset(
                                  'assets/Icons/user-information.png',
                                ),
                                text: 'Show Credits',
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              FloderCard(
                                  image: Image.asset(
                                    'assets/Icons/download1.png',
                                  ),
                                  text: 'Download'),
                              SizedBox(
                                height: 10,
                              ),
                              FloderCard(
                                  image: Image.asset(
                                    'assets/Icons/share1.png',
                                  ),
                                  text: 'Share'),
                              SizedBox(
                                height: 10,
                              ),
                              FloderCard(
                                  image: Image.asset(
                                    'assets/Icons/qrcode.png',
                                  ),
                                  text: 'Generate QR Code'),
                              SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/sleepTimer');
                                },
                                child: FloderCard(
                                    image: Image.asset(
                                      'assets/Icons/moon.png',
                                    ),
                                    text: 'Sleep Timer'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              FloderCard(
                                  image: Image.asset(
                                    'assets/Icons/hide.png',
                                  ),
                                  text: 'Hide Song'),
                              SizedBox(
                                height: 10,
                              ),
                              FloderCard(
                                  image: Image.asset(
                                    'assets/Icons/songradio.png',
                                  ),
                                  text: 'Go to Song Radio'),

                              // FloderCard(
                              //   image: '',
                              //   text: '',
                              // )

                              // FloderCard('',''),
                              // FloderCard(),
                              // FloderCard(),
                              // FloderCard(),
                              // FloderCard(),
                              // FloderCard(),
                              // FloderCard(),
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

class FloderCard extends StatelessWidget {
  final image;
  final String text;
  const FloderCard({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      // decoration: BoxDecoration(
      //   // color: Colors.grey.withOpacity(0.4),
      //   color: Color.fromARGB(255, 194, 211, 226),
      //   borderRadius: const BorderRadius.all(
      //     Radius.circular(10),
      //   ),
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          image,
          SizedBox(
            width: 16,
          ),
          Text(
            text,
            style: TextStyle(
                // fontFamily: "Century",
                //  fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   // padding: EdgeInsets.symmetric(horizontal: 10),
                //   child: Row(
                //     children: [
                //       Text(
                //         'Your Library',
                //         style: TextStyle(
                //             color: Color(0xffff9800),
                //             fontFamily: "Century",
                //             letterSpacing: 2,
                //             fontWeight: FontWeight.bold,
                //             fontSize: 20),
                //       ),
                //     ],
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/mainsearch');
                      //Navigator.pushNamed(context, '/topgenres');
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        height: 40,
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
                                  AppLocalizations.of(context)!.songsartists,
                                  style: TextStyle(
                                      color: Color(0xff8A9A9D),
                                      fontSize: 12,
                                      fontFamily: "Century"),
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Container(
                    // color: Colors.green,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your Top Genres",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              fontFamily: "Century"),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: InkWell(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, '/topgenres');
                                            },
                                            child: GenreCard())),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(child: GenreCard()),
                                  ],
                                ),
                                // SizedBox(
                                //   height: 8,
                                // ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    children: [
                                      Expanded(child: GenreCard()),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(child: GenreCard()),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Container(
                    // color: Colors.green,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Browse All",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              fontFamily: "Century"),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: InkWell(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, '/topgenres');
                                            },
                                            child: GenreCard())),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(child: GenreCard()),
                                  ],
                                ),
                                // SizedBox(
                                //   height: 8,
                                // ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    children: [
                                      Expanded(child: GenreCard()),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(child: GenreCard()),
                                    ],
                                  ),
                                ),
                                // SizedBox(
                                //   height: 8,
                                // ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    children: [
                                      Expanded(child: GenreCard()),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(child: GenreCard()),
                                    ],
                                  ),
                                ),
                                // SizedBox(
                                //   height: 8,
                                // ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    children: [
                                      Expanded(child: GenreCard()),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(child: GenreCard()),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GenreCard extends StatelessWidget {
  const GenreCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 90,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.lime),
      ),
      Positioned(
        top: 10,
        left: 10,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.25,
          child: Text(
            'K-pop',
            style: TextStyle(
                fontFamily: "Century",
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Positioned(
        bottom: -10,
        right: -10,
        child: Transform.rotate(
          angle: 40 * (3.1415926535 / 180),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              'lib/Image/ateez.jpeg',
              width: 65,
              height: 65,
              fit: BoxFit.cover,
            ),
          ),
        ),
      )
    ]);
  }
}

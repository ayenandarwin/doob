import 'package:doob/Pages/Library.dart';
import 'package:flutter/material.dart';

class Artists extends StatefulWidget {
  const Artists({super.key});

  @override
  State<Artists> createState() => _ArtistState();
}

class _ArtistState extends State<Artists> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 20,
      ),
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Sort By',
                      style: TextStyle(
                          fontFamily: 'Century',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Recently played',
                              style: TextStyle(
                                  fontFamily: 'Century',
                                  fontSize: 14,
                                  color: Color(0xffff9800),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Icon(
                            Icons.swap_vert,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            ArtistCard(),
            ArtistCard(),
            ArtistCard(),
            ArtistCard(),
            ArtistCard(),
            ArtistCard(),
            ArtistCard(),
          ],
        ),
      ),
    );
  }
}

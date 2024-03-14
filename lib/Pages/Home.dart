import 'package:doob/Component/PageIndicator.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   backgroundColor: Colors.orange,
      //   title: Container(
      //     child: Container(
      //       child: Text(
      //         "DOOB",
      //         style: TextStyle(
      //           color: Colors.white,
      //           //color: Color(0xffffff9800),
      //           fontFamily: "Century",
      //           fontWeight: FontWeight.bold,
      //           fontSize: 20,
      //         ),
      //       ),
      //     ),
      //   ),
      //   actions: [
      //     Container(
      //       margin: EdgeInsets.only(right: 10),
      //       child: Row(
      //         // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: [
      //           Icon(
      //             Icons.notifications,
      //             size: 20,
      //             color: Colors.white,
      //           ),
      //           SizedBox(
      //             width: 10,
      //           ),
      //           Icon(
      //             Icons.history,
      //             size: 20,
      //             color: Colors.white,
      //           ),
      //           SizedBox(
      //             width: 10,
      //           ),
      //           GestureDetector(
      //             onTap: () {
      //               Navigator.of(context).pushNamed('/setting');
      //             },
      //             child: Icon(
      //               Icons.settings,
      //               size: 20,
      //               color: Colors.white,
      //             ),
      //           ),
      //         ],
      //       ),
      //     )
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              //const EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 60),
              const EdgeInsets.only(right: 10, left: 10, bottom: 60),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                child: Text(
                                  "DOOB",
                                  style: TextStyle(
                                    color: Color(0xffffff9800),
                                    fontFamily: "Century",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.notifications,
                                size: 20,
                                color: Colors.white,
                              ),
                              Icon(
                                Icons.history,
                                size: 20,
                                color: Colors.white,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed('/setting');
                                },
                                child: Icon(
                                  Icons.settings,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  child: Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Music',
                          style: TextStyle(
                              fontFamily: 'Century',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        // SizedBox(width: 40),
                        Spacer(),
                        Text(
                          'PodCasts & Shows',
                          style: TextStyle(
                              fontFamily: 'Century',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Featured Today',
                          style: TextStyle(
                              fontFamily: 'Century',
                              //fontSize: 22,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: PageIndicator(),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 5),
                  child: Text(
                    'Your Personalized Mixes',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Century",
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      child: Row(
                        children: [
                          Mixes(),
                          SizedBox(
                            width: 10,
                          ),
                          Mixes(),
                          SizedBox(
                            width: 10,
                          ),
                          Mixes(),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 5),
                  child: Text(
                    'New Releases',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Century'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        NewRelese(),
                        SizedBox(
                          width: 10,
                        ),
                        NewRelese(),
                        SizedBox(
                          width: 10,
                        ),
                        NewRelese(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 5),
                  child: Text(
                    'New For You',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Century'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        NewFU(),
                        SizedBox(
                          width: 10,
                        ),
                        NewFU(),
                        SizedBox(
                          width: 10,
                        ),
                        NewFU(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 5),
                  child: Text(
                    'Your Artists Mixes',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Century'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        HomeArtistCard(),
                        SizedBox(
                          width: 10,
                        ),
                        HomeArtistCard(),
                        SizedBox(
                          width: 10,
                        ),
                        HomeArtistCard(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 5),
                  child: Text(
                    'Mood',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Century'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        HomePageMood(),
                        SizedBox(
                          width: 10,
                        ),
                        HomePageMood(),
                        SizedBox(
                          width: 10,
                        ),
                        HomePageMood(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 5),
                  child: Text(
                    'Devotional',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Century'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        HomePageMood(),
                        SizedBox(
                          width: 10,
                        ),
                        HomePageMood(),
                        SizedBox(
                          width: 10,
                        ),
                        HomePageMood(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 5),
                  child: Text(
                    'Top Charts',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Century'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        TopChart(),
                        SizedBox(
                          width: 10,
                        ),
                        TopChart(),
                        SizedBox(
                          width: 10,
                        ),
                        TopChart(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 5),
                  child: Text(
                    'Trending Near You',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Century'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        TrendingNearYou(),
                        SizedBox(
                          width: 10,
                        ),
                        TrendingNearYou(),
                        SizedBox(
                          width: 10,
                        ),
                        TrendingNearYou(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 5),
                  child: Text(
                    'Popular Playlists',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Century'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        PopularPlaylist(),
                        SizedBox(
                          width: 10,
                        ),
                        PopularPlaylist(),
                        SizedBox(
                          width: 10,
                        ),
                        PopularPlaylist(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 5),
                  child: Text(
                    'Your Most Played Songs',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Century'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        YourMostPlayedSongs(),
                        SizedBox(
                          width: 10,
                        ),
                        YourMostPlayedSongs(),
                        SizedBox(
                          width: 10,
                        ),
                        YourMostPlayedSongs(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 5),
                  child: Text(
                    'Flavours of Music',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Century'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        FlavourofMusics(),
                        SizedBox(
                          width: 10,
                        ),
                        FlavourofMusics(),
                        SizedBox(
                          width: 10,
                        ),
                        FlavourofMusics(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 5),
                  child: Text(
                    'Base On Your Recent',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Century'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        BaseOnYourRecent(),
                        SizedBox(
                          width: 10,
                        ),
                        BaseOnYourRecent(),
                        SizedBox(
                          width: 10,
                        ),
                        BaseOnYourRecent(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 5),
                  child: Text(
                    'Artists For You',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Century'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ArtistForU(),
                        SizedBox(
                          width: 10,
                        ),
                        ArtistForU(),
                        SizedBox(
                          width: 10,
                        ),
                        ArtistForU(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 5),
                  child: Text(
                    'Doob Choice',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Century'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        DoobChoice(),
                        SizedBox(
                          width: 10,
                        ),
                        DoobChoice(),
                        SizedBox(
                          width: 10,
                        ),
                        DoobChoice(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 5),
                  child: Text(
                    'Your Followed Artists',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Century'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        YourFollowArtist(),
                        SizedBox(
                          width: 10,
                        ),
                        YourFollowArtist(),
                        SizedBox(
                          width: 10,
                        ),
                        YourFollowArtist(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 5),
                  child: Text(
                    'International Hits Songs',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Century'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InternationalHitsSongs(),
                        SizedBox(
                          width: 10,
                        ),
                        InternationalHitsSongs(),
                        SizedBox(
                          width: 10,
                        ),
                        InternationalHitsSongs(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 5),
                  child: Text(
                    'Local Hits',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Century'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        LocalHits(),
                        SizedBox(
                          width: 10,
                        ),
                        LocalHits(),
                        SizedBox(
                          width: 10,
                        ),
                        LocalHits(),
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

class NewRelese extends StatelessWidget {
  const NewRelese({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'lib/Image/middle.jpg',
          fit: BoxFit.cover,
          height: 150,
          width: 150,
        ),
      ),
    );
  }
}

class Mixes extends StatelessWidget {
  const Mixes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'lib/Image/utopia.jpg',
          fit: BoxFit.cover,
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}

class NewFU extends StatelessWidget {
  const NewFU({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'lib/Image/unforgiven.jpg',
          fit: BoxFit.cover,
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}

class HomeArtistCard extends StatelessWidget {
  const HomeArtistCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      child: Column(
        children: [
          Container(
            height: 130,
            width: 130,
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
            height: 10,
          ),
          Text(
            'Joji',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Century',
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class HomePageMood extends StatelessWidget {
  const HomePageMood({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'lib/Image/JC.jpg',
          fit: BoxFit.cover,
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}

class Devotional extends StatelessWidget {
  const Devotional({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'lib/Image/IGOR.jpg',
        fit: BoxFit.cover,
        width: 150,
        height: 150,
      ),
    );
  }
}

class TopChart extends StatelessWidget {
  const TopChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'lib/Image/unforgiven.jpg',
          fit: BoxFit.cover,
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}

class TrendingNearYou extends StatelessWidget {
  const TrendingNearYou({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'lib/Image/utopia.jpg',
          fit: BoxFit.cover,
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}

class PopularPlaylist extends StatelessWidget {
  const PopularPlaylist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'lib/Image/middle.jpg',
          fit: BoxFit.cover,
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}

class YourMostPlayedSongs extends StatelessWidget {
  const YourMostPlayedSongs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'lib/Image/JC.jpg',
          fit: BoxFit.cover,
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}

class FlavourofMusics extends StatelessWidget {
  const FlavourofMusics({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'lib/Image/IGOR.jpg',
          fit: BoxFit.cover,
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}

class BaseOnYourRecent extends StatelessWidget {
  const BaseOnYourRecent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'lib/Image/utopia.jpg',
          fit: BoxFit.cover,
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}

class DoobChoice extends StatelessWidget {
  const DoobChoice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'lib/Image/JC.jpg',
          fit: BoxFit.cover,
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}

class InternationalHitsSongs extends StatelessWidget {
  const InternationalHitsSongs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'lib/Image/middle.jpg',
          fit: BoxFit.cover,
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}

class LocalHits extends StatelessWidget {
  const LocalHits({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'lib/Image/IGOR.jpg',
          width: 150,
          fit: BoxFit.cover,
          height: 150,
        ),
      ),
    );
  }
}

class ArtistForU extends StatelessWidget {
  const ArtistForU({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      child: Column(
        children: [
          Container(
            height: 130,
            width: 130,
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
            height: 10,
          ),
          Text(
            'Joji',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Century',
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class YourFollowArtist extends StatelessWidget {
  const YourFollowArtist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      child: Column(
        children: [
          Container(
            height: 130,
            width: 130,
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
            height: 10,
          ),
          Text(
            'Joji',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Century',
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

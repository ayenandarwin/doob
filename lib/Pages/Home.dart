import 'package:doob/Component/ArtistDetail.dart';
import 'package:doob/Component/MusicFolder.dart';
import 'package:doob/Component/NewReleaseDetails.dart';
import 'package:doob/Component/PageIndicator.dart';
import 'package:doob/Component/PlaylistDetails.dart';
import 'package:doob/Component/PlaylistMoreDetails.dart';
import 'package:doob/Component/Podcast&show.dart';
import "package:doob/Controller/navController.dart";

import 'package:doob/Libcomponent/AlbumsTabs.dart';
import 'package:doob/Libcomponent/Folder.dart';
import 'package:doob/Libcomponent/PodCast.dart';
import 'package:doob/MusicPlayer/MusicPlayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

import '../widgets/music_player/custom_slider_trackshape.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ScrollController _scrollController = new ScrollController();

  bool visible = true;
  bool isClick = false;
  int currentindex = 0;
  PageController controller = PageController();

  Widget currenttabs = MusicFolder();
  int currenttabsID = 0;
  List tabs = [
    {
      "lable": "Music",
      "Page": MusicFolder(),
      "id": 0,
    },
    {
      "lable": "PodCast & Shows",
      "Page": PodcastAndShow(),
      "id": 1,
    }
  ];

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();

    setState(() {
      
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final NaviController naviController = Get.put(NaviController());
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10, bottom: 60),
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
                                  child: Image.asset(
                                'lib/Image/DOOB.png',
                                width: 60,
                              )
                                 
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
                              Image.asset(
                                'lib/Icons/bar.png',
                                width: 25,
                                height: 25,
                              ),
                              Icon(
                                Icons.notifications,
                                size: 25,
                                color: Colors.white,
                              ),
                              // Icon(
                              //   Icons.history,
                              //   size: 20,
                              //   color: Colors.white,
                              // ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed('/setting');
                                },
                                child: Icon(
                                  Icons.settings,
                                  size: 25,
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
                    vertical: 10,
                  ),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, left: 0),
                      child: Row(
                        
                        children: tabs.map((e) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                currenttabs = e['Page'];
                                currenttabsID = e['id'];
                                
                              });
                            },
                            child: Libtab(
                              lableTabs: e['lable'],
                              selected: currenttabsID == e['id'],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                   
                  ),
                ),
                currenttabs,
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
      //  );
      //  },
      //)
//)
    );
  }
}

class NewRelese extends StatelessWidget {
  const NewRelese({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => NewReleaseDetails());
      },
      child: Container(
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
    return InkWell(
      onTap: () {
        Get.to(() => NewReleaseDetails());
      },
      child: Container(
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
    return InkWell(
      onTap: () {
        Get.to(() => NewReleaseDetails());
      },
      child: Container(
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
    return InkWell(
      onTap: () {
        Get.to(ArtistsDetails());
      },
      child: Container(
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
    return InkWell(
      onTap: () {
        Get.to(() => NewReleaseDetails());
      },
      child: Container(
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
    return InkWell(
      onTap: () {
        Get.to(() => NewReleaseDetails());
      },
      child: Container(
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
    return InkWell(
      onTap: () {
        Get.to(() => NewReleaseDetails());
      },
      child: Container(
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
    return InkWell(
      onTap: () {
        Get.to(() => NewReleaseDetails());
      },
      child: Container(
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
    return InkWell(
      onTap: () {
        Get.to(() => NewReleaseDetails());
      },
      child: Container(
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
    return InkWell(
      onTap: () {
        Get.to(() => NewReleaseDetails());
      },
      child: Container(
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
    return InkWell(
      onTap: () {
        Get.to(() => NewReleaseDetails());
      },
      child: Container(
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
    return InkWell(
      onTap: () {
        Get.to(() => NewReleaseDetails());
      },
      child: Container(
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
    return InkWell(
      onTap: () {
        Get.to(() => NewReleaseDetails());
      },
      child: Container(
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
    return InkWell(
      onTap: () {
        Get.to(() => NewReleaseDetails());
      },
      child: Container(
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
    return InkWell(
      onTap: () {
        Get.to(() => ArtistsDetails());
      },
      child: Container(
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
    return InkWell(
      onTap: () {
        Get.to(() => ArtistsDetails());
      },
      child: Container(
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
      ),
    );
  }
}

class MusicScreenCard extends StatefulWidget {
  const MusicScreenCard({
    super.key,
  });

  @override
  State<MusicScreenCard> createState() => _MusicScreenCardState();
}

class _MusicScreenCardState extends State<MusicScreenCard> {
  double value = 50;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          child: Image.asset(
            'lib/Image/Eric.png',
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                'lib/Image/jojipf.jpg',
                                height: 40,
                              )),
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              size: 20,
                              color: Color(0xffff9800),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2), blurRadius: 20)
                    ]),
                    child: Column(
                      children: [
                        InkWell(
                            onTap: () {
                              Get.to(() => PlaylistMoreDetails());
                              //Navigator.pushNamed(context, '/favoriteDetails');
                            },
                            child: Image.asset(
                              'lib/Icons/4.png',
                              height: 50,
                            )
                            // SvgPicture.asset('lib/Icons/love.svg',
                            //     height: 25),
                            ),
                        Text(
                          '5.3M',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Century",
                              fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2), blurRadius: 20)
                    ]),
                    child: Column(
                      children: [
                        Image.asset(
                          'lib/Icons/6.png',
                          height: 50,
                        ),
                        // SvgPicture.asset('lib/Icons/comment.svg', height: 25),
                        Text(
                          '5.3M',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Century",
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2), blurRadius: 20)
                    ]),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Share.share('com.example.doob');
                          },
                          child: Image.asset(
                            'lib/Icons/5.png',
                            height: 50,
                          ),
                        ),
                        //  SvgPicture.asset('lib/Icons/share.svg', height: 25),
                        Text(
                          '5.3M',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Century",
                              fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20)
                      ]),
                      child: Image.asset(
                        'lib/Icons/7.png',
                        height: 50,
                      )
                      //  SvgPicture.asset('lib/Icons/download.svg',
                      //     height: 25),
                      ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20)
                      ]),
                      child:
                          SvgPicture.asset('lib/Icons/repeat.svg', height: 25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20)
                      ]),
                      child:
                          SvgPicture.asset('lib/Icons/Shuffle.svg', height: 25),
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20)
                      ]),
                      child: Image.asset(
                        'lib/Icons/8.png',
                        height: 50,
                      )
                      // SvgPicture.asset('lib/Icons/option.svg', height: 25),
                      ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  child: Row(
                    children: [
                      Text(
                        '1:25',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SliderTheme(
                          data: const SliderThemeData(
                          //  trackShape: CustomSliderTrackShape(),
                            trackHeight: 2,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 4),
                            overlayShape: CustomSliderOverlayShape(),
                          ),
                          child: Slider(
                            min: 0,
                            max: 100,
                            value: value,
                            activeColor: Color(0xffffff9800),
                            onChanged: (v) => setState(() {
                              value = v;
                            }),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '3:55',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 100),
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.transparent),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Icon(
                                      Icons.cancel,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Center(
                                child: Text(
                                  'You are my sunshine, my only sunshine you make me happy when skies are gray you will never keep dear,how much I love you,please don\'t take my sunshine away.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Century',
                                    // wordSpacing: 2,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Color(0xffff9800),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        'Lyrics',
                        style: TextStyle(
                            fontFamily: 'Century',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class CustomSliderThumbShape extends RoundSliderThumbShape {
  const CustomSliderThumbShape({super.enabledThumbRadius = 10.0});

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    super.paint(context,
        center.translate(-(value - 0.5) / 0.5 * enabledThumbRadius, 0.0),
        activationAnimation: activationAnimation,
        enableAnimation: enableAnimation,
        isDiscrete: isDiscrete,
        labelPainter: labelPainter,
        parentBox: parentBox,
        sliderTheme: sliderTheme,
        textDirection: textDirection,
        value: value,
        textScaleFactor: textScaleFactor,
        sizeWithOverflow: sizeWithOverflow);
  }
}

class CustomSliderOverlayShape extends RoundSliderOverlayShape {
  final double enabledThumbRadius;
  const CustomSliderOverlayShape({this.enabledThumbRadius = 2});

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    super.paint(context,
        center.translate(-(value - 0.5) / 0.5 * enabledThumbRadius, 0.0),
        activationAnimation: activationAnimation,
        enableAnimation: enableAnimation,
        isDiscrete: isDiscrete,
        labelPainter: labelPainter,
        parentBox: parentBox,
        sliderTheme: sliderTheme,
        textDirection: textDirection,
        value: value,
        textScaleFactor: textScaleFactor,
        sizeWithOverflow: sizeWithOverflow);
  }
}

class VideoScreenCard extends StatefulWidget {
  const VideoScreenCard({
    super.key,
  });

  @override
  State<VideoScreenCard> createState() => _VideoScreenCardState();
}

class _VideoScreenCardState extends State<VideoScreenCard> {
  late VideoPlayerController _controller;
  bool isicon = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        if (mounted) {
          setState(() {});
          _controller.play();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            // height: double.infinity,
            child: Center(
          child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller)),
        )),
        GestureDetector(
          onTap: () async {
            if (_controller.value.isPlaying) {
              await _controller.pause();
            } else {
              await _controller.play();
            }
            setState(() {
              isicon = true;
            });
            await Future.delayed(Duration(milliseconds: 500));
            setState(() {
              isicon = false;
            });
          },
          child: Center(
            child: Container(
              color: Colors.transparent,
              height: double.infinity,
              width: double.infinity,
              child: Visibility(
                visible: isicon,
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 80,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                'lib/Image/jojipf.jpg',
                                height: 40,
                              )),
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              size: 20,
                              color: Color(0xffff9800),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20)
                      ]),
                      child: Column(
                        children: [
                          Image.asset('lib/Icons/love.png', height: 25),
                          Text(
                            '5.3M',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Century",
                                fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20)
                      ]),
                      child: Column(
                        children: [
                          Image.asset('lib/Icons/comment.png', height: 25),
                          Text(
                            '5.3M',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Century",
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20)
                      ]),
                      child: Column(
                        children: [
                          Image.asset('lib/Icons/share.png', height: 25),
                          Text(
                            '5.3M',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Century",
                                fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20)
                      ]),
                      child: Column(
                        children: [
                          Image.asset('lib/Icons/download.png', height: 25),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20)
                      ]),
                      child: Column(
                        children: [
                          Image.asset('lib/Icons/option.png', height: 25),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 8,
                  child: VideoProgressIndicator(_controller,
                      allowScrubbing: true,
                      colors: VideoProgressColors(
                          backgroundColor: Colors.white.withOpacity(0.1),
                          bufferedColor: Colors.white.withOpacity(0.3),
                          playedColor: Color(0xffffff9800))),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class Libtab extends StatelessWidget {
  const Libtab({
    super.key,
    required this.lableTabs,
    required this.selected,
  });

  final lableTabs;
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
            lableTabs,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

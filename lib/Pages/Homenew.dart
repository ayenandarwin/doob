import 'package:doob/Component/MusicFolder.dart';
import 'package:doob/Component/PlaylistMoreDetails.dart';
import 'package:doob/Component/Podcast&show.dart';
import "package:doob/Controller/navController.dart";
import 'package:doob/widgets/feature_today.dart';
import 'package:doob/widgets/international_hits_songs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';
import '../widgets/artist_for_you.dart';
import '../widgets/base_on_your_recent.dart';
import '../widgets/devotional.dart';
import '../widgets/doob_choice.dart';
import '../widgets/flavour_of_musics.dart';
import '../widgets/home_articles_card.dart';
import '../widgets/home_page_mood.dart';
import '../widgets/local_hits.dart';
import '../widgets/mixes.dart';
import '../widgets/new_for_you.dart';
import '../widgets/new_release.dart';
import '../widgets/play_list.dart';
import '../widgets/popular_playlist.dart';
import '../widgets/top_charts.dart';
import '../widgets/trending_near_you.dart';
import '../widgets/your_follow_artist.dart';
import '../widgets/your_most_playedsongs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

    setState(() {});
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
                                'assets/Image/DOOB.png',
                                width: 60,
                              )),
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
                                'assets/Icons/bar.png',
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
                FeatureToday(),
                PlayList(
                  lableText: "Your Personalized Mixes",
                  widget: Mixes(),
                ),
                PlayList(
                  lableText: "New Releases",
                  widget: NewRelese(),
                ),
                PlayList(
                  lableText: "New For You",
                  widget: NewFU(),
                ),
                PlayList(
                  lableText: "Your Artists Mixes",
                  widget: HomeArtistCard(),
                ),
                PlayList(
                  lableText: "Mood",
                  widget: HomePageMood(),
                ),
                PlayList(
                  lableText: "Devotional",
                  widget: Devotional(),
                ),
                PlayList(
                  lableText: "Top Charts",
                  widget: TopChart(),
                ),
                PlayList(
                  lableText: "Trending Near You",
                  widget: TrendingNearYou(),
                ),
                PlayList(
                  lableText: "Popular Playlists",
                  widget: PopularPlaylist(),
                ),
                PlayList(
                  lableText: "Your Most Played Songs",
                  widget: YourMostPlayedSongs(),
                ),
                PlayList(
                  lableText: "Flavours of Music",
                  widget: FlavourofMusics(),
                ),
                PlayList(
                  lableText: "Base On Your Recent",
                  widget: BaseOnYourRecent(),
                ),
                PlayList(
                  lableText: "Artists For You",
                  widget: ArtistForU(),
                ),
                PlayList(
                  lableText: "Doob Choice",
                  widget: DoobChoice(),
                ),
                PlayList(
                  lableText: "Your Followed Artists",
                  widget: YourFollowArtist(),
                ),
                PlayList(
                  lableText: "International Hits Songs",
                  widget: InternationalHitsSongs(),
                ),
                PlayList(
                  lableText: "Local Hits",
                  widget: LocalHits(),
                ),
              ],
            ),
          ),
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
            'assets/Image/Eric.png',
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
                                'assets/Image/jojipf.jpg',
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
                              'assets/Icons/4.png',
                              height: 50,
                            )
                            // SvgPicture.asset('assets/Icons/love.svg',
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
                          'assets/Icons/6.png',
                          height: 50,
                        ),
                        // SvgPicture.asset('assets/Icons/comment.svg', height: 25),
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
                            'assets/Icons/5.png',
                            height: 50,
                          ),
                        ),
                        //  SvgPicture.asset('assets/Icons/share.svg', height: 25),
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
                        'assets/Icons/7.png',
                        height: 50,
                      )
                      //  SvgPicture.asset('assets/Icons/download.svg',
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
                          SvgPicture.asset('assets/Icons/repeat.svg', height: 25),
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
                          SvgPicture.asset('assets/Icons/Shuffle.svg', height: 25),
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20)
                      ]),
                      child: Image.asset(
                        'assets/Icons/8.png',
                        height: 50,
                      )
                      // SvgPicture.asset('assets/Icons/option.svg', height: 25),
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
                                'assets/Image/jojipf.jpg',
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
                          Image.asset('assets/Icons/love.png', height: 25),
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
                          Image.asset('assets/Icons/comment.png', height: 25),
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
                          Image.asset('assets/Icons/share.png', height: 25),
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
                          Image.asset('assets/Icons/download.png', height: 25),
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
                          Image.asset('assets/Icons/option.png', height: 25),
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

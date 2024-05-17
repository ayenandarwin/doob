import 'package:doob/src/presentation/widgets/home_widgets/home_noti_bar.dart';
import 'package:doob/src/presentation/widgets/home_widgets/music_podcast_show.dart';
import 'package:flutter/material.dart';

import '../../widgets/home_widgets/artist_for_you.dart';
import '../../widgets/home_widgets/base_on_your_recent.dart';
import '../../widgets/home_widgets/devotional.dart';
import '../../widgets/home_widgets/doob_choice.dart';
import '../../widgets/feature_today.dart';
import '../../widgets/home_widgets/flavour_of_musics.dart';
import '../../widgets/home_widgets/home_articles_card.dart';
import '../../widgets/home_widgets/home_page_mood.dart';
import '../../widgets/home_widgets/international_hits_songs.dart';
import '../../widgets/home_widgets/local_hits.dart';
import '../../widgets/home_widgets/mixes.dart';
import '../../widgets/home_widgets/new_for_you.dart';
import '../../widgets/home_widgets/new_release.dart';
import '../../widgets/play_list.dart';
import '../../widgets/home_widgets/popular_playlist.dart';
import '../../widgets/home_widgets/top_charts.dart';
import '../../widgets/home_widgets/trending_near_you.dart';
import '../../widgets/home_widgets/your_follow_artist.dart';
import '../../widgets/home_widgets/your_most_playedsongs.dart';

class HomeNavScreen extends StatefulWidget {
  const HomeNavScreen({super.key});

  @override
  State<HomeNavScreen> createState() => _HomeNavScreenState();
}

class _HomeNavScreenState extends State<HomeNavScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10, bottom: 60),
            child: Column(
              children: [
                HomeNotiBar(),
                MusicAndPodcastShow(),
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


import 'package:doob/services/songServiceProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Podcast extends StatefulWidget {
  const Podcast({super.key});

  @override
  State<Podcast> createState() => _PodcastState();
}

class _PodcastState extends State<Podcast> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 20,
          ),
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
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
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Icon(Icons.favorite_border),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            "Your Liked Podcasts",
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
                  padding: const EdgeInsets.symmetric(vertical: 10),
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
                        'A - Z',
                        style: TextStyle(
                            fontFamily: "Century",
                            fontSize: 14,
                            color: Color(0xffff9800),
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 10, right: 10, bottom: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.55,
                    child: ref.watch(songServiceProvider).when(
                        data: (podcastList) {
                      // Filter the list to only include items of type 'podcast'
                      final podcasts = podcastList!.data!
                          .where((item) => item.type.toString() == 'podcast')
                          .toList();

                      return 
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: podcasts.length,
                          itemBuilder: (context, index) {
                            final podcast = podcasts[index];
                            return InkWell(
                              onTap: () async {},
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 70,
                                        width: 70,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.network(
                                            podcast.cover_photo!,
                                            errorBuilder: (BuildContext context,
                                                Object exception,
                                                StackTrace? stackTrace) {
                                              return Image.network(
                                                'https://media.istockphoto.com/photos/music-picture-id535427404?k=6&m=535427404&s=612x612&w=0&h=en1c7qslpGsVRkrTUHPvBNmA61gPUXl_v8ABMgQoZPY=',
                                              );
                                            },
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              podcast.name.toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Century",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                            Text(
                                              podcast.type.toString(),
                                              style: TextStyle(
                                                  color: Color(0xff8A9A9D),
                                                  fontFamily: "Century",
                                                  fontSize: 12),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    }, error: (Object error, StackTrace stackTrace) {
                      return Text('$error');
                    }, loading: () {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


import 'package:doob/Component/PlaylistDetails.dart';
import 'package:doob/Model/Album/album.dart';
import 'package:doob/Pages/Library.dart';
import 'package:doob/services/albumIdServiceProvider.dart';
import 'package:doob/services/albumServiceProvider.dart';
import 'package:doob/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class AlbumsTabs extends StatefulWidget {
  const AlbumsTabs({super.key});

  @override
  State<AlbumsTabs> createState() => _AlbumsTabsState();
}

class _AlbumsTabsState extends State<AlbumsTabs> {
  String? albumId;
  String? albumName;
  String? albumType;
  String? albumCoverPhoto;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer(builder: (context, ref, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
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
                                //color: Color(0xffff9800)
                              ),
                              child: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Text(
                          "Add New Playlist",
                          style: TextStyle(
                              fontFamily: "Century",
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
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
                                    color: Color(0xffff9800)),
                                child: Icon(Icons.favorite_border),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Text(
                            "Your Liked Song",
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
                  padding: const EdgeInsets.all(10.0),
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
                        'Recently played',
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
                    child:
                        ref.watch(albumServiceProvider).when(data: (albumList) {
                      return 
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: albumList!.data!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (() async {
                                setState(() {
                                  albumId =
                                      albumList.data![index].id.toString();
                                  albumName = albumList.data![index].name;
                                  albumType = albumList.data![index].type;
                                  albumCoverPhoto =
                                      albumList.data![index].cover_photo;
                                });
                                // bool res = await
                                Get.to(() => PlaylistDetails(
                                      id: albumId.toString(),
                                      name: albumName,
                                      type: albumType,
                                      coverPhoto: albumCoverPhoto,
                                    ));

                                // if (res) {
                                //   ref.invalidate(albumIdServiceProvider);
                                // }
                              }),
                              // Navigator.pushNamed(
                              //     context, '/playlistDetails');

                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Container(
                                  // decoration: BoxDecoration(
                                  //   // color: Colors.grey.withOpacity(0.4),
                                  //   color: Color.fromARGB(255, 194, 211, 226),
                                  //   borderRadius: const BorderRadius.all(
                                  //     Radius.circular(10),
                                  //   ),
                                  // ),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 70,
                                        width: 70,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child:
                                           Image.network(
                                            albumList.data![index].cover_photo!
                                                ,
                                            errorBuilder: (BuildContext context,
                                                Object exception,
                                                StackTrace? stackTrace) {
                                              // This function is called when the image fails to load
                                              // Return a new widget to display a dummy image from the internet
                                              return Image.network(
                                                'https://media.istockphoto.com/photos/music-picture-id535427404?k=6&m=535427404&s=612x612&w=0&h=en1c7qslpGsVRkrTUHPvBNmA61gPUXl_v8ABMgQoZPY=',
                                              );
                                            },
                                            // 'lib/Image/joji.png',
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
                                              // 'SMITHREENS',
                                              albumList.data![index].name
                                                  .toString(),

                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Century",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                            Text(
                                              albumList.data![index].type
                                                  .toString(),

                                              //'Joji',
                                              style: TextStyle(
                                                  color: Color(0xff8A9A9D),
                                                  fontFamily: "Century",
                                                  // fontWeight: FontWeight.bold,
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
                            // _albumsCard(ApiUrl.albumlists[index]);
                          });
                    }, error: (Object error, StackTrace stackTrace) {
                      return Text('$error');
                    }, loading: () {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}

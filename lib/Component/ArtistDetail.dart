import 'package:doob/Pages/Library.dart';
import 'package:doob/services/artistServiceProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArtistsDetails extends StatefulWidget {
  const ArtistsDetails({super.key});

  @override
  State<ArtistsDetails> createState() => _ArtistsDetailstate();
}

class _ArtistsDetailstate extends State<ArtistsDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Consumer(builder: (context, ref, child) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 20,
            ),
            child: Container(
              child: Column(
                children: [
                  // Container(
                  //   padding: EdgeInsets.symmetric(horizontal: 10),
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //         child: Text(
                  //           'Sort By',
                  //           style: TextStyle(
                  //               fontFamily: 'Century',
                  //               fontSize: 14,
                  //               fontWeight: FontWeight.bold,
                  //               color: Colors.white),
                  //         ),
                  //       ),
                  //       Expanded(
                  //         child: Container(
                  //           child: Row(
                  //             children: [
                  //               Expanded(
                  //                 child: Text(
                  //                   'Recently played',
                  //                   style: TextStyle(
                  //                       fontFamily: 'Century',
                  //                       fontSize: 14,
                  //                       color: Color(0xffff9800),
                  //                       fontWeight: FontWeight.bold),
                  //                 ),
                  //               ),
                  //               Icon(
                  //                 Icons.swap_vert,
                  //                 color: Colors.white,
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 10, right: 10, bottom: 10),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: ref.watch(artistServiceProvider).when(
                          data: (artistList) {
                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: artistList!.data!.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  onTap: (() {
                                    
                                    // Navigator.pushNamed(
                                    //     context, '/playlistDetails');
                                  }),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 70,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              child: Image.network(
                                                artistList.data![index].photo
                                                    .toString(),
                                                errorBuilder: (BuildContext
                                                        context,
                                                    Object exception,
                                                    StackTrace? stackTrace) {
                                                  // This function is called when the image fails to load
                                                  // Return a new widget to display a dummy image from the internet
                                                  return Image.network(
                                                    'https://clipart-library.com/3/music-notes-clipart-free-example-279.png',
                                                    //  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJ-W41oGBjPVFqXzr89nZs8Pe6Sc1r_bpq2A&usqp=CAU',
                                                    // 'https://i.pinimg.com/474x/69/96/5c/69965c2849ec9b7148a5547ce6714735.jpg',
                                                    // 'https://upload.wikimedia.org/wikipedia/en/1/1f/Taylor_Swift_-_Taylor_Swift.png',
                                                    //'https://static.independent.co.uk/s3fs-public/thumbnails/image/2016/07/25/17/ariana-grande.jpg?quality=75&width=990&crop=3%3A2%2Csmart&auto=webp',
                                                    // 'https://media.istockphoto.com/photos/music-picture-id535427404?k=6&m=535427404&s=612x612&w=0&h=en1c7qslpGsVRkrTUHPvBNmA61gPUXl_v8ABMgQoZPY=',
                                                  );
                                                },
                                                // 'lib/Image/joji.png',
                                                fit: BoxFit.cover,
                                              ),
                                              // Image.asset(
                                              //   'lib/Image/jojipf.jpg',
                                              //   fit: BoxFit.cover,
                                              // ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: Text(
                                              artistList.data![index].name!,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Century",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ));
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
                  ),

                  //ArtistCard(),
                  // ArtistCard(),
                  // ArtistCard(),
                  // ArtistCard(),
                  // ArtistCard(),
                  // ArtistCard(),
                  // ArtistCard(),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

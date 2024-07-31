import 'dart:io';
import 'package:doob/provider/audio_provider.dart';
import 'package:doob/services/songServiceProvider.dart';
import 'package:doob/src/data/repositories/music_repo/music_repository.dart';
import 'package:doob/src/domain/state/api_state.dart';
import 'package:doob/src/providers/music_provider/music_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

final musicDetailProvider =
    StateNotifierProvider.autoDispose<MusicProvider, ApiState>((ref) {
  final repository = ref.watch(musicRepositoryProvider);
  return MusicProvider(repository);
});

class AudioDownload extends ConsumerWidget {
  const AudioDownload({super.key});
  // static const path = 'favscreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audioDownload = ref.watch(musicDetailProvider);
    final songLists = audioDownload.data
        .where((item) => item.type.toString() == 'song')
        .toList();
    print("Song list data : ${songLists}");

    //final downloadlocal1 = ref.watch(musicDetailProvider);
    final downloadlocal = ref.watch(downloadLocal);
    print('It is ok?');
    Future<String> _getFilePath() async {
      final dir = await getApplicationDocumentsDirectory();
      final filePath = dir.path;
      print('are u ok Ok $filePath');
      return filePath;
    }

    void someFunction() async {
      final filePath = await _getFilePath();
      print(filePath);
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            downloadlocal.when(
              data: (download) {
                if (download.data == null) {
                  return Center(
                    child: Text(
                      'no download audio',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                } else {
                  return
                      // Text  ( 'ok',  style: TextStyle(color: Colors.white),  );
                      Expanded(
                    child:
                        // ListView.builder(
                        //       scrollDirection: Axis.vertical,
                        //       shrinkWrap: true,
                        //       itemCount:  download.data!.length,
                        //       itemBuilder: (context, index) {
                        //         final podcast = download.data![index];
                        //         return InkWell(
                        //           onTap: () async {},
                        //           child: Padding(
                        //             padding:
                        //                 const EdgeInsets.symmetric(vertical: 10),
                        //             child: Container(
                        //               child: Row(
                        //                 children: [
                        //                   Container(
                        //                     height: 70,
                        //                     width: 70,
                        //                     child: ClipRRect(
                        //                       borderRadius:
                        //                           BorderRadius.circular(8),
                        //                       child: Image.network(
                        //                         podcast.cover_photo!,
                        //                         errorBuilder: (BuildContext context,
                        //                             Object exception,
                        //                             StackTrace? stackTrace) {
                        //                           return Image.network(
                        //                             'https://media.istockphoto.com/photos/music-picture-id535427404?k=6&m=535427404&s=612x612&w=0&h=en1c7qslpGsVRkrTUHPvBNmA61gPUXl_v8ABMgQoZPY=',
                        //                           );
                        //                         },
                        //                         fit: BoxFit.cover,
                        //                       ),
                        //                     ),
                        //                   ),
                        //                   SizedBox(
                        //                     width: 20,
                        //                   ),
                        //                   Expanded(
                        //                     flex: 4,
                        //                     child: Column(
                        //                       crossAxisAlignment:
                        //                           CrossAxisAlignment.start,
                        //                       children: [
                        //                         Text(
                        //                           podcast.name.toString(),
                        //                           style: TextStyle(
                        //                               color: Colors.white,
                        //                               fontFamily: "Century",
                        //                               fontWeight: FontWeight.bold,
                        //                               fontSize: 14),
                        //                         ),
                        //                         Text(
                        //                           podcast.type.toString(),
                        //                           style: TextStyle(
                        //                               color: Color(0xff8A9A9D),
                        //                               fontFamily: "Century",
                        //                               fontSize: 12),
                        //                         )
                        //                       ],
                        //                     ),
                        //                   )
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         );
                        //       })

                        ListView.builder(
                      // itemCount: download.data![0].audio!.length,
                      itemCount: download.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () async {
                              // return context.go(
                              //     '/${DownloadAudioDetail.path}/${data.downloads[0].audio[index].id}/${data.downloads[0].audio[index].title}/${data.downloads[0].audio[index].description}');
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.11,
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    //  color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 5,
                                    blurRadius: 5,
                                    offset: const Offset(
                                        0, 2), // changes position of shadow
                                  ),
                                ],
                                //  color: const Color(0xfff5faff),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        download.data![index].cover_photo!,
                                        //  height: 250.0,
                                        // height:

                                        height: 70,
                                        //MediaQuery.of(context).size.height * 0.13,
                                        width: 70,
                                        // MediaQuery.of(context).size.width *
                                        //     0.21,
                                        // width: 80.0,
                                        fit: BoxFit.cover,
                                        errorBuilder: (BuildContext context,
                                            Object exception,
                                            StackTrace? stackTrace) {
                                          // This function is called when the image fails to load
                                          // Return a new widget to display a dummy image from the internet
                                          return Image.network(
                                            'https://via.placeholder.com/250x250.png?text=Image+Failed+to+Load',
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.13,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.21,
                                            fit: BoxFit.cover,
                                          );
                                        },
                                      ),
                                    ),
                                  ),

                                  // Padding(
                                  //   padding: const EdgeInsets.all(8.0),
                                  //   child: ClipRRect(
                                  //       borderRadius: BorderRadius.circular(8.0),
                                  //       // ignore: unnecessary_null_comparison
                                  //       child: const SizedBox(
                                  //         height: 250.0,
                                  //         width: 80.0,
                                  //       )),
                                  // ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        download.data![index].name!,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Century",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),

                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          // const Icon(
                                          //   Icons.star_rounded,
                                          //   color: Color(0xfff2ad70),
                                          //   size: 15,
                                          // ),
                                          // const Icon(
                                          //   Icons.star_rounded,
                                          //   color: Color(0xfff2ad70),
                                          //   size: 15,
                                          // ),
                                          // const Icon(
                                          //   Icons.star_outline_rounded,
                                          //   color: Color(0xfff2ad70),
                                          //   size: 15,
                                          // ),
                                          // const Icon(
                                          //   Icons.star_outline_rounded,
                                          //   color: Color(0xfff2ad70),
                                          //   size: 15,
                                          // ),
                                          // const SizedBox(
                                          //   width: 10,
                                          // ),
                                          Text(
                                            download.data![index].type
                                                .toString(),
                                            style: const TextStyle(
                                                color: Color(0xff8A9A9D),
                                                fontFamily: "Century",
                                                //fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      // Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.spaceBetween,
                                      //   children: [
                                      //     SizedBox(
                                      //       height: 30,
                                      //       child: TextButton(
                                      //         style: ButtonStyle(
                                      //           foregroundColor:
                                      //               MaterialStateProperty.all<
                                      //                   Color>(Colors.white),
                                      //           backgroundColor:
                                      //               MaterialStateProperty
                                      //                   .all<Color>(const Color(
                                      //                       0xffe5ffed)),
                                      //           shape:
                                      //               MaterialStateProperty.all<
                                      //                   RoundedRectangleBorder>(
                                      //             RoundedRectangleBorder(
                                      //               borderRadius:
                                      //                   BorderRadius.circular(
                                      //                       8.0),
                                      //               side: const BorderSide(
                                      //                 color: Color(0xffe5ffed),
                                      //               ),
                                      //             ),
                                      //           ),
                                      //         ),
                                      //         onPressed: () {},
                                      //         child: const Text(
                                      //           'Free Book',
                                      //           style: TextStyle(
                                      //             fontSize: 10,
                                      //             fontWeight: FontWeight.normal,
                                      //             fontFamily: 'Poppins',
                                      //             color: Color(0xff0e8738),
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //     const SizedBox(
                                      //       width: 10,
                                      //     ),
                                      //     const SizedBox(
                                      //       width: 125,
                                      //     ),
                                      //     const Icon(
                                      //       Icons.favorite,
                                      //       color: Colors.red,
                                      //       size: 15,
                                      //     ),
                                      //   ],
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
              loading: () => const CircularProgressIndicator(),
              error: (error, stackTrace) => Text('Error: $error'),
            ),
          ],
        ),
      ),
    );
  }
}

// class PdfViewerScreen extends StatelessWidget {
//   final String filePath;

//   const PdfViewerScreen({required this.filePath});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Viewer'),
//       ),
//       body: SfPdfViewer.file(File(filePath)),
//     );
//   }
// }

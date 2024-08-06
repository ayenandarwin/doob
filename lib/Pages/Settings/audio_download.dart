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
    final downloadlocal = ref.watch(audioDownloadLocal);
    print('It is ok?');
    Future<String> _getFilePath() async {
      final dir = await getApplicationDocumentsDirectory();
      final filePath = dir.path;
      print('are u ok Ok $filePath');
      return filePath;
    }

    // void someFunction() async {
    //   final filePath = await _getFilePath();
    //   print(filePath);
    // }

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
                    child: ListView.builder(
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

                                        height: 70,
                                        //MediaQuery.of(context).size.height * 0.13,
                                        width: 70,
                                        // MediaQuery.of(context).size.width *
                                        //     0.21,

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

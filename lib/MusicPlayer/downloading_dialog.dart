/*import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DownloadingDialog extends StatefulWidget {
  final String? urllink;
  final String? file;
  // final List lacalStorage;

  // final prefs = await SharedPreferences.getInstance();

  const DownloadingDialog(
      {Key? key, this.urllink, this.file, })
      : super(key: key);

  @override
  _DownloadingDialogState createState() => _DownloadingDialogState();
}

class _DownloadingDialogState extends State<DownloadingDialog> {
  Dio dio = Dio();
  double progress = 0.0;

  void startDownloading() async {
    String? url = widget.urllink;

    String? fileName = '${widget.file}';
    print(url);

    

    String path = await _getFilePath(fileName);

    await dio.download(
      url!,
      path,
      onReceiveProgress: (recivedBytes, totalBytes) {
        setState(() {
          progress = recivedBytes / totalBytes;
        });

        print(progress);
      },
      deleteOnError: true,
    ).then((_) {
      Navigator.pop(context);
    });
  }

  Future<String?> _getData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<String> _getFilePath(String filename) async {
    final dir = await getApplicationDocumentsDirectory();
    print("///////// ${dir.path}/$filename");
    return "${dir.path}/$filename";
  }

  @override
  void initState() {
    super.initState();
    startDownloading();
  }

  @override
  Widget build(BuildContext context) {
    String downloadingprogress = (progress * 100).toInt().toString();

    return AlertDialog(
      backgroundColor: Colors.black,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator.adaptive(),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Downloading: $downloadingprogress%",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}*/

import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:doob/Model/SongList/songlist.dart';
import 'package:doob/utils/sharedPreference.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'dart:convert';

class DownloadingDialog extends StatefulWidget {
  final String? urllink;
  final String? file;
  final dynamic apiSong;

  DownloadingDialog({Key? key, this.urllink, this.file, required this.apiSong})
      : super(key: key);

  @override
  _DownloadingDialogState createState() => _DownloadingDialogState();
}

class _DownloadingDialogState extends State<DownloadingDialog> {
  Dio dio = Dio();
  double progress = 0.0;

  void startDownloading() async {
    String? url = widget.urllink;
    String? fileName = '${widget.file}';
    //List<Map<String, dynamic>>? downloadAudioData = widget.apiSong;

    print(url);

    String path = await _getFilePath(fileName);

    await dio.download(
      url!,
      path,
      onReceiveProgress: (recivedBytes, totalBytes) {
        setState(() {
          progress = recivedBytes / totalBytes;
        });

        print(progress);
      },
      deleteOnError: true,
    ).then((_) async {
      // Read file contents

      //String fileContents = await File(path).readAsString();
      //  Uint8List fileBytes = await File(fileContents).readAsBytes();

      // Parse JSON data into a list
      //List<dynamic> dataList = jsonDecode(fileContents);

      List<dynamic> originalSongList = [];
      var data = await _getData('musiclocaldata');
      if (data != null) {
       originalSongList =
            data.map((e) => jsonDecode(e)).toList();

      }
        originalSongList.add(widget.apiSong);
      // Store list in SharedPreferences
      await _storeData('musiclocaldata', originalSongList);

      Navigator.pop(context);
    });
  }

  Future<void> _storeData(String key, List<dynamic> value) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> stringList = value.map((e) => jsonEncode(e)).toList();
    await prefs.setStringList(key, stringList);
  }

  Future<List<String>?> _getData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? stringList = await prefs.getStringList(key);
    return stringList;
  }

  Future<String> _getFilePath(String filename) async {
    final dir = await getApplicationDocumentsDirectory();
    print("///////// ${dir.path}/$filename");
    return "${dir.path}/$filename";
  }

  @override
  void initState() {
    super.initState();
    startDownloading();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> localMusicInfoData = [];
    String downloadingprogress = (progress * 100).toInt().toString();

    return AlertDialog(
      backgroundColor: Colors.black,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator.adaptive(),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Downloading: $downloadingprogress%",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}

/*import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'dart:convert';

class DownloadingDialog extends StatefulWidget {
  final String? urllink;
  final String? file;

  const DownloadingDialog({Key? key, this.urllink, this.file}) : super(key: key);

  @override
  _DownloadingDialogState createState() => _DownloadingDialogState();
}

class _DownloadingDialogState extends State<DownloadingDialog> {
  Dio dio = Dio();
  double progress = 0.0;

  void startDownloading() async {
    String? url = widget.urllink;
    String? fileName = '${widget.file}';
    print(url);

    String path = await _getFilePath(fileName);

    await dio.download(
      url!,
      path,
      onReceiveProgress: (receivedBytes, totalBytes) {
        setState(() {
          progress = receivedBytes / totalBytes;
        });

        print(progress);
      },
      deleteOnError: true,
    ).then((_) async {
      // Read file contents as bytes
      Uint8List fileBytes = await File(path).readAsBytes();

      // Process the binary data as needed (e.g., save to SharedPreferences or play the audio)

      Navigator.pop(context);
    });
  }

  Future<String> _getFilePath(String filename) async {
    final dir = await getApplicationDocumentsDirectory();
    print("///////// ${dir.path}/$filename");
    return "${dir.path}/$filename";
  }

  @override
  void initState() {
    super.initState();
    startDownloading();
  }

  @override
  Widget build(BuildContext context) {
    String downloadingProgress = (progress * 100).toInt().toString();

    return AlertDialog(
      backgroundColor: Colors.black,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator.adaptive(),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Downloading: $downloadingProgress%",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}*/


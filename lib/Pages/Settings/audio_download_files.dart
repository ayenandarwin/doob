import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AudioFileListScreen extends StatefulWidget {
  final String subDir;

  AudioFileListScreen({required this.subDir});

  @override
  _AudioFileListScreenState createState() => _AudioFileListScreenState();
}

class _AudioFileListScreenState extends State<AudioFileListScreen> {
  List<dynamic> songList = [];

  @override
  void initState() {
    super.initState();
  }

  Future<List<String>?> _getData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? stringList = await prefs.getStringList(key);
    return stringList;
  }

  Future<List<Metadata>> _getAudioFiles(String subDir) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = Directory('${directory.path}/$subDir');
    if (!await path.exists()) {
      return [];
    }

    final audioFiles = <Metadata>[];
    final files = path.listSync().where((file) {
      final ext = file.path.split('.').last.toLowerCase();
      return ['mp3', 'wav', 'aac', 'm4a', 'flac'].contains(ext);
    }).toList();

    for (var file in files) {
      final metadata = await MetadataRetriever.fromFile(File(file.path));
      audioFiles.add(metadata);
    }

    return audioFiles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Files in ${widget.subDir}'),
      ),
      body: FutureBuilder<List<String>?>(
        future: _getData('musiclocaldata'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No audio files found'));
          } else {
            final files = snapshot.data!;
            List<dynamic> song = files.map((e) => jsonDecode(e)).toList();
            print(song);
            print('get data');
            return ListView.builder(
              itemCount: song.length,
              itemBuilder: (context, index) {
                final audio = song[index];
                return ListTile(
                  leading: audio['cover_photo'] != null
                      ? Image.network(audio['cover_photo'])
                      : Icon(Icons.audiotrack),
                  title: Text(audio['name'] ?? 'Unknown Title'),
                  subtitle: Text('${audio['type'] ?? 'Unknown Artis'}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}

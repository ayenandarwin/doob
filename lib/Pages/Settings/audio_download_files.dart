import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';
import 'package:path_provider/path_provider.dart';

class AudioFileListScreen extends StatefulWidget {
  final String subDir;

  AudioFileListScreen({required this.subDir});

  @override
  _AudioFileListScreenState createState() => _AudioFileListScreenState();
}

class _AudioFileListScreenState extends State<AudioFileListScreen> {
  late Future<List<Metadata>> _audioFiles;

  @override
  void initState() {
    super.initState();
    _audioFiles = _getAudioFiles(widget.subDir);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Files in ${widget.subDir}'),
      ),
      body: FutureBuilder<List<Metadata>>(
        future: _audioFiles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No audio files found'));
          } else {
            final files = snapshot.data!;
            return ListView.builder(
              itemCount: files.length,
              itemBuilder: (context, index) {
                final file = files[index];
                return ListTile(
                  leading: file.albumArt != null
                      ? Image.memory(file.albumArt!)
                      : Icon(Icons.audiotrack),
                  title: Text(file.trackName ?? 'Unknown Title'),
                  subtitle: Text(
                      '${file.albumArtistName ?? 'Unknown Artist'} - ${file.albumName ?? 'Unknown Album'}'),
                );
              },
            );
          }
        },
      ),
    );
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
}

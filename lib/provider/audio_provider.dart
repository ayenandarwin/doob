import 'dart:convert';
import 'dart:io';

import 'package:doob/Model/SongList/songlist.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

final downloadLocal = FutureProvider<SongList>((ref) async {
  final directory = await getApplicationDocumentsDirectory();
  final filePath = '${directory.path}/response.json';

  final file = File(filePath);
  if (!await file.exists()) {
    final initialData = {
      "success": true,
      "downloads": []
    }; // Replace with your desired initial JSON data
    final jsonString = jsonEncode(initialData);

    // Create the file and write the initial JSON data
    await file.writeAsString(jsonString);
  }

  final jsonString = await file.readAsString();

  final json = jsonDecode(jsonString);
  print(json);
  return SongList.fromJson(json);
});
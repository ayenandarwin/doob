import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: AudioDialogEg(subDir: '',),
//     );
//   }
// }

class AudioDialogEg extends StatefulWidget {
  final String subDir;

  const AudioDialogEg({Key? key, required this.subDir}) : super(key: key);

  @override
  _AudioDialogEgState createState() => _AudioDialogEgState();
}

class _AudioDialogEgState extends State<AudioDialogEg> {
  List<dynamic> dataList = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    String key = widget.subDir; // replace with your actual key used for storage
    dataList = await _retrieveData(key);
    setState(() {});
  }

  Future<List<dynamic>> _retrieveData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? stringList = prefs.getStringList(key);
    if (stringList != null) {
      return stringList.map((e) => jsonDecode(e)).toList();
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Downloaded Data List'),
      ),
      body: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          print('download data length ${dataList.length}');
          var item = dataList[index];
          return ListTile(
            title: Text(
              item.toString(),
              style: TextStyle(color: Colors.black),
            ),
          );
        },
      ),
    );
  }
}

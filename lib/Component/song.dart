import 'package:doob/Component/PlaylistMoreDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SongPlayScreen extends StatefulWidget {
  const SongPlayScreen({super.key});

  @override
  State<SongPlayScreen> createState() => _SongPlayScreenState();
}

class _SongPlayScreenState extends State<SongPlayScreen> {
  String dropdownvalue = "Private";
  String selectedSnack = 'None Selected';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PLAYING FROM PLAYLISTS',
                        style: TextStyle(
                            color: Color(0xff8A9A9D),
                            fontFamily: "Century",
                            fontSize: 12),
                      ),
                      Container(
                        height: 30,
                        // padding: EdgeInsets.symmetric(horizontal: 8),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            //iconDisabledColor: Color(0xffffff9800),
                            // iconEnabledColor: Color(0xffffff9800),
                            dropdownColor: Colors.black,
                            value: dropdownvalue,
                            onChanged: (String? newvalue) {
                              setState(() {
                                dropdownvalue = newvalue!;
                              });
                            },
                            items: [
                              DropdownMenuItem<String>(
                                value: 'Private',
                                child: Text(
                                  'Lofi Loft',
                                  // style: TextStyle(color: Colors.white),
                                  style: TextStyle(color: Color(0xffffff9800)),
                                ),
                              ),
                              DropdownMenuItem<String>(
                                value: 'Public',
                                child: Text(
                                  'Lofi ',
                                  style: TextStyle(color: Color(0xffffff9800)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, '/search');
                      Get.off(PlaylistMoreDetails());
                    },
                    child: Icon(
                      Icons.more_vert,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

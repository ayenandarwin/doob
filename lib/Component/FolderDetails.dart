import 'package:flutter/material.dart';

class FolderDetails extends StatefulWidget {
  const FolderDetails({super.key});

  @override
  State<FolderDetails> createState() => _FolderDetailsState();
}

class _FolderDetailsState extends State<FolderDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Moods',
                        style: TextStyle(
                            fontFamily: 'Century',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              'Sort By',
                              style: TextStyle(
                                  fontFamily: 'Century,',
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  'Recently played',
                                  style: TextStyle(
                                      fontFamily: 'Century,',
                                      color: Color(0xffff9800),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.swap_vert,
                                  size: 18,
                                  color: Colors.white60,
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,'/equalizer'
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
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
                                    // color: Color(0xffff9800)
                                  ),

                                  // decoration: BoxDecoration(
                                  //     borderRadius: BorderRadius.circular(100),

                                  //     color: Color(0xffff9800)),
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

import 'package:flutter/material.dart';

class CreatePlayList extends StatefulWidget {
  const CreatePlayList({super.key});

  @override
  State<CreatePlayList> createState() => _CreatePlayListState();
}

class _CreatePlayListState extends State<CreatePlayList> {
  String dropdownvalue = "Private";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.white,
              Colors.grey,
              Colors.black,
            ])),
        child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Colors.black,
          //   centerTitle: true,
          //   iconTheme: IconThemeData(color: Colors.white),
          // ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height / 2.5,
                    ),
                    Center(
                      child: Text(
                        'New Playlist',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0XFF8A9A9D))),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0XFF8A9A9D))),
                          // fillColor: Colors.white,
                          hintText: 'Give your playlist title.',
                          hintStyle: TextStyle(color: Color(0XFF8A9A9D)),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Privacy',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 30,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffffff9800))),
                      child: 
                      DropdownButtonHideUnderline(
                        child:
                         DropdownButton(
                          iconDisabledColor: Color(0xffffff9800),
                          iconEnabledColor: Color(0xffffff9800),
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
                                'Private',
                                // style: TextStyle(color: Colors.white),
                                style: TextStyle(color: Color(0xffffff9800)),
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: 'Public',
                              child: Text(
                                'Public',
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white30
                                //color: Colors.transparent
                                ),
                            child: Center(
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xffffff9800),
                            ),
                            child: Center(
                              child: Text(
                                'Create',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

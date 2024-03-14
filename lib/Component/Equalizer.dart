import 'package:doob/Libcomponent/AlbumsTabs.dart';
import 'package:doob/Libcomponent/Artist.dart';
import 'package:doob/Libcomponent/Folder.dart';
import 'package:doob/Libcomponent/PodCast.dart';
import 'package:flutter/material.dart';

class Equalizers extends StatefulWidget {
  const Equalizers({super.key});

  @override
  State<Equalizers> createState() => _EqualizersState();
}

class _EqualizersState extends State<Equalizers> {
  Widget currenttabs = Foldertabs();
  int currenttabsID = 0;
  List tabs = [
    {
      "lable": "Custom",
      "Page": Foldertabs(),
      "id": 0,
    },
    {
      "lable": "Normal",
      "Page": AlbumsTabs(),
      "id": 1,
    },
    {
      "lable": "Pops",
      "Page": Artists(),
      "id": 2,
    },
    {
      "lable": "Classic",
      "Page": AlbumsTabs(),
      "id": 3,
    },
    {
      "lable": "Heavy",
      "Page": Podcast(),
      "id": 4,
    }
  ];
  @override
  Widget build(BuildContext context) {
    String dropdownvalue = "Private";
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          'Equalizer',
                          style: TextStyle(
                              fontFamily: 'Century',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xff8A9A9D),
                            ),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(5)),
                        height: 35,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
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
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.speaker,
                                        color: Color(
                                          0xffffff9800,
                                        ),
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        'BUIND-IN SPEAKER',
                                        // style: TextStyle(color: Colors.white),
                                        style: TextStyle(
                                            color: Color(
                                              0xffffff9800,
                                            ),
                                            fontSize: 12,
                                            fontFamily: "Century"),
                                      ),
                                    ],
                                  ),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'Public',
                                  child: Text(
                                    'Public',
                                    style:
                                        TextStyle(color: Color(0xffffff9800)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      'PRESETS',
                      style: TextStyle(
                        fontFamily: 'Century',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Color(0xff8A9A9D),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, bottom: 10, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: tabs.map((e) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                currenttabs = e['Page'];
                                currenttabsID = e['id'];
                              });
                            },
                            child: Libtab(
                              LableTabs: e['lable'],
                              selected: currenttabsID == e['id'],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  //
                  //   currenttabs,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 30),
                    child: Image.asset('lib/Image/sliders.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: Image.asset('lib/Image/3d.png'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Libtab extends StatelessWidget {
  const Libtab({
    super.key,
    required this.LableTabs,
    required this.selected,
  });

  final LableTabs;
  final selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 25,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        color: selected ? Color(0xffff9800) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        // borderRadius: BorderRadius.only(
        //     topRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Text(
            LableTabs,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

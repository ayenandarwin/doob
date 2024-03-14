import 'package:flutter/material.dart';

class QueueScreen extends StatefulWidget {
  const QueueScreen({super.key});

  @override
  State<QueueScreen> createState() => _QueueScreenState();
}

class _QueueScreenState extends State<QueueScreen> {
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
            padding: EdgeInsets.all(16.0),
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
                Text(
                  'now playing :',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Century",
                      fontSize: 16),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'lib/Image/manic.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'grainy days',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Century",
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          Text(
                            'Joji',
                            style: TextStyle(
                                color: Color(0xff8A9A9D),
                                fontFamily: "Century",
                                // fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'next in queue :',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Century",
                          fontSize: 16),
                    ),
                    Container(
                      height: 25,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffffff9800)),
                        borderRadius: BorderRadius.circular(20),
                        // color: Colors.white30,
                        // color: Color(0xffffff9800),
                        //color: Colors.transparent
                      ),
                      child: Center(
                        child: Text(
                          'CLEAR QUEUE',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xffffff9800),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  //width: 350,
                  child: RadioMenuButton(
                    value: 'Beguille',
                    groupValue: selectedSnack,
                    onChanged: (selectedValue) {
                      setState(() {
                        selectedSnack = selectedValue!;
                      });
                    },
                    style: ButtonStyle(
                        // elevation: MaterialStatePropertyAll(2),
                        // backgroundColor:
                        //     MaterialStatePropertyAll(Colors.white12)
                        ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Beguille',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Century",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                'NIKI',
                                style: TextStyle(
                                    color: Color(0xff8A9A9D),
                                    fontFamily: "Century",
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: size.width / 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Icon(
                              Icons.menu,
                              size: 20,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                RadioCard(),
                RadioCard(),

                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    'next in Lofi Loft :',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Century",
                        fontSize: 16),
                  ),
                ),
                RadioCard(),
                RadioCard(),
                RadioCard(),
                RadioCard(),
                RadioCard(),
                RadioCard(),

                // Row(
                //   children: [
                //     Container(
                //       height: 50,
                //       width: 50,
                //       child: ClipRRect(
                //         borderRadius: BorderRadius.circular(8),
                //         child: Image.asset(
                //           'lib/Image/joji.png',
                //           fit: BoxFit.cover,
                //         ),
                //       ),
                //     ),
                //     SizedBox(
                //       width: 20,
                //     ),
                //     Expanded(
                //       flex: 4,
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             'grainy days',
                //             style: TextStyle(
                //                 color: Colors.white,
                //                 fontFamily: "Century",
                //                 fontWeight: FontWeight.bold,
                //                 fontSize: 14),
                //           ),
                //           Text(
                //             'Joji',
                //             style: TextStyle(
                //                 color: Color(0xff8A9A9D),
                //                 fontFamily: "Century",
                //                 // fontWeight: FontWeight.bold,
                //                 fontSize: 12),
                //           ),
                //         ],
                //       ),
                //     ),
                //     InkWell(
                //       onTap: () {
                //         //Navigator.pushNamed(context, 'favoriteDetails');
                //       },
                //       child: Icon(
                //         Icons.more_vert,
                //         color: Colors.white,
                //         size: 20,
                //       ),
                //     ),
                //     SizedBox(
                //       width: 10,
                //     )
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RadioCard extends StatefulWidget {
  const RadioCard({super.key});

  @override
  State<RadioCard> createState() => _RadioCardState();
}

class _RadioCardState extends State<RadioCard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String selectedSnack = 'None Selected';
    return Padding(
      padding: EdgeInsets.only(top: 10),
      //width: 350,
      child: RadioMenuButton(
        value: 'Beguille',
        groupValue: selectedSnack,
        onChanged: (selectedValue) {
          setState(() {
            selectedSnack = selectedValue!;
          });
        },
        style: ButtonStyle(
            // elevation: MaterialStatePropertyAll(2),
            // backgroundColor: MaterialStatePropertyAll(Colors.white12)
            ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Stardust',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Century",
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    'Nyx',
                    style: TextStyle(
                        color: Color(0xff8A9A9D),
                        fontFamily: "Century",
                        // fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ],
              ),
              SizedBox(
                width: size.width / 2,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Icon(
                  Icons.menu,
                  size: 20,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

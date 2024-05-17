import 'package:doob/MusicPlayer/MusicPlayer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../MusicPlayer/MusicPlayerNew.dart';

class MusicFolder extends StatefulWidget {
  const MusicFolder({super.key});

  @override
  State<MusicFolder> createState() => _MusicFolderState();
}

class _MusicFolderState extends State<MusicFolder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.grey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 16,
                // right: 10, left: 10,
                bottom: 20),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmartCard(),
                      SizedBox(
                        width: 8,
                      ),
                      SmartCard()
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmartCard(),
                      SizedBox(
                        width: 8,
                      ),
                      SmartCard()
                    ],
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // GestureDetector(
                  //     onTap: () {
                  //       Get.to(() => MusicPlayer());
                  //       // Navigator.of(context).pushNamed('/folderdetails');
                  //     },
                  //     child: FloderCard()),
                  // SizedBox(
                  //   height: 16,
                  // ),
                  // FloderCard(),
                  // SizedBox(
                  //   height: 16,
                  // ),
                  // FloderCard(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FloderCard extends StatelessWidget {
  const FloderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: MediaQuery.of(context).size.width * 0.4,
      // decoration: BoxDecoration(
      //   // color: Colors.grey.withOpacity(0.4),
      //   color: Color.fromARGB(255, 194, 211, 226),
      //   borderRadius: const BorderRadius.all(
      //     Radius.circular(10),
      //   ),
      // ),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'lib/Image/joji.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Beautiful, You Are',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: false,
                style: TextStyle(
                    fontFamily: "Century",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 14),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Ruby Amanfu',
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: TextStyle(
                    fontFamily: "Century",
                    // fontWeight: FontWeight.bold,
                    color: Color(0xff8A9A9D),
                    fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SmartCard extends StatelessWidget {
  const SmartCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => MusicPlayerNew());
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.46,
        // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          // color: Colors.grey.withOpacity(0.4),
          color: Colors.white.withOpacity(0.15),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'lib/Image/joji.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Beautiful, You Are',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                        fontFamily: "Century",
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 14),
                  ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  Text(
                    'Ruby Amanfu',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                        fontFamily: "Century",
                        // fontWeight: FontWeight.bold,
                        color: Color(0xff8A9A9D),
                        fontSize: 12),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

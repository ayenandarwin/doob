import 'package:doob/Component/Equalizer.dart';
import 'package:flutter/material.dart';

import '../../../../Component/MusicFolder.dart';
import '../../../../Component/Podcast&show.dart';

class MusicAndPodcastShow extends StatefulWidget {
  const MusicAndPodcastShow({super.key});

  @override
  State<MusicAndPodcastShow> createState() => _MusicAndPodcastShowState();
}

class _MusicAndPodcastShowState extends State<MusicAndPodcastShow> {
  Widget currenttabs = MusicFolder();
  int currenttabsID = 0;
  List tabs = [
    {
      "lable": "Music",
      "Page": MusicFolder(),
      "id": 0,
    },
    {
      "lable": "PodCast & Shows",
      "Page": PodcastAndShow(),
      "id": 1,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 0),
              child: Row(
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
        ),
        currenttabs
      ],
    );
  }
}

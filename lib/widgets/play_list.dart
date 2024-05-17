import 'package:flutter/material.dart';

class PlayList extends StatelessWidget {
  const PlayList({super.key, required this.lableText, required this.widget});
  final String? lableText;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 5),
          child: Text(
            lableText ?? "",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "Century",
                color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 4, top: 4, bottom: 4),
          child: Container(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: widget,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

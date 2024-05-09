import 'package:flutter/material.dart';

class PageViewTextButton extends StatefulWidget {
  const PageViewTextButton({super.key, required this.controller});

  final PageController controller;

  @override
  State<PageViewTextButton> createState() => _PageViewTextButtonState();
}

class _PageViewTextButtonState extends State<PageViewTextButton> {
  List<String> labelList = ["Music", "Video", "For You", "Follow"];
  int isTap = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: labelList.length,
      itemBuilder: (context, index) {
        return TextButton(
          child: Text(
            labelList[index],
            style: TextStyle(fontFamily: 'Century', color: isTap == index ? Color(0xffff9800) : Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          onPressed: () {
            widget.controller.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.linear);
            setState(() {
              isTap = index;
            });
          },
        );
      },
    );
  }
}

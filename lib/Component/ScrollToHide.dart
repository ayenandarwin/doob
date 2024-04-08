import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScrollToHideWidget extends StatefulWidget {
  final Widget child;
  final ScrollController controller;
  final Duration duration;

  const ScrollToHideWidget(
      {super.key,
      required this.child,
      required this.controller,
      this.duration = const Duration(milliseconds: 200)});

  @override
  State<ScrollToHideWidget> createState() => _ScrollToHideWidgetState();
}

class _ScrollToHideWidgetState extends State<ScrollToHideWidget> {
  bool isVisible = true;
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(listen);

    setState(() {
      // Global.loginStatus();
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(listen);
    super.dispose();
  }

  void listen() {
    setState(() {});
    // final direction = widget.controller.position.userScrollDirection;
    // if (direction == ScrollDirection.forward) {
    //   show();
    // } else if (direction == ScrollDirection.reverse) {
    //   hide();
    // }

    if (widget.controller.position.pixels >= 200) {
      hide();
    } else {
      show();
    }
  }

  void show() {
    setState(() {});
    if (!isVisible) setState(() => isVisible = true);
  }

  void hide() {
    setState(() {});
    if (isVisible) setState(() => isVisible = false);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.duration,
      height: isVisible ? kBottomNavigationBarHeight : 0,
      child: Wrap(
        children: [
          widget.child,
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  const Option(
      {super.key,
      required this.label,
      required this.onTap,
      required this.iconWidget});
  final String label;
  final Function()? onTap;
  final Widget iconWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      //padding: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.symmetric(vertical: 5),

      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: iconWidget,
          ),
          Text(
            label,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}

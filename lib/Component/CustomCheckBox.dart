import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox(
      {super.key, required this.isCheck, required this.onchange});

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();

  final bool isCheck;
  final Function onchange;
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  void _toggleCheckbox() {
    widget.onchange();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleCheckbox,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5),
          color: widget.isCheck ? Colors.white : Colors.transparent,
        ),
        child: widget.isCheck
            ? Icon(
                Icons.check,
                size: 10,
                color: Colors.black,
              )
            : null,
      ),
    );
  }
}

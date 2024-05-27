import 'package:flutter/material.dart';

class HomeNotiBar extends StatelessWidget {
  const HomeNotiBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Row(
                children: [
                  Container(
                      child: Image.asset(
                    'assets/Image/DOOB.png',
                    width: 60,
                  )),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/Icons/bar.png',
                    width: 25,
                    height: 25,
                  ),
                  Icon(
                    Icons.notifications,
                    size: 25,
                    color: Colors.white,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/setting');
                    },
                    child: Icon(
                      Icons.settings,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

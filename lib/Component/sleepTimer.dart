import 'package:flutter/material.dart';

class SleepTimer extends StatelessWidget {
  const SleepTimer({super.key});

  @override
  Widget build(BuildContext context) {
    var hSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.white,
            Colors.grey,
            Colors.black,
          ])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: hSize.height / 2,
                  ),
                  Center(
                    child: Text(
                      'Stop audio in',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Century",
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 50, horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'End of Track',
                          style: TextStyle(
                              fontFamily: "Century",
                              //fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 14),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '60 seconds',
                          style: TextStyle(
                              fontFamily: "Century",
                              //fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 14),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '5 minutes',
                          style: TextStyle(
                              fontFamily: "Century",
                              //fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 14),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '10 minutes',
                          style: TextStyle(
                              fontFamily: "Century",
                              //fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 14),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '15 minutes',
                          style: TextStyle(
                              fontFamily: "Century",
                              //fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 14),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '30 minutes',
                          style: TextStyle(
                              fontFamily: "Century",
                              //fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 14),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '1 hour',
                          style: TextStyle(
                              fontFamily: "Century",
                              //fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

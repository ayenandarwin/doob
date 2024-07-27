import 'package:doob/Component/MusicFolder.dart';
import 'package:doob/Pages/premium/bronze.dart';
import 'package:doob/Pages/premium/family.dart';
import 'package:doob/Pages/premium/gold.dart';
import 'package:doob/Pages/premium/silver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Premium extends StatefulWidget {
  const Premium({super.key});

  @override
  State<Premium> createState() => _PremiumState();
}

class _PremiumState extends State<Premium> {
  Widget currenttabs = Container();

  int currenttabsID = 0;
  List tabs = [
    {
      "lable": "Subscription",
      "Page": Container(),
      "id": 0,
    },
    {
      "lable": "one-time",
      "Page": Container(),
      "id": 1,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 27,
                  ),
                  Container(
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
                              lableTabs: e['lable'],
                              selected: currenttabsID == e['id'],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => BronzeScreen());
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 100,
                  decoration: BoxDecoration(
                      color: Color(0xff6B4706),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              child: Text(
                                '1 Month Bronze\nSubscription',
                                style: TextStyle(
                                    fontFamily: 'Century',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 14),
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '\$3.00',
                              style: TextStyle(
                                  fontFamily: 'Century',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 14),
                            ),
                            Text(
                              'every month',
                              style: TextStyle(
                                  fontFamily: 'Century',
                                  color: Colors.white,
                                  fontSize: 10),
                            ),
                            Text(
                              'Cancel anytime in settings',
                              style: TextStyle(
                                  fontFamily: 'Century',
                                  color: Colors.white,
                                  fontSize: 10),
                            )
                          ],
                        )
                      ]),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => SilverScreen());
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  // padding: EdgeInsets.symmetric(horizontal: 8),
                  height: 100,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0xff8A9A9D),
                        Colors.grey,
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              child: Text(
                                '3 Months Sliver\nSubscription',
                                style: TextStyle(
                                    fontFamily: 'Century',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 14),
                              ),
                            ),
                            Container(
                              height: 20,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Center(
                                child: Text(
                                  'POPULAR',
                                  style: TextStyle(
                                      fontFamily: 'Century',
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black45),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '\$8.00',
                              style: TextStyle(
                                  fontFamily: 'Century',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 14),
                            ),
                            Text(
                              'Cancel anytime in settings',
                              style: TextStyle(
                                  fontFamily: 'Century',
                                  color: Colors.white,
                                  fontSize: 10),
                            )
                          ],
                        )
                      ]),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => GoldScreen());
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  // padding: EdgeInsets.symmetric(horizontal: 8),
                  height: 100,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0xffA3BD00),
                        Color(0xffC9940D),
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              child: Text(
                                '6 Months Gold\nSubscription',
                                style: TextStyle(
                                    fontFamily: 'Century',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 14),
                              ),
                            ),
                            Container(
                              height: 20,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Center(
                                child: Text(
                                  'POPULAR',
                                  style: TextStyle(
                                    fontFamily: 'Century',
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffC9940D),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '\$15.00',
                              style: TextStyle(
                                  fontFamily: 'Century',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 14),
                            ),
                            Text(
                              'Cancel anytime in settings',
                              style: TextStyle(
                                  fontFamily: 'Century',
                                  color: Colors.white,
                                  fontSize: 10),
                            )
                          ],
                        )
                      ]),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => FamilyScreen());
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  // padding: EdgeInsets.symmetric(horizontal: 8),
                  height: 100,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0xff3D5DA7),
                        Colors.white30,
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              child: Text(
                                '6 Months Family\nSubscription',
                                style: TextStyle(
                                    fontFamily: 'Century',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 14),
                              ),
                            ),
                            Container(
                              height: 20,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Center(
                                child: Text(
                                  'POPULAR',
                                  style: TextStyle(
                                    fontFamily: 'Century',
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '\$40.00',
                              style: TextStyle(
                                  fontFamily: 'Century',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 14),
                            ),
                            Text(
                              'Cancel anytime in settings',
                              style: TextStyle(
                                  fontFamily: 'Century',
                                  color: Colors.white,
                                  fontSize: 10),
                            )
                          ],
                        )
                      ]),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.redAccent,
                    //  Colors.purpleAccent,
                    Color(0xff3D5DA7),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Continue',
                    style: TextStyle(
                        fontFamily: 'Century',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'By Submitting Payment you agree to the purchae',
                style: TextStyle(
                    fontFamily: 'Century', fontSize: 12, color: Colors.white60),
              ),
              Text(
                'Terms & Conditions',
                style: TextStyle(
                  fontFamily: 'Century',
                  fontSize: 12,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
              // SvgPicture.asset(
              //   'assets/Icons/pay.svg',
              //   height: 40,
              // ),
              // Text(
              //   'Premium',
              //   style: TextStyle(
              //       fontFamily: 'Century',
              //       color: Color(0xffff9800),
              //       fontSize: 20,
              //       fontWeight: FontWeight.bold),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class Libtab extends StatelessWidget {
  const Libtab({
    super.key,
    required this.lableTabs,
    required this.selected,
  });

  final lableTabs;
  final selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: 130,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        color: selected ? Color(0xffff9800) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        // borderRadius: BorderRadius.only(
        //     topRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Text(
            lableTabs,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

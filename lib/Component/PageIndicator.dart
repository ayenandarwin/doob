import 'package:doob/Component/errorScreen.dart';
import 'package:doob/services/sliderServiceProvier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicator extends StatefulWidget {
  @override
  _PageIndicatorState createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: SizedBox(
                width: double.infinity,
                child:
                    ref.watch(sliderServiceProvider).when(data: (sliderList) {
                  return PageView.builder(
                      controller: _pageController,
                      itemCount: sliderList!.data!.length,
                      itemBuilder: (context, index) {
                        return sliderList.data![index] != null
                            ? Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),

                                      child: Image.network(
                                        sliderList.data![index].photo!,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.21,

                                        errorBuilder: (BuildContext context,
                                            Object exception,
                                            StackTrace? stackTrace) {
                                          // This function is called when the image fails to load
                                          // Return a new widget to display a dummy image from the internet
                                          return Image.network(
                                            'https://i.ebayimg.com/images/g/QQAAAOSwk-JiEK3v/s-l1600.jpg',
                                          );
                                        },
                                        // 'assets/Image/joji.png',
                                        fit: BoxFit.cover,
                                      ),

                                      // Image.asset(
                                      //   'assets/Image/epikpost.png',
                                      //   fit: BoxFit.cover,
                                      // ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16.0,
                                  ),
                                  SmoothPageIndicator(
                                    controller: _pageController,
                                    count: sliderList.data!.length,
                                    axisDirection: Axis.horizontal,
                                    onDotClicked: (index) {
                                      _pageController.animateToPage(index,
                                          duration: Duration(microseconds: 500),
                                          curve: Curves.ease);
                                    },
                                    effect: WormEffect(
                                        activeDotColor: Color(0xffff9800),
                                        dotColor: Colors.white.withOpacity(0.4),
                                        dotHeight: 4,
                                        dotWidth: 4),
                                  ),
                                ],
                              )
                            : Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: PageView(
                                        controller: _pageController,
                                        onPageChanged: (int page) {
                                          setState(() {
                                            _currentPage = page;
                                          });
                                        },
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.asset(
                                                'assets/Image/epikpost.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.asset(
                                                'assets/Image/shukhin.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.asset(
                                                'assets/Image/epikpost.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16.0,
                                  ),
                                  SmoothPageIndicator(
                                    controller: _pageController,
                                    count: 3,
                                    axisDirection: Axis.horizontal,
                                    effect: WormEffect(
                                        activeDotColor: Color(0xffff9800),
                                        dotColor: Colors.white.withOpacity(0.4),
                                        dotHeight: 4,
                                        dotWidth: 4),
                                  ),
                                ],
                              );
                      });
                }, error: (Object error, StackTrace stackTrace) {
                  return ErrorScreen(
                    aspectR: 1,
                    iconSize: 100,
                    textSize: 18,
                    profile: false,
                  );
                }, loading: () {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
              ),
            ),
          ],
        );
      },
      // child:
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   mainAxisSize: MainAxisSize.min,
      //   children: [
      //     AspectRatio(
      //       aspectRatio: 16 / 9,
      //       child: SizedBox(
      //         width: double.infinity,
      //         child: PageView(
      //           controller: _pageController,
      //           onPageChanged: (int page) {
      //             setState(() {
      //               _currentPage = page;
      //             });
      //           },
      //           children: [
      //             Padding(
      //               padding: const EdgeInsets.symmetric(horizontal: 5),
      //               child: ClipRRect(
      //                 borderRadius: BorderRadius.circular(10),
      //                 child: Image.asset(
      //                   'assets/Image/epikpost.png',
      //                   fit: BoxFit.cover,
      //                 ),
      //               ),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.symmetric(horizontal: 5),
      //               child: ClipRRect(
      //                 borderRadius: BorderRadius.circular(10),
      //                 child: Image.asset(
      //                   'assets/Image/shukhin.jpg',
      //                   fit: BoxFit.cover,
      //                 ),
      //               ),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.symmetric(horizontal: 5),
      //               child: ClipRRect(
      //                 borderRadius: BorderRadius.circular(10),
      //                 child: Image.asset(
      //                   'assets/Image/epikpost.png',
      //                   fit: BoxFit.cover,
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //     SizedBox(
      //       height: 16.0,
      //     ),
      //     SmoothPageIndicator(
      //       controller: _pageController,
      //       count: 3,
      //       axisDirection: Axis.horizontal,
      //       effect: WormEffect(
      //           activeDotColor: Color(0xffff9800),
      //           dotColor: Colors.white.withOpacity(0.4),
      //           dotHeight: 4,
      //           dotWidth: 4),
      //     ),
      //   ],
      // ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

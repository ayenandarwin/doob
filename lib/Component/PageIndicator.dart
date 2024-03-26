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
                      itemCount: sliderList!.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              sliderList.data![index].photo!,
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                // This function is called when the image fails to load
                                // Return a new widget to display a dummy image from the internet
                                return Image.network(
                                  'https://i.ebayimg.com/images/g/QQAAAOSwk-JiEK3v/s-l1600.jpg',
                                  // 'https://media.istockphoto.com/photos/music-picture-id535427404?k=6&m=535427404&s=612x612&w=0&h=en1c7qslpGsVRkrTUHPvBNmA61gPUXl_v8ABMgQoZPY=',
                                );
                              },
                              // 'lib/Image/joji.png',
                              fit: BoxFit.cover,
                            ),

                            // Image.asset(
                            //   'lib/Image/epikpost.png',
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                        );
                      });
                }, error: (Object error, StackTrace stackTrace) {
                  return Text('$error');
                }, loading: () {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),

                /* PageView(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: [
                    // ref.watch(sliderServiceProvider).when(data: (albumList) {
                    //   return Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: 5),
                    //     child: ClipRRect(
                    //       borderRadius: BorderRadius.circular(10),
                    //       //  (requestList.data!.indexOf(
                    //       //                                     request) +
                    //       //                                 1)

                    //       child:
                    //           //Image.network(albumList!.data![0].photo!),
                    //           Image.asset(
                    //         'lib/Image/epikpost.png',
                    //         fit: BoxFit.cover,
                    //       ),
                    //     ),
                    //   );
                    // }, error: (Object error, StackTrace stackTrace) {
                    //   return Text('$error');
                    // }, loading: () {
                    //   return Center(
                    //     child: CircularProgressIndicator(),
                    //   );
                    // }),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'lib/Image/epikpost.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'lib/Image/shukhin.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'lib/Image/epikpost.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),*/
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
      },
      // child: Column(
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
      //                   'lib/Image/epikpost.png',
      //                   fit: BoxFit.cover,
      //                 ),
      //               ),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.symmetric(horizontal: 5),
      //               child: ClipRRect(
      //                 borderRadius: BorderRadius.circular(10),
      //                 child: Image.asset(
      //                   'lib/Image/shukhin.jpg',
      //                   fit: BoxFit.cover,
      //                 ),
      //               ),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.symmetric(horizontal: 5),
      //               child: ClipRRect(
      //                 borderRadius: BorderRadius.circular(10),
      //                 child: Image.asset(
      //                   'lib/Image/epikpost.png',
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

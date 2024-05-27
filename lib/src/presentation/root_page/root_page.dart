// import 'package:doob/src/presentation/bottom_nav_bar/feed_nav/feed_nav_screen.dart';
// import 'package:doob/src/presentation/bottom_nav_bar/home_nav/home_nav_screen.dart';
// import 'package:doob/src/presentation/bottom_nav_bar/library_nav/library_nav_screen.dart';
// import 'package:doob/src/presentation/bottom_nav_bar/premium_nav/premium_nav_screen.dart';
// import 'package:doob/src/presentation/bottom_nav_bar/search_nav/search_nav_screen.dart';
// import 'package:doob/src/util/styles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../providers/bottom_nav_bar_tap_change.dart';

// class RootPage extends ConsumerStatefulWidget {
//   const RootPage({super.key});

//   @override
//   ConsumerState<RootPage> createState() => _RootPageState();
// }

// class _RootPageState extends ConsumerState<RootPage> {
//   int _tabIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IndexedStack(
//         index: _tabIndex,
//         children: const [
//           HomeNavScreen(),
//           SearchNavScreen(),
//           FeedNavScreen(),
//           LibraryNavScreen(),
//           PremiumNavScreen(),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.black,
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: Color(0xffff9800),
//         unselectedItemColor: Colors.white,
//         currentIndex: _tabIndex,
//         unselectedLabelStyle: Styles.unselectedLabelStyle,
//         selectedLabelStyle: Styles.selectedLabelStyle,
//         onTap: (index) {
//           ref.read(bottomTapChangeProvider.notifier).onTapChange(index);
//           print("##### Tap : $index");
//           setState(() {
//             _tabIndex = index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/Icons/home.png')), label: "Home"),
//           BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/Icons/search.png')), label: "Search"),
//           BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/Image/list.png')), label: "Feed"),
//           BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/Icons/folder.png')), label: "Library"),
//           BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/Icons/feed1.png')), label: "Premium"),
//         ],
//       ),
//     );
//   }
// }

import 'package:doob/Component/PageProvider.dart';
import 'package:doob/MusicPlayer/MusicPlayer.dart';
import 'package:doob/MusicPlayer/MusicPlayerNew.dart';
import 'package:doob/Pages/Explore.dart';
import 'package:doob/Pages/Home.dart';
import 'package:doob/Pages/Library.dart';
import 'package:doob/Pages/premium/Premium.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Empty extends StatefulWidget {
  const Empty({super.key});

  @override
  State<Empty> createState() => _EmptyState();
}

class _EmptyState extends State<Empty> with SingleTickerProviderStateMixin {
  TabController? tcon;

  Widget currentPage = const Home();
  int currentIndex = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        tcon = TabController(length: 3, vsync: this);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<PageProvider>(context);
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.black,
        body: currentPage,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black.withOpacity(0.7),
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white,
          selectedItemColor: Color(0xffff9800),
          iconSize: 24,
          currentIndex: currentIndex,
          onTap: (index) {
            switch (index) {
              case 0:
                {
                  setState(() {
                    currentPage = const Home();
                    currentIndex = index;
                  });
                }
                break;
              case 1:
                {
                  setState(() {
                    currentPage = const Explore();
                    currentIndex = index;
                  });
                }
                break;
              case 2:
                {
                  setState(() {
                    currentPage =  MusicPlayerNew();
                    currentIndex = index;
                  });
                }
                break;
              case 3:
                {
                  setState(() {
                    currentPage = const Library();
                    currentIndex = index;
                  });
                }
                break;
              case 4:
                {
                  setState(() {
                    currentPage = const Premium();
                    currentIndex = index;
                  });
                }
                break;
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
              ),
              label: AppLocalizations.of(context)!.home,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: AppLocalizations.of(context)!.search,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.play_circle_outline,
              ),
              label: AppLocalizations.of(context)!.feed,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.folder_outlined,
              ),
              label: AppLocalizations.of(context)!.library,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/Icons/pay.svg', height: 24),
              activeIcon: SvgPicture.asset(
                'assets/Icons/pay.svg',
                height: 24,
              ),
              label: AppLocalizations.of(context)!.premium,
            ),
          ],
        ),
      ),
    );
  }
}

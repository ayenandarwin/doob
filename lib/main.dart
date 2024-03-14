import 'dart:collection';

import 'package:doob/Component/AddToPlaylist.dart';
import 'package:doob/Component/Empty.dart';
import 'package:doob/Component/Equalizer.dart';
import 'package:doob/Component/PlaylistMoreDetails.dart';
import 'package:doob/Component/FolderDetails.dart';
import 'package:doob/Component/PageIndicator.dart';
import 'package:doob/Component/PageProvider.dart';
import 'package:doob/Component/PlaylistDetails.dart';
import 'package:doob/Component/Queue.dart';
import 'package:doob/Component/TopGenres.dart';
import 'package:doob/Component/sleepTimer.dart';
import 'package:doob/MusicPlayer/MusicPlayer.dart';
import 'package:doob/Pages/CreatePlayList.dart';
import 'package:doob/Pages/Explore.dart';
import 'package:doob/Pages/Home.dart';
import 'package:doob/Pages/Languages.dart';
import 'package:doob/Pages/Library.dart';
import 'package:doob/Pages/Login.dart';
import 'package:doob/Pages/MainSearch.dart';
import 'package:doob/Pages/Search.dart';
import 'package:doob/Pages/Setting.dart';
import 'package:doob/Pages/SignUp.dart';
import 'package:doob/Pages/SocialLogin.dart';
import 'package:doob/l10n/l10n.dart';
import 'package:doob/provider/locale.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('Language');
  if (Hive.box("Language").get('lang') == null) {
    Hive.box("Language").put('lang', 'en');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LocaleProvider(),
        ),
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorSchemeSeed: Color(0xffFF9800),
            useMaterial3: true,
            splashFactory: NoSplash.splashFactory,
          ),
          supportedLocales: L10n.all,
          locale: Provider.of<LocaleProvider>(context).locale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          initialRoute: "/empty",
          routes: {
            "/empty": (context) => const Empty(),
            "/explore": (context) => const Explore(),
            "/library": (context) => const Library(),
            "/home": (context) => const Home(),
            "/search": (context) => const Search(),
            "/folderdetails": (context) => const FolderDetails(),
            "/musicplayer": (context) => const MusicPlayer(),
            "/mainsearch": (context) => const MainSearch(),
            "/setting": (context) => const Setting(),
            "/lang": (context) => const Language(),
            "/createnewplaylist": (context) => const CreatePlayList(),
            "/topgenres": (context) => const TopGenres(),
            "/playlistDetails": (context) => const PlaylistDetails(),
            "/playlistMoreDetails": (context) => const PlaylistMoreDetails(),
            "/sleepTimer": (context) => const SleepTimer(),
            "/addToPlaylist": (context) => const AddToPlaylist(),
            "/queue": (context) => const QueueScreen(),
            "/equalizer": (context) => const Equalizers(),
          },
        );
      },
    );
  }
}

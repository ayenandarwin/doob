import 'package:country_flags/country_flags.dart';
import 'package:doob/provider/locale.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            iconTheme: IconThemeData(color: Colors.white),
            title: Text(
              'Languages',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Provider.of<LocaleProvider>(context, listen: false)
                          .setLocale(Locale('en'));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 70,
                      child: Row(
                        children: [
                          CountryFlag.fromCountryCode(
                            'GB',
                            height: 60,
                            width: 50,
                            borderRadius: 10,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            AppLocalizations.of(context)!.english,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Provider.of<LocaleProvider>(context, listen: false)
                          .setLocale(Locale('my'));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 70,
                      child: Row(
                        children: [
                          CountryFlag.fromCountryCode(
                            'MM',
                            height: 60,
                            width: 50,
                            borderRadius: 10,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            AppLocalizations.of(context)!.myanmar,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

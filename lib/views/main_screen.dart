import 'package:flutter/material.dart';
import 'package:al_quran/views/mobileViews/list_surah_mobile.dart';
import 'package:al_quran/views/webViews/list_surah_web.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 1200) {
          return const ListSurahMobile();
        } else if (constraints.maxWidth <= 1400) {
          return const ListSurahWeb(
            gridCount: 2,
            
          );
        } else {
          return const ListSurahWeb(gridCount: 3);
        }
      },
    );
  }
}

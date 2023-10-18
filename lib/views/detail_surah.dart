import 'package:al_quran/models/list_surah.dart';
import 'package:al_quran/views/mobileViews/detail_surah_mobile.dart';
import 'package:al_quran/views/webViews/detail_surah.web.dart';
import 'package:flutter/material.dart';

class DetailSurah extends StatelessWidget {
  final ListSurah surah;
  const DetailSurah({Key? key, required this.surah}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth <= 1200) {
        return DetailSurahMobile(surah: surah);      
      } else {
        return DetailSurahWeb(surah: surah);
      }
    });
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/list_surah.dart';

class GetListSurah {
  static Future<List<ListSurah>> fetchSurahData() async {
    final response = await http.get(Uri.parse('https://api.quran.gading.dev/surah'));

    if (response.statusCode == 200) {
      List<dynamic> surahData = jsonDecode(response.body)['data'];
      List<ListSurah> surahList = surahData.map((data) => ListSurah.fromJson(data)).toList();      
      return surahList;
    } else {
      throw Exception('Failed to load data');
    }
  }
}


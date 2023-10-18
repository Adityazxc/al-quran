import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:al_quran/models/surah.dart' as detail;

class SurahDetail{
  static Future<detail.Surah> getDetailSurah(String id) async {
    final response = await http.get(Uri.parse('https://api.quran.gading.dev/surah/$id'));

    if (response.statusCode == 200) {
      // Map<String,dynamic> data= (jsonDecode(response.body)as Map<String, dynamic>)["data"];
      
      // print(data);
      return detail.Surah.fromJson(jsonDecode(response.body));


    } else {
      throw Exception('Failed to load data');
    }
  }
}
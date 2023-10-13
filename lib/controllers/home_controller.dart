// import 'package:get/get.dart';
// // import 'package:al_quran/models/list_surah.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class HomeController extends GetxController{
//   getAllSurah()async{
//     Uri url=Uri.parse("https://api.quran.gading.dev/surah");
//   var res=await http.get(url);

//   List data=(json.decode(res.body) as Map<String, dynamic>)["data"];
//   // ListSurah surahAnnas=ListSurah.fromJson(data[113]);
//   print(data);
  
//   }
// }
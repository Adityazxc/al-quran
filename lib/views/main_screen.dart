import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:al_quran/models/list_surah.dart';

class getListSurah {
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



class MainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return   Scaffold(     
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Al Quran",
            style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.purple
          ),
        ),

        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.grey
            ),
          onPressed: (){}
        ),

        actions: <Widget>[
          IconButton(
            onPressed:(){}, 
            icon: const Icon(
              Icons.search, 
              color: Colors.grey
              )
          )
        ],
  
      ), 
      body:FutureBuilder(
        future:getListSurah.fetchSurahData(),
        builder: (context,snapshot) {          
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }if(snapshot.hasError){
            return Text("Error: ${snapshot.error}");
          }         
          return Padding( 
            padding: const EdgeInsets.all(15.0),
            child:Column(          
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                      "Assalmualaikum",
                      style:  TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey
                              ),
                    ),
                    const Text(
                      "Aditya Firmansyah",
                      style:  TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.purple
                              ),
                    ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
               child: Card(
                  color: Colors.purple.shade200,              
                  child:Padding(
                    padding: const EdgeInsets.all(20.0),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                          Text(
                            "Al Fatihah",
                            style:  TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white
                                    ),
                          ),
                          Text(
                            "Ayat 1",
                            style:  TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white
                                    ),
                          ),
                          ],
                        ),
                        Image.asset("images/quran.png")
                      ],
                  )
                 
                    )
                ),
                ),

                Expanded(
                  child: ListView.builder(  
                    itemCount: snapshot.data!.length,                    
                    itemBuilder: (context, index) {
                    ListSurah surah = snapshot.data![index];

                      return ListTile(
                        leading: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Image.asset('images/numbering.png',width: 46.0,height: 46.0),
                            // number surah
                            Text(
                              "${surah.number}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ],
                        ),

                        // Name Surah
                        title: Text(
                          surah.name.transliteration.id,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                          ),
                        ),

                        // Arabic
                        trailing: Text(
                          surah.name.short,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                          ),
                        ),

                        subtitle: Row(
                          children: [
                        // Relevation
                            Text(
                              surah.name.transliteration.id,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                              ),
                            ),

                           const SizedBox(width: 10.0),
                            // number of verses
                             Text(
                              "${surah.numberOfVerses}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                              ),
                            ),

                            const SizedBox(width: 5.0),
                             const Text(
                              "Ayat",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                              ),
                            ),

                        const Divider(
                              height: 15,
                              color: Colors.grey,
                              thickness: 1,
                        ),
                          ],
                        ),
                      );
                    }

                  )
                )
                ],
              )        

            
          );
          }
         
      )
    );
  }
}
import 'dart:convert';
import 'package:al_quran/views/detail_surah.dart';
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
            'Quran App',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF672CBC),
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              height: 0,
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
      body:Container(
        margin: const EdgeInsets.all(24.0),
        child: FutureBuilder(
          future:getListSurah.fetchSurahData(),
          builder: (context,snapshot) {          
            if(snapshot.connectionState==ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }if(snapshot.hasError){
              return Text("Error: ${snapshot.error}");
            }         
            return Column(          
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                        "Assalmualaikum",
                        style:  TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF8789A3),
                                fontFamily: 'Poppins',
                                ),
                      ),
                      const Text(
                        "Aditya Firmansyah",
                        style:  TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,                              
                                color: Color(0xFF230E4E),
                                fontFamily: 'Poppins',
                                ),
                      ),
                      const SizedBox(height: 24.0,),
                  Container(
                    decoration: ShapeDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.71, -0.71),
                        end: Alignment(-0.71, 0.71),
                        colors: [Color(0xFFDF98FA), Color(0xFF9055FF)],
                      ),
                      
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                             
                    child:Padding(
                      padding: const EdgeInsets.all(20.0),
                      child:  Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Row(
                              children: [
                                Image.asset("images/last_edit.png"),
                                const SizedBox(width: 10.0,),
                                const Text(
                                  'Last Read',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),

                              ],
                            ),
                                  
                            const SizedBox(
                              width: 89,
                              child: Text(
                                'Al-Fatiah',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                              ),
                            SizedBox(height: 10.0,),

                            const SizedBox(
                              width: 89,                              
                              child: Opacity(
                                opacity: 0.80,
                                child: Text(
                                  'Ayah No:1',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                              ),
                              ),

                           
                           
                            ],
                          ),
                          Image.asset("images/quran.png")
                        ],
                    )
                   
                      )
                  ),
                  
                  const SizedBox(height: 24.0,),
                  Expanded(
                    child: ListView.builder(  
                      itemCount: snapshot.data!.length,                    
                      itemBuilder: (context, index) {
                      ListSurah surah = snapshot.data![index];
      
                        return InkWell(
                          onTap: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context){
                              return DetailSurah();
                            }));                        
                          },
                          child: ListTile(
                            leading: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Image.asset('images/numbering.png',width: 46.0,height: 46.0),
                                // number surah
                                Text(
                                  "${surah.number}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                              ],
                            ),
                        
                            // Name Surah
                            title: Text(
                              surah.name.transliteration.id,
                              style: const TextStyle(
                                  color: Color(0xFF230E4E),
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                            ),
                        
                            // Arabic
                            trailing: Text(
                              surah.name.short,
                              style: TextStyle(
                                color: Color(0xFF863ED5),
                                fontSize: 20,
                                fontFamily: 'Amiri',
                                fontWeight: FontWeight.w700,
                                height: 0,
                                ),
                              ),                               
                        
                            subtitle: Container(
                              margin: const EdgeInsets.only(top:10),
                              child: Row(                              
                                children: [
                                 
                              // Relevation
                                  Text(
                                    surah.revelation.id,
                                    style: const TextStyle(
                                        color: Color(0xFF8789A3),
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                                    
                                 const SizedBox(width: 10.0),
                                  // number of verses
                                   Text(
                                    "${surah.numberOfVerses}",
                                    style: const TextStyle(
                                        color: Color(0xFF8789A3),
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                    ),
                                   
                                  ),
                                                    
                                  const SizedBox(width: 5.0),
                                   const Text(
                                    "Ayat",
                                    style: TextStyle(
                                        color: Color(0xFF8789A3),
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                    ),
                                   
                                  ),
                                                    
                              const Divider(
                                    height: 15,
                                    color: Colors.grey,
                                    thickness: 1,
                              ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
      
                    )
                  )
                  ],
                       
      
              
            );
            }
           
        ),
      )
    );
  }
}
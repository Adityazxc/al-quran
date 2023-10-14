import 'package:flutter/material.dart';


class DetailSurah extends StatelessWidget {
  DetailSurah({Key? key}) : super(key: key);
  final List<int> numberList=const <int>[1,2,3,4,5,6] ;
  int hexColor = int.parse('240F4F',radix: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Al-Fatiah",
            style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: 'Poppins',
            color: Color(0xff672CBC)
          ),
        ),

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey
            ),
          onPressed: (){
            Navigator.pop(context);
          }
        ),

        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: IconButton(
              onPressed:(){}, 
              icon:const Icon(
                Icons.search, 
                size: 24,
                color: Colors.grey
                )
            ),
          )
        ],
  
      ), 
      body: Container(
        margin: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Container(                                               
              decoration:  BoxDecoration(                
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                begin: Alignment(0.71, -0.71),
                end: Alignment(-0.71, 0.71),
                colors: [Color(0xFFDF98FA), Color(0xFF9055FF)],
                ),
              ),

              child: const Padding(
                padding: EdgeInsets.all(56.0),
                child: Column(
                  children: [
                     Text(
                      'Al-Fatiah',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
              
                    Text(
                      'The Opening',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),

                  const SizedBox(height: 16.0),
                   Divider(
                          height: 15,
                          color: Colors.white,
                          thickness: 1,                        
                        ),
                  const SizedBox(height: 16.0),
                  
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Mekah',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        SizedBox(width: 10),
                        Text(
                          '7',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Verses',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
              
                        SizedBox(width: 32),
                      ],
                    ),
                        Text(
                          'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                  ]
                        
                ),
              ),
              ),

            Expanded(
               child: ListView(
                children: numberList.map((number) {
                  return ListTile(                      
                  
                  subtitle: Column(            
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: ShapeDecoration(
                          color:Color(0x0C121931),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                            )
                          ),
                        child: Padding(
                          padding: EdgeInsets.all(13.0),                  
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,                
                            children: [
                              Container(
                                child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  const CircleAvatar(backgroundColor: Color(0xff863ED5)),
                                              // number surah
                                  Text(
                                    "$number",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w200,                              
                                      color: Colors.white
                                    ),
                                  ),
                                ],                      
                                          ),
                              ),
                              Image.asset("images/play.png"),
                            
                            ],
                          ),
                        ),
                      ),
                  
                      SizedBox(height: 24),
                     const Text(
                        "ﻦﻳِمَلٰعْلا ِّبَر ِهَّلِل ُدْمَحْلا",
                        textAlign: TextAlign.right,
                        style:  TextStyle(                  
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color:  Color(0xff240f4f),
                        ),
                      ),
                  
                      SizedBox(height: 16),
                      const Text(
                        "[All] praise is [due] to Allah, Lord of the worlds -",
                        style:  TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color:  Color(0xff240f4f),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const Divider(
                        height: 15,
                        color: Colors.grey,
                        thickness: 1,                        
                      ),
                  
                      const SizedBox(height: 16.0),
                    ],
                  ),
                  
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
    
  }
}
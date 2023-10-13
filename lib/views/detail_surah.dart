

import 'package:flutter/material.dart';

class DetailSurah extends StatelessWidget {
  const DetailSurah({super.key});

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
            fontWeight: FontWeight.bold,
            color: Colors.purple
          ),
        ),

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey
            ),
          onPressed: (){}
        ),

        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: IconButton(
              onPressed:(){}, 
              icon:  Icon(
                Icons.search, 
                size: 24,
                color: Colors.grey
                )
            ),
          )
        ],
  
      ), 
      body: Padding(
        padding: const EdgeInsets.all(15.0),
            child:Column(          
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(24.0),
                  child: Card(
                  color: Colors.purple.shade200,              
                    child:const Center(
                      child: Padding(
                        padding: const EdgeInsets.all(28.0),
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                            "Al-Fatihah",
                              style:  TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white
                                      ),
                            ),

                            Text(
                            "The Opening",
                              style:  TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white
                                      ),
                            ),
                            const SizedBox(height: 16.0,),

                            Divider(
                              height: 15,
                              color: Colors.grey,
                              thickness: 1,
                            ),
                            const SizedBox(height: 16.0,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Relevation

                                Text(
                                "Mekkah",
                                  style:  TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white
                                          ),
                                ),

                                 // number of verses
                                const SizedBox(width: 10.0,),

                                Text(
                                "7",
                                  style:  TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white
                                          ),
                                ),

                               const SizedBox(width: 5.0,),

                                Text(
                                "verse",
                                  style:  TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white
                                          ),
                                ),

                              ],
                            ),
                            const SizedBox(height: 48.0,),
                            Text(
                            "﻿بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ",
                              style:  TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w200,
                                      color: Colors.white
                                      ),
                            ),


                          ]
                        )
                      ),
                    )
                  )
                )
              ]
            )
        ),
    );
  }
}
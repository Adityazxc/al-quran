import 'package:al_quran/models/list_surah.dart';
import 'package:flutter/material.dart';
import 'package:al_quran/models/surah.dart' as detail;
import 'package:al_quran/Service/surah_detail.dart';
import 'package:al_quran/views/button/play_button.dart';

class DetailSurahMobile extends StatelessWidget {
  final ListSurah surah;
  const DetailSurahMobile({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Surah ${surah.name.transliteration.id}',
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins',
              color: Color(0xff672CBC)),
        ),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.grey),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search, size: 24, color: Colors.grey)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: const LinearGradient(
                    begin: Alignment(0.71, -0.71),
                    end: Alignment(-0.71, 0.71),
                    colors: [Color(0xFFDF98FA), Color(0xFF9055FF)],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(56.0),
                  child: Column(children: [
                    // name surah
                    Text(
                      'Surah ${surah.name.transliteration.id}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),

                    //translate surah
                    Text(
                      surah.name.translation.id,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),

                    const SizedBox(height: 16.0),
                    const Divider(
                      height: 15,
                      color: Colors.white,
                      thickness: 1,
                    ),
                    const SizedBox(height: 16.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // relevation surah
                        Text(
                          surah.revelation.id,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        const SizedBox(width: 10),

                        // number verses
                        Text(
                          "${surah.numberOfVerses} Ayat",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),

                        const SizedBox(width: 32),
                      ],
                    ),
                    const Text(
                      'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ]),
                ),
              ),
              FutureBuilder(
                  future: SurahDetail.getDetailSurah(surah.number.toString()),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data?.data.verses.length ?? 0,
                      itemBuilder: (context, index) {
                        if (snapshot.data!.data.verses.isEmpty) {
                          return const SizedBox();
                        }
                        detail.Verse? ayat = snapshot.data?.data.verses[index];

                        return Expanded(
                          child: ListTile(
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: ShapeDecoration(
                                      color: const Color(0x0C121931),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(13.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Stack(
                                          alignment: Alignment.center,
                                          children: <Widget>[
                                            const CircleAvatar(
                                                backgroundColor:
                                                    Color(0xff863ED5)),
                                            // number surah
                                            Text(
                                              "${ayat!.number.inQuran}",
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w200,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                       const  PlayButtonState(),
                                      ],
                                    ),
                                  ),
                                ),
                                // No ayat

                                const SizedBox(height: 24),
                                Text(
                                  ayat.text.arab,
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff240f4f),
                                  ),
                                ),

                                const SizedBox(height: 16),
                                // Ayat
                                Text(
                                  ayat.translation.id,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff240f4f),
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
                          ),
                        );
                      },
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

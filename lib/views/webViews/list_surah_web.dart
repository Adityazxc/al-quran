import 'package:al_quran/Service/list_surah.dart';
import 'package:al_quran/models/list_surah.dart';
import 'package:al_quran/views/detail_surah.dart';
import 'package:flutter/material.dart';

class ListSurahWeb extends StatelessWidget {
  final int gridCount;
  const ListSurahWeb({super.key, required this.gridCount});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double itemWidth = screenWidth / gridCount;

    // Calculate aspect ratio based on ListTile's height and leading widget's width
    double aspectRatio = itemWidth / (88.0);
    return Scaffold(
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
            icon: const Icon(Icons.menu, color: Colors.grey), onPressed: () {}),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.grey))
        ],
      ),
      body: FutureBuilder(
          future: GetListSurah.fetchSurahData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            }

            return SingleChildScrollView(
              child: Container(
                color: const Color(0xFFF5F5F5),
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 64,
                    ),
                    child: Center(
                      child: SizedBox(
                        width: 1200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Assalmualaikum",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF8789A3),
                                fontFamily: 'Poppins',
                              ),
                            ),
                            const Text(
                              "Aditya Firmansyah",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF230E4E),
                                fontFamily: 'Poppins',
                              ),
                            ),
                            const SizedBox(
                              height: 24.0,
                            ),
                            Container(
                                decoration: ShapeDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment(0.71, -0.71),
                                    end: Alignment(-0.71, 0.71),
                                    colors: [
                                      Color(0xFFDF98FA),
                                      Color(0xFF9055FF)
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                    "images/last_edit.png"),
                                                const SizedBox(
                                                  width: 10.0,
                                                ),
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
                                            const SizedBox(
                                              height: 10.0,
                                            ),
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
                                    ))),
                            const SizedBox(
                              height: 24.0,
                            ),
                            GridView.count(
                              crossAxisCount: gridCount,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              childAspectRatio: aspectRatio,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              children:
                                  List.generate(snapshot.data!.length, (index) {
                                ListSurah surah = snapshot.data![index];
                                return ListTile(
                                  onTap: () {
                                    Navigator.push(context,MaterialPageRoute(builder: (context){
                                      return DetailSurah(surah: surah);
                                    }));
                                  },
                                  leading: Stack(
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      Image.asset('images/numbering.png',
                                          width: 46.0, height: 46.0),
                                      // number surah
                                      Text(
                                        "${index + 1}",
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
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
                                    style: const TextStyle(
                                      color: Color(0xFF863ED5),
                                      fontSize: 20,
                                      fontFamily: 'Amiri',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                  subtitle: Container(
                                    margin: const EdgeInsets.only(top: 10),
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
                                          "${surah.numberOfVerses} Ayat",
                                          style: const TextStyle(
                                            color: Color(0xFF8789A3),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                                // const Divider(
                                //   height: 15,
                                //   color: Colors.grey,
                                //   thickness: 1,
                                // ),
                              }),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            );
          }),
    );
  }
}

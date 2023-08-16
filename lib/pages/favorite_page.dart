import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../custom/home_page_drawer.dart';
import '../custom/main_app_bar.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F0F0),
      appBar: MainAppBar(title: 'Favorite'),
      drawer: HomePageDrawer(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(19),
                              child: Image.asset(
                                'images/placeholder.png',
                                height: MediaQuery.of(context).size.width / 3,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 5,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.width / 3,
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          FittedBox(
                                            child: Text(
                                              'Full Stack Flutter',
                                              style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff292929),
                                              ),
                                            ),
                                          ),
                                          FittedBox(
                                            child: Text(
                                              'John Doe',
                                              style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                                color: Color(0xff716F6F),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                primary: Color(0xffDB1E37),
                                              ),
                                              child: Text(
                                                'Buy',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xffFFFFFF)),
                                              )),
                                          Text(
                                            '10,000/-BDT',
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xffDB1E37)),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    top: -15,
                                    right: -10,
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.favorite,
                                          color: Color(
                                            0xffDB1E37,
                                          ),
                                          size: 13,
                                        )),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

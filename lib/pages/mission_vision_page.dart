import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_design/helper/helper_constant.dart';

class MissionVisionPage extends StatelessWidget {
  const MissionVisionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        centerTitle: true,
        title: Text(
          'Mission & Vision',
          style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xff878787)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(
                      'https://pencilbox.edu.bd/frontend/assets/img/slider/mission-bg.jpg',
                    ),
                    fit: BoxFit.cover,
                  )),
                  height: MediaQuery.of(context).size.height / 4,
                  alignment: Alignment.center,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      gradient: LinearGradient(colors: [
                        Colors.black54.withOpacity(0.50),
                        Colors.black54.withOpacity(0.50),
                      ], stops: const [
                        0.0,
                        1.0
                      ])),
                ),
                Text('Mission & Vision',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.track_changes,
                        color: Colors.red,
                        size: 24,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('OUR VISION & MISSION',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black)),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      HelperConstant.vision,
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(children: [
                    const Icon(
                      Icons.recommend_outlined,
                      color: Colors.red,
                      size: 24,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'OUR COMMITMENT',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ]),
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: HelperConstant.commitmentList.map((strone) {
                          return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "\u2022",
                                  style: TextStyle(fontSize: 24),
                                ),
                                //bullet text
                                const SizedBox(
                                  width: 10,
                                ),
                                //space between bullet and text
                                Expanded(
                                  child: Text(
                                    strone,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Colors.black),
                                    textAlign: TextAlign.justify,
                                  ), //text
                                )
                              ]);
                        }).toList(),
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  Card(
                    margin: EdgeInsets.all(20),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.laptop_chromebook_rounded,
                            size: 40,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Experienced Trainers',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 28.0, right: 28),
                            child: Text(
                              'PencilBox provide best support and organize training in Bangladesh. They got Updated Lab support.',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(20),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.document_scanner_outlined,
                            size: 40,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Certification',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 28.0, right: 28),
                            child: Text(
                              'We provide BITM Collaborative Certification and PencilBox Certification.',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(20),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.comment_outlined,
                            size: 40,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Job Support',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 28.0, right: 28),
                            child: Text(
                              'We offer our students effective tools to find employment. Our trainer will help you to achieve the success.',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

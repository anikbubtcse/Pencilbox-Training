import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:screen_design/provider/faq_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        centerTitle: true,
        title: Text(
          'FAQ',
          style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xff878787)),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              'https://pencilbox.edu.bd/frontend/assets/img/slider/workshop-bg.jpg',
                            ),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.grey, BlendMode.softLight))),
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
                  Text(
                    'FREQUENTLY ASKED QUESTIONS',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Consumer<FaqProvider>(
                builder: (context, provider, child) {
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: provider.faqsList.length,
                      itemBuilder: (context, index) => ExpansionTile(
                            initiallyExpanded: false,
                            title: Text(
                              provider.faqsList[index].title!,
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            children: [
                              Html(
                                data: provider.faqsList[index].description!,
                              ),
                            ],
                          ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

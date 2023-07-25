import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';

class TrainerPage extends StatefulWidget {
  const TrainerPage({super.key});

  @override
  State<TrainerPage> createState() => _TrainerPageState();
}

class _TrainerPageState extends State<TrainerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        centerTitle: true,
        title: Text(
          'Trainer',
          style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xff878787)),
        ),
      ),
      body: ListView.builder(
          padding: EdgeInsets.only(left: 15, top: 15, right: 15),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: ListTile(
                leading: const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('images/photo.jpg'),
                ),
                title: Text(
                  'John Doe',
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff212121)),
                ),
                subtitle: Text(
                  'Server administration & cloud management',
                  style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      color: Color(0xff616161)),
                ),
                trailing: IconButton(
                  icon: const ImageIcon(
                      AssetImage(
                        'images/chat.png',
                      ),
                      color: Color(0xffDB1E37)),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.width / 2,
                            child: Card(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset('images/linkedin.svg'),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  SvgPicture.asset('images/twitter.svg'),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  SvgPicture.asset('images/facebook.svg'),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  SvgPicture.asset('images/instagram.svg'),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                ),
              ),
            );
          }),
    );
  }
}

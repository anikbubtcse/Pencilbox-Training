import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_design/models/trainer_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TrainerDetailsPage extends StatefulWidget {
  const TrainerDetailsPage({super.key});

  @override
  State<TrainerDetailsPage> createState() => _TrainerDetailsPageState();
}

class _TrainerDetailsPageState extends State<TrainerDetailsPage> {
  late TrainerModel trainerModel;

  @override
  void didChangeDependencies() {
    trainerModel = ModalRoute.of(context)!.settings.arguments as TrainerModel;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        centerTitle: true,
        title: Text(
          'Trainer details',
          style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xff878787)),
        ),
      ),
      body: Container(
          padding:
              const EdgeInsets.only(top: 25, left: 15, right: 15, bottom: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundImage: NetworkImage(
                            'https://pencilbox.edu.bd/${trainerModel.trainerImage!}'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        trainerModel.trainerName!,
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff212121)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        trainerModel.trainerTrack!,
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff616161)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {
                                String url = trainerModel.trainerLinkdin!;
                                if (url.isEmpty || url == null || url == "#") {
                                  Fluttertoast.showToast(
                                      msg: 'No profile found!');
                                } else {
                                  Uri uri = Uri.parse(url);
                                  _launchUrl(uri);
                                }
                              },
                              child: SvgPicture.asset('images/linkedin.svg')),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                              onTap: () {
                                String url = trainerModel.trainerTwitter!;
                                if (url.isEmpty || url == null || url == "#") {
                                  Fluttertoast.showToast(
                                      msg: 'No profile found!',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 14.0);
                                } else {
                                  Uri uri = Uri.parse(url);
                                  _launchUrl(uri);
                                }
                              },
                              child: SvgPicture.asset('images/twitter.svg')),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                              onTap: () {
                                String url = trainerModel.trainerFacebook!;
                                if (url.isEmpty || url == null || url == "#") {
                                  Fluttertoast.showToast(
                                      msg: 'No profile found!');
                                } else {
                                  Uri uri = Uri.parse(url);
                                  _launchUrl(uri);
                                }
                              },
                              child: SvgPicture.asset('images/facebook.svg')),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                              onTap: () {
                                String url = trainerModel.trainerInstagram!;
                                if (url.isEmpty || url == null || url == "#") {
                                  Fluttertoast.showToast(
                                      msg: 'No profile found!',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 14.0);
                                } else {
                                  Uri uri = Uri.parse(url);
                                  _launchUrl(uri);
                                }
                              },
                              child: SvgPicture.asset('images/instagram.svg')),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Html(
                  data: trainerModel.trainerBio!,
                  style: {
                    "body": Style(
                        fontSize: FontSize(14),
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.justify),
                  },
                ),
              ],
            ),
          )),
    );
  }

  void _launchUrl(Uri uri) async {
    try {
      if (!await launchUrl(uri)) {
        throw Exception('Could not launch $uri');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Something went wrong!');
    }
  }
}

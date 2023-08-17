import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_design/models/trainer_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:screen_design/provider/course_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../helper/helper_method.dart';

class TrainerDetailsPage extends StatefulWidget {
  const TrainerDetailsPage({super.key});

  @override
  State<TrainerDetailsPage> createState() => _TrainerDetailsPageState();
}

class _TrainerDetailsPageState extends State<TrainerDetailsPage> {
  late TrainerModel trainerModel;
  late CourseProvider courseProvider;
  bool callOnce = true;

  @override
  void didChangeDependencies() {
    courseProvider = Provider.of(context);
    trainerModel = ModalRoute.of(context)!.settings.arguments as TrainerModel;
    if (callOnce) {
      courseProvider.getCoursesByTrainerID(trainerModel.id!);
      callOnce = false;
    }

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
                                String url = trainerModel.trainerLinkdin ?? '';
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
                                String url = trainerModel.trainerTwitter ?? '';
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
                                String url = trainerModel.trainerFacebook ?? '';
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
                                String url =
                                    trainerModel.trainerInstagram ?? '';
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
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'More Courses By The Trainer',
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 3,
                ),
                const SizedBox(
                    width: 180,
                    child: Divider(
                      thickness: 1,
                      color: Colors.red,
                    )),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: courseProvider.coursesByTrainerIdList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('course_module_page',
                              arguments:
                                  courseProvider.coursesByTrainerIdList[index]);
                        },
                        child: Card(
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
                                    child: CachedNetworkImage(
                                      fit: BoxFit.fill,
                                      height:
                                          MediaQuery.of(context).size.width / 3,
                                      imageUrl:
                                          'https://pencilbox.edu.bd/${courseProvider.coursesByTrainerIdList[index].trainingImage}',
                                      placeholder: (context, url) =>
                                          const Center(
                                              child:
                                                  CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          Image.asset('images/placeholder.png',
                                              fit: BoxFit.fill,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 5,
                                  child: SizedBox(
                                    height:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 15),
                                              child: Text(
                                                courseProvider
                                                    .coursesByTrainerIdList[
                                                        index]
                                                    .trainingName!,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '${courseProvider.coursesByTrainerIdList[index].trainingPrice!}/-BDT',
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.red),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.access_time,
                                                  color: Color(0xff808080),
                                                  size: 13,
                                                ),
                                                const SizedBox(
                                                  width: 2,
                                                ),
                                                Text(
                                                  '${courseProvider.coursesByTrainerIdList[index].hours} h',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w300,
                                                    color:
                                                        const Color(0xff808080),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.date_range,
                                                  color: Color(0xff808080),
                                                  size: 13,
                                                ),
                                                const SizedBox(
                                                  width: 2,
                                                ),
                                                Text(
                                                  HelperMethod.getDateFormat(
                                                      'dd-MM-yyyy',
                                                      DateTime.parse(courseProvider
                                                          .coursesByTrainerIdList[
                                                              index]
                                                          .startDate!)),
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w300,
                                                    color:
                                                        const Color(0xff808080),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
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

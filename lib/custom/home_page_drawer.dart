import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_design/custom/home_page_drawer_row.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:screen_design/helper/helper_method.dart';
import '../provider/user_provider.dart';
import 'package:art_sweetalert/art_sweetalert.dart';

class HomePageDrawer extends StatefulWidget {
  const HomePageDrawer({super.key});

  @override
  State<HomePageDrawer> createState() => _HomePageDrawerState();
}

class _HomePageDrawerState extends State<HomePageDrawer> {
  bool isLoggedIn = false;
  String studentId = '';
  late UserProvider userProvider;
  bool callOnce = true;

  @override
  void didChangeDependencies() {
    userProvider = Provider.of(context);

    if (callOnce) {
      HelperMethod.getStudentId().then((value) {
        setState(() {
          if (value == null) {
            isLoggedIn = false;
          } else {
            isLoggedIn = true;
            studentId = value;
            userProvider.getUserInfoServiceData(studentId).then((value) {
              userProvider.getBillingList();
            });
          }
        });
      });
    }
    callOnce = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      child: Drawer(
        child: Container(
            margin: EdgeInsets.only(top: 40, left: 25),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: SvgPicture.asset("images/cross.svg")),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      isLoggedIn && userProvider.studentInfoModel != null
                          ? CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://pencilbox.edu.bd/${userProvider.studentInfoModel!.success!.image}'),
                              radius: 25,
                              backgroundColor: Colors.black12,
                            )
                          : const CircleAvatar(
                              backgroundImage: AssetImage('images/photo.png'),
                              radius: 25,
                              backgroundColor: Colors.black12,
                            ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            isLoggedIn && userProvider.studentInfoModel != null
                                ? FittedBox(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Text(
                                          userProvider.studentInfoModel!
                                              .success!.fullName!,
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  )
                                : Text('User Name',
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                            const SizedBox(
                              height: 5,
                            ),
                            isLoggedIn && userProvider.studentInfoModel != null
                                ? Text(
                                    userProvider.studentInfoModel!.success!
                                        .emailAddress!,
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300),
                                  )
                                : Text(
                                    'Email Address',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300),
                                  )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.black12,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  isLoggedIn
                      ? InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('my_course_page',
                                arguments: userProvider.studentInfoModel);
                          },
                          child: HomePageDrawerRow(
                              "images/courses.svg", 'My Courses'))
                      : Container(),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('dashboard_page');
                      },
                      child: isLoggedIn == false
                          ? Container()
                          : HomePageDrawerRow(
                              "images/workshops.svg", 'Dashboard')),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('rpl_page');
                      },
                      child: HomePageDrawerRow("images/rpl.svg", 'RPL')),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('new_blog_page');
                      },
                      child: HomePageDrawerRow("images/blog.svg", 'Blog')),
                  const SizedBox(
                    height: 20,
                  ),
                  ListTileTheme(
                      contentPadding: const EdgeInsets.only(
                          left: 0, right: 20, top: 0, bottom: 0),
                      dense: true,
                      horizontalTitleGap: 0.0,
                      child: ExpansionTile(
                        childrenPadding: EdgeInsets.zero,
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        iconColor: Colors.black,
                        collapsedIconColor: Colors.black,
                        shape: Border(),
                        leading: const Icon(
                          Icons.error_outline,
                          size: 28,
                          color: Color(0xff000000),
                        ),
                        title: Text(
                          'Useful Links',
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff000000)),
                        ),
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('about_us_page');
                            },
                            child: Text(
                              'About us',
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff000000)),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('trainer_page');
                            },
                            child: Text(
                              'Trainer',
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff000000)),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('event_page');
                            },
                            child: Text(
                              'Event',
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff000000)),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('career_page');
                            },
                            child: Text(
                              'Career',
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff000000)),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed('mission_vision_page');
                            },
                            child: Text(
                              'Our Vision & Mission',
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff000000)),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Industrial attachment',
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff000000)),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'FAQ',
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff000000)),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('review_page');
                            },
                            child: Text(
                              'Review',
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff000000)),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed('privacy_policy_page');
                            },
                            child: Text(
                              'Privacy & Policy',
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff000000)),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed('terms_condition_page');
                            },
                            child: Text(
                              'Terms & Conditions',
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff000000)),
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('contact_page');
                      },
                      child:
                          HomePageDrawerRow("images/contact.svg", 'Contact')),
                  const SizedBox(
                    height: 20,
                  ),
                  HomePageDrawerRow("images/rate.svg", 'Rate Us'),
                  const SizedBox(
                    height: 20,
                  ),
                  isLoggedIn
                      ? InkWell(
                          onTap: () {
                            logOutAlertDialog();
                          },
                          child:
                              HomePageDrawerRow("images/logout.svg", 'Logout'))
                      : InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed('splash_page');
                          },
                          child:
                              HomePageDrawerRow("images/logout.svg", 'Login')),
                  const SizedBox(
                    height: 30,
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.black12,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text('App version 1.0.1',
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w300))
                ],
              ),
            )),
      ),
    );
  }

  void logOutAlertDialog() async {
    await ArtSweetAlert.show(
        barrierDismissible: false,
        context: context,
        artDialogArgs: ArtDialogArgs(
            denyButtonText: "No",
            title: "Do you really want to Log Out?",
            confirmButtonText: "Yes",
            type: ArtSweetAlertType.warning,
            onConfirm: () async {
              await HelperMethod.userLogOut().then((value) {
                print(value);
                Navigator.of(context).pushReplacementNamed('bottom_nav_screen');
              });
            },
            onDeny: () {
              Navigator.of(context).pop();
            }));
  }
}

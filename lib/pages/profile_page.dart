import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:screen_design/helper/helper_method.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:screen_design/models/update_profile_model.dart';
import 'package:screen_design/provider/user_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:art_sweetalert/art_sweetalert.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String isLoggedIn = '';
  String studentId = '';
  late UserProvider userProvider;
  bool callOnce = true;
  TextEditingController bioTextEditingController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    bioTextEditingController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    userProvider = Provider.of(context, listen: true);
    if (callOnce) {
      HelperMethod.getStudentId().then((value) {
        setState(() {
          if (value == null) {
            isLoggedIn = 'false';
          } else {
            isLoggedIn = 'true';
            studentId = value;
            userProvider.getUserInfoServiceData(studentId);
          }
        });
      });
    }
    callOnce = false;
    super.didChangeDependencies();
    if (userProvider.studentInfoModel != null) {
      bioTextEditingController.text =
          userProvider.studentInfoModel!.success!.about ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F0F0),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffFFFFFF),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: isLoggedIn == 'false' || isLoggedIn == ''
                ? const Padding(padding: EdgeInsets.only(right: 10))
                : InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('edit_profile_page');
                    },
                    child: InkWell(
                        onTap: () {
                          ArtSweetAlert.show(
                              barrierDismissible: false,
                              context: context,
                              artDialogArgs: ArtDialogArgs(
                                title: "Do you want to edit your profile?",
                                confirmButtonText: "Yes",
                                denyButtonText: "No",
                                type: ArtSweetAlertType.warning,
                                onDeny: () {
                                  Navigator.of(context).pop();
                                },
                                onConfirm: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context)
                                      .pushNamed('edit_profile_page');
                                },
                              ));
                        },
                        child: SvgPicture.asset('images/drawer.svg'))),
          )
        ],
        centerTitle: true,
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xff878787)),
        ),
      ),
      body: isLoggedIn == ''
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : isLoggedIn == 'true'
              ? userProvider.studentInfoModel == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  userProvider.studentInfoModel!.success!
                                              .image !=
                                          null
                                      ? CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              'https://pencilbox.edu.bd/${userProvider.studentInfoModel!.success!.image}'),
                                          radius: 45,
                                        )
                                      : const CircleAvatar(
                                          backgroundImage:
                                              AssetImage('images/photo.png'),
                                          radius: 45,
                                        ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    userProvider
                                        .studentInfoModel!.success!.fullName!,
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    userProvider.studentInfoModel!.success!
                                        .emailAddress!,
                                    style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Bio',
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff8E99A1)),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return AlertDialog(
                                                    content: Container(
                                                      height: 200,
                                                      child: Form(
                                                        key: formKey,
                                                        child: Column(
                                                          children: [
                                                            TextFormField(
                                                              validator:
                                                                  (value) {
                                                                if (value!
                                                                    .isEmpty) {
                                                                  return 'Please write your Bio';
                                                                }
                                                              },
                                                              maxLines: 5,
                                                              controller:
                                                                  bioTextEditingController,
                                                              decoration:
                                                                  InputDecoration(
                                                                enabledBorder: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                            color:
                                                                                Colors.grey)),
                                                                focusedBorder: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                            color:
                                                                                Colors.grey)),
                                                                hintText:
                                                                    'Enter Your Bio',
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
                                                            ),
                                                            ElevatedButton(
                                                                style: ButtonStyle(
                                                                    backgroundColor:
                                                                        MaterialStateProperty.all(Colors
                                                                            .red)),
                                                                onPressed: () {
                                                                  updateUserBio(
                                                                      context,
                                                                      dialogContext);
                                                                },
                                                                child: Text(
                                                                    'Update',
                                                                    style: GoogleFonts.poppins(
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        color: (Colors
                                                                            .white))))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                });
                                          },
                                          child: Text(
                                            'EDIT',
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xffDB1E37)),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    userProvider.studentInfoModel!.success!
                                                .about ==
                                            'Null'
                                        ? Text(
                                            'Please write something about yourself!',
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff8E99A1)),
                                          )
                                        : Text(
                                            userProvider.studentInfoModel!
                                                    .success!.about ??
                                                'Please write something about yourself!',
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff8E99A1)),
                                          )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'ON THE WEB',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff8E99A1)),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            String value = userProvider
                                                    .studentInfoModel!
                                                    .success!
                                                    .linkedin ??
                                                "Null";

                                            if (value == 'Null') {
                                              Fluttertoast.showToast(
                                                  msg:
                                                      'You need to add your linkedin profile.',
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.CENTER,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.red,
                                                  textColor: Colors.white,
                                                  fontSize: 14.0);
                                            } else {
                                              Uri uri = Uri.parse(value);

                                              _launchUrl(uri);
                                            }
                                          },
                                          child: SvgPicture.asset(
                                              'images/linkedin.svg'),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                            onTap: () {
                                              String value = userProvider
                                                      .studentInfoModel!
                                                      .success!
                                                      .twitter ??
                                                  "Null";

                                              if (value == 'Null') {
                                                Fluttertoast.showToast(
                                                    msg:
                                                        'You need to add your twitter profile.',
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.CENTER,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor: Colors.red,
                                                    textColor: Colors.white,
                                                    fontSize: 14.0);
                                              } else {
                                                Uri uri = Uri.parse(value);

                                                _launchUrl(uri);
                                              }
                                            },
                                            child: SvgPicture.asset(
                                                'images/twitter.svg')),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                            onTap: () {
                                              String value = userProvider
                                                      .studentInfoModel!
                                                      .success!
                                                      .facebook ??
                                                  'Null';

                                              if (value == 'Null') {
                                                Fluttertoast.showToast(
                                                    msg:
                                                        'You need to add your facebook profile.',
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.CENTER,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor: Colors.red,
                                                    textColor: Colors.white,
                                                    fontSize: 14.0);
                                              } else {
                                                Uri uri = Uri.parse(value);

                                                _launchUrl(uri);
                                              }
                                            },
                                            child: SvgPicture.asset(
                                                'images/facebook.svg')),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                            onTap: () {
                                              String value = userProvider
                                                      .studentInfoModel!
                                                      .success!
                                                      .instagram ??
                                                  'Null';

                                              if (value == 'Null') {
                                                Fluttertoast.showToast(
                                                    msg:
                                                        'You need to add your instagram profile.',
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.CENTER,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor: Colors.red,
                                                    textColor: Colors.white,
                                                    fontSize: 14.0);
                                              } else {
                                                Uri uri = Uri.parse(value);

                                                _launchUrl(uri);
                                              }
                                            },
                                            child: SvgPicture.asset(
                                                'images/instagram.svg')),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 60,
                                          child: Text(
                                            'WEBSITE',
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff8E99A1)),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 40,
                                        ),
                                        Expanded(
                                          child: Text(
                                            userProvider.studentInfoModel!
                                                .success!.emailAddress!,
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff8E99A1)),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 60,
                                          child: Text(
                                            'Phone',
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff8E99A1)),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 40,
                                        ),
                                        Text(
                                          userProvider.studentInfoModel!
                                              .success!.phoneNumber!,
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff8E99A1)),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('To see your profile, please Login first',
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.purple)),
                          onPressed: () {
                            Navigator.of(context).pushNamed('login_screen');
                          },
                          child: Text('Login',
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)))
                    ],
                  ),
                ),
    );
  }

  void updateUserBio(BuildContext context, BuildContext dialogContext) {
    if (formKey.currentState!.validate()) {
      final success = UpdateProfileModel(
          id: userProvider.studentInfoModel!.success!.id,
          username: userProvider.studentInfoModel!.success!.username ?? '',
          fullName: userProvider.studentInfoModel!.success!.fullName ?? '',
          emailAddress: userProvider.studentInfoModel!.success!.emailAddress,
          cusCountry: userProvider.studentInfoModel!.success!.cusCountry ?? '',
          cusState: userProvider.studentInfoModel!.success!.cusState ?? '',
          cusCity: userProvider.studentInfoModel!.success!.cusCity ?? '',
          cusAdd1: userProvider.studentInfoModel!.success!.cusAdd1 ?? '',
          cusAdd2: userProvider.studentInfoModel!.success!.cusAdd2 ?? '',
          cusPostcode:
              userProvider.studentInfoModel!.success!.cusPostcode ?? '',
          facebook: userProvider.studentInfoModel!.success!.facebook ?? '',
          instagram: userProvider.studentInfoModel!.success!.instagram ?? '',
          linkedin: userProvider.studentInfoModel!.success!.linkedin ?? '',
          twitter: userProvider.studentInfoModel!.success!.twitter ?? '',
          about: bioTextEditingController.text,
          phoneNumber: userProvider.studentInfoModel!.success!.phoneNumber);

      Navigator.of(dialogContext).pop();
      EasyLoading.show();
      userProvider.userProfileUpdate(success).then((value) {
        EasyLoading.dismiss();
        print(value.toString());
        if (value['success'] == 'Profile Update Sucessfully!!') {
          ArtSweetAlert.show(
              context: context,
              artDialogArgs: ArtDialogArgs(
                  text: value['success'].toString(),
                  type: ArtSweetAlertType.success));

          userProvider.getUserInfoServiceData(studentId);
        } else {
          ArtSweetAlert.show(
              context: context,
              artDialogArgs: ArtDialogArgs(
                  text: value.toString(), type: ArtSweetAlertType.warning));
        }
      });
    }
  }

  Future<void> _launchUrl(Uri uri) async {
    try {
      if (!await launchUrl(uri)) {
        throw Exception('Could not launch $uri');
      }
    } catch (e) {
      print('e.toString(): ${e.toString()}');
      Fluttertoast.showToast(
          msg: 'Your provided URL is not valid',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 14.0);
    }
  }
}

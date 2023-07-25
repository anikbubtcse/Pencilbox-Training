import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_design/models/update_profile_model.dart';
import 'package:screen_design/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:art_sweetalert/art_sweetalert.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late UserProvider userProvider;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController fullNameTextEditingController = TextEditingController();
  TextEditingController phoneNumberTextEditingController =
      TextEditingController();
  TextEditingController countryTextEditingController = TextEditingController();
  TextEditingController cityTextEditingController = TextEditingController();
  TextEditingController address1TextEditingController = TextEditingController();
  TextEditingController address2TextEditingController = TextEditingController();
  TextEditingController postCodeTextEditingController = TextEditingController();
  TextEditingController facebookTextEditingController = TextEditingController();
  TextEditingController instagramTextEditingController =
      TextEditingController();
  TextEditingController twitterTextEditingController = TextEditingController();
  TextEditingController linkedlinTextEditingController =
      TextEditingController();

  @override
  void didChangeDependencies() {
    userProvider = Provider.of(context);

    super.didChangeDependencies();

    if (userProvider.studentInfoModel != null) {
      final value = userProvider.studentInfoModel!.success;

      userNameTextEditingController.text =
          value!.username == "Null" ? '' : value.username ?? '';
      fullNameTextEditingController.text =
          value.fullName == "Null" ? '' : value.fullName ?? '';
      phoneNumberTextEditingController.text =
          value.phoneNumber == "Null" ? '' : value.phoneNumber ?? '';
      countryTextEditingController.text =
          value.cusCountry == "Null" ? '' : value.cusCountry ?? '';
      cityTextEditingController.text =
          value.cusCity == "Null" ? '' : value.cusCity ?? '';
      address1TextEditingController.text =
          value.cusAdd1 == "Null" ? '' : value.cusAdd1 ?? '';
      address2TextEditingController.text =
          value.cusAdd2 == "Null" ? '' : value.cusAdd2 ?? '';
      postCodeTextEditingController.text =
          value.cusPostcode == "Null" ? '' : value.cusPostcode ?? '';
      facebookTextEditingController.text =
          value.facebook == "Null" ? '' : value.facebook ?? '';
      instagramTextEditingController.text =
          value.instagram == "Null" ? '' : value.instagram ?? '';
      twitterTextEditingController.text =
          value.twitter == 'Null' ? '' : value.twitter ?? '';
      linkedlinTextEditingController.text =
          value.linkedin == "Null" ? '' : value.linkedin ?? '';
    }
  }

  @override
  void dispose() {
    userNameTextEditingController.dispose();
    fullNameTextEditingController.dispose();
    phoneNumberTextEditingController.dispose();
    countryTextEditingController.dispose();
    cityTextEditingController.dispose();
    address1TextEditingController.dispose();
    address2TextEditingController.dispose();
    postCodeTextEditingController.dispose();
    facebookTextEditingController.dispose();
    instagramTextEditingController.dispose();
    twitterTextEditingController.dispose();
    linkedlinTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F0F0),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        centerTitle: true,
        title: Text(
          'Edit Profile',
          style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xff878787)),
        ),
      ),
      body: Container(
          padding:
              const EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      userProvider.studentInfoModel!.success!.image == null
                          ? const CircleAvatar(
                              backgroundImage: AssetImage('images/photo.png'),
                              radius: 45,
                            )
                          : CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://pencilbox.edu.bd/${userProvider.studentInfoModel!.success!.image}'),
                              radius: 45,
                            ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        userProvider.studentInfoModel!.success!.fullName!,
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        userProvider.studentInfoModel!.success!.emailAddress!,
                        style: GoogleFonts.poppins(
                            fontSize: 10, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Username',
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: (const Color(0xff000000))),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        SizedBox(
                          height: 45,
                          child: TextFormField(
                            controller: userNameTextEditingController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffF0F0F0),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Color(0xffA9A9A9), width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.amber, width: 1))),
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Text(
                          'Full Name',
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: (Color(0xff000000))),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        SizedBox(
                          height: 45,
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Full name is required';
                              } else {
                                return null;
                              }
                            },
                            controller: fullNameTextEditingController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffF0F0F0),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Color(0xffA9A9A9), width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.amber, width: 1))),
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Text(
                          'Phone Number',
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: (Color(0xff000000))),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        SizedBox(
                          height: 45,
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Phone number is required';
                              } else if (value.length < 11) {
                                return 'Phone number must contain at least 11 characters';
                              }
                            },
                            controller: phoneNumberTextEditingController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffF0F0F0),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Color(0xffA9A9A9), width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.amber, width: 1))),
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Text(
                          'Country',
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: (Color(0xff000000))),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        SizedBox(
                          height: 45,
                          child: TextFormField(
                            controller: countryTextEditingController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffF0F0F0),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Color(0xffA9A9A9), width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.amber, width: 1))),
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Text(
                          'City',
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: (Color(0xff000000))),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        SizedBox(
                          height: 45,
                          child: TextFormField(
                            controller: cityTextEditingController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffF0F0F0),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Color(0xffA9A9A9), width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.amber, width: 1))),
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Text(
                          'Address 1',
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: (Color(0xff000000))),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        SizedBox(
                          height: 45,
                          child: TextFormField(
                            controller: address1TextEditingController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffF0F0F0),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Color(0xffA9A9A9), width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.amber, width: 1))),
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Text(
                          'Address 2',
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: (Color(0xff000000))),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        SizedBox(
                          height: 45,
                          child: TextFormField(
                            controller: address2TextEditingController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffF0F0F0),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Color(0xffA9A9A9), width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.amber, width: 1))),
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Text(
                          'Postcode',
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: (Color(0xff000000))),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        SizedBox(
                          height: 45,
                          child: TextFormField(
                            controller: postCodeTextEditingController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffF0F0F0),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Color(0xffA9A9A9), width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.amber, width: 1))),
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Text(
                          'Facebook',
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: (Color(0xff000000))),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        SizedBox(
                          height: 45,
                          child: TextFormField(
                            controller: facebookTextEditingController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffF0F0F0),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Color(0xffA9A9A9), width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.amber, width: 1))),
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Text(
                          'Instagram',
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: (Color(0xff000000))),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        SizedBox(
                          height: 45,
                          child: TextFormField(
                            controller: instagramTextEditingController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffF0F0F0),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Color(0xffA9A9A9), width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.amber, width: 1))),
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Text(
                          'Twitter',
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: (Color(0xff000000))),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        SizedBox(
                          height: 45,
                          child: TextFormField(
                            controller: twitterTextEditingController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffF0F0F0),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Color(0xffA9A9A9), width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.amber, width: 1))),
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Text(
                          'Linkedlin',
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: (Color(0xff000000))),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        SizedBox(
                          height: 45,
                          child: TextFormField(
                            controller: linkedlinTextEditingController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffF0F0F0),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Color(0xffA9A9A9), width: 1)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.amber, width: 1))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          final value = userProvider.studentInfoModel!.success;

                          final success = UpdateProfileModel(
                              id: value!.id,
                              username:
                                  userNameTextEditingController.text ?? '',
                              fullName: fullNameTextEditingController.text,
                              emailAddress: value.emailAddress,
                              cusCountry:
                                  countryTextEditingController.text ?? '',
                              cusCity: cityTextEditingController.text ?? '',
                              cusState: value.cusState ?? '',
                              cusAdd1: address1TextEditingController.text ?? '',
                              cusAdd2: address2TextEditingController.text ?? '',
                              cusPostcode:
                                  postCodeTextEditingController.text ?? '',
                              facebook:
                                  facebookTextEditingController.text ?? '',
                              instagram:
                                  instagramTextEditingController.text ?? '',
                              linkedin:
                                  linkedlinTextEditingController.text ?? '',
                              twitter: twitterTextEditingController.text ?? '',
                              about: value.about ?? '',
                              phoneNumber:
                                  phoneNumberTextEditingController.text);

                          EasyLoading.show();
                          userProvider.userProfileUpdate(success).then((value) {
                            EasyLoading.dismiss();
                            if (value['success'] ==
                                'Profile Update Sucessfully!!') {
                              var snackBar =
                                  SnackBar(content: Text(value['success']));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);

                              userProvider
                                  .getUserInfoServiceData(userProvider
                                      .studentInfoModel!.success!.id
                                      .toString())
                                  .then((value) {
                                Navigator.of(context).pushNamed('profile_page');
                              });
                            } else {
                              ArtSweetAlert.show(
                                  context: context,
                                  artDialogArgs: ArtDialogArgs(
                                      text: value.toString(),
                                      type: ArtSweetAlertType.warning));
                            }
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffDE1E36),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Text(
                        'Update',
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffFFFDFD)),
                      )),
                )
              ],
            ),
          )),
    );
  }
}

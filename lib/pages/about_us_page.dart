import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_design/helper/helper_constant.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import '../service/subscription_service.dart';

class AboutUsPage extends StatefulWidget {
  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  GlobalKey<FormState> formKeySubscriber = GlobalKey<FormState>();

  bool showError = false;

  TextEditingController subscriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        centerTitle: true,
        title: Text(
          'About Us',
          style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xff878787)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
                child: Image.asset(
              'images/pencilbox_logo.png',
              width: MediaQuery.of(context).size.width / 1.5,
            )),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                HelperConstant.aboutUs,
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: Text('Subscribe to our newsletter',
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
            ),
            const SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.center,
              child: Text('Do not miss any exciting offers by pencilbox',
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black)),
            ),
            const SizedBox(
              height: 15,
            ),
            Form(
              key: formKeySubscriber,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: subscriptionController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please give your email address';
                          } else if (!EmailValidator.validate(value)) {
                            return 'Please provide a valid email address';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          filled: true,
                          fillColor: Color(0xffF9F9F9),
                          hintText: 'example@gmail.com',
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffA9A9A9)),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          errorBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        if (formKeySubscriber.currentState!.validate()) {
                          EasyLoading.show();

                          dynamic data =
                              await SubscriptionService.subscribeUserService(
                                  subscriptionController.text);

                          EasyLoading.dismiss();
                          subscriptionController.clear();

                          if (data != null) {
                            ArtSweetAlert.show(
                                context: context,
                                artDialogArgs: ArtDialogArgs(
                                  type: ArtSweetAlertType.success,
                                  title: "Congratulations!",
                                  text: data["success"],
                                  confirmButtonText: 'OK',
                                  onConfirm: () {
                                    Navigator.of(context).pop();
                                  },
                                ));
                          }

                          if (data == null) {
                            ArtSweetAlert.show(
                                context: context,
                                artDialogArgs: ArtDialogArgs(
                                  type: ArtSweetAlertType.warning,
                                  title: "Oops! Sorry",
                                  text: 'Something went wrong',
                                  confirmButtonText: 'OK',
                                  onConfirm: () {
                                    Navigator.of(context).pop();
                                  },
                                ));
                          }
                        }
                      },
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                            color: Color(0xffDB1E37),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Subscribe',
                              style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffFFFFFF)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 19,
            ),
            Column(
              children: [
                Image.asset(
                  'images/sponsor.png',
                  height: 100,
                  width: double.infinity,
                ),
                Image.asset(
                  'images/payment.png',
                  height: 25,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,
                ),
                Stack(
                  children: [
                    Image.asset(
                      'images/rectangle.png',
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fitWidth,
                    ),
                    Positioned(
                      top: 20,
                      left: 50,
                      right: 50,
                      child: FittedBox(
                        child: Text(
                          "Copyright 2023 PencilBox Training Institute. All rights reserved.",
                          style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

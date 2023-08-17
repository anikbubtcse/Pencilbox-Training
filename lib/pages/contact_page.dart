import 'dart:async';
import 'package:screen_design/helper/helper_constant.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:screen_design/models/contact_model.dart';
import 'package:screen_design/service/ContactService.dart';
import 'package:screen_design/service/subscription_service.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ContactPage extends StatefulWidget {
  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  GlobalKey<FormState> formKeyMessage = GlobalKey<FormState>();
  GlobalKey<FormState> formKeySubscriber = GlobalKey<FormState>();
  bool showError = false;
  TextEditingController subscriptionController = TextEditingController();
  TextEditingController firsrNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  static const CameraPosition cameraPosition = CameraPosition(
    target: LatLng(23.754668, 90.3916524),
    zoom: 16,
  );
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  void dispose() {
    subscriptionController.dispose();
    firsrNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 3.5,
                    child: GoogleMap(
                      markers: {
                        const Marker(
                          markerId: MarkerId('1'),
                          position: LatLng(23.754668, 90.3916524),
                        )
                      },
                      compassEnabled: true,
                      myLocationButtonEnabled: true,
                      mapType: MapType.normal,
                      initialCameraPosition: cameraPosition,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ),
                  ),
                  Positioned(
                    left: 25,
                    top: 40,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                          width: 40,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          )),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                    onPressed: () {
                      _launchUrl();
                    },
                    child: Text('Find Location',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.white))),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: [
                    Text('Send us a message',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 28,
                            color: Color(0xff212121))),
                    const SizedBox(
                      height: 8,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Form(
                          key: formKeyMessage,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("First Name",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff191D23))),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                controller: firsrNameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'First Name is required';
                                  }

                                  return null;
                                },
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(8),
                                    filled: true,
                                    fillColor: Color(0xffF9F9F9),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                            color: Colors.transparent)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                            color: Colors.transparent)),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide:
                                            BorderSide(color: Colors.red)),
                                    hintText: "John",
                                    hintStyle: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff999999))),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("Last Name",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff191D23))),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                controller: lastNameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Last Name is required';
                                  }
                                },
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(8),
                                    filled: true,
                                    fillColor: Color(0xffF9F9F9),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                            color: Colors.transparent)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                            color: Colors.transparent)),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                            color: Colors.red)),
                                    hintText: "Doe",
                                    hintStyle: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff999999))),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("Email",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff191D23))),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                controller: emailController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Email is required';
                                  } else if (!EmailValidator.validate(value)) {
                                    return 'Please provide a valid email address';
                                  }
                                },
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(8),
                                    filled: true,
                                    fillColor: Color(0xffF9F9F9),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                            color: Colors.transparent)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                            color: Colors.transparent)),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                            color: Colors.red)),
                                    hintText: "johndoe@gmail.com",
                                    hintStyle: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff999999))),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("Phone Number",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff191D23))),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                controller: phoneController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Phone Number is required';
                                  }
                                },
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(8),
                                    filled: true,
                                    fillColor: Color(0xffF9F9F9),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                            color: Colors.transparent)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                            color: Colors.transparent)),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                            color: Colors.red)),
                                    hintText: "+8801752045464",
                                    hintStyle: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff999999))),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("Message",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff191D23))),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                controller: messageController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please write your message';
                                  }
                                },
                                maxLines: 4,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8),
                                  filled: true,
                                  fillColor: Color(0xffF9F9F9),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                          color: Colors.transparent)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                          color: Colors.transparent)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide:
                                          const BorderSide(color: Colors.red)),
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Container(
                                height: 48,
                                width: MediaQuery.of(context).size.width,
                                child: ElevatedButton(
                                    onPressed: () async {
                                      if (formKeyMessage.currentState!
                                          .validate()) {
                                        EasyLoading.show();

                                        final contactModel = ContactModel(
                                            first_name:
                                                firsrNameController.text,
                                            last_name: lastNameController.text,
                                            phone: phoneController.text,
                                            email: emailController.text,
                                            message: messageController.text);

                                        dynamic data =
                                            await ContactService.contactService(
                                                contactModel);

                                        firsrNameController.clear();
                                        lastNameController.clear();
                                        emailController.clear();
                                        phoneController.clear();
                                        messageController.clear();

                                        EasyLoading.dismiss();

                                        if (data != null) {
                                          ArtSweetAlert.show(
                                              context: context,
                                              artDialogArgs: ArtDialogArgs(
                                                type: ArtSweetAlertType.success,
                                                title: 'Congratulations',
                                                text:
                                                    '${contactModel.first_name} ${data['success']} ',
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
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color(0xffDB1E37)),
                                    ),
                                    child: Text(
                                      "Send Message",
                                      style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xffFFFFFF)),
                                    )),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
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
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: [
                    Image.asset(
                      'images/map.png',
                      height: 30,
                      width: 30,
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('EDB Trade Centre (5th Floor)',
                              style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black)),
                          Text('93 Kazi Nazrul Islam Avenue, Dhaka-1215',
                              style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: [
                    Image.asset(
                      'images/phone.png',
                      height: 30,
                      width: 30,
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('+88 01714 121719',
                              style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black)),
                          Text('+88 02 410 100 90',
                              style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: [
                    Image.asset(
                      'images/mail.png',
                      height: 30,
                      width: 30,
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Text('info@pencilbox.edu.bd',
                        style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.black)),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        String url = HelperConstant.pencilbox_linkedin;
                        Uri uri = Uri.parse(url);
                        url_launcher(uri);
                      },
                      child: SvgPicture.asset('images/linkedin.svg')),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                      onTap: () {
                        String url = HelperConstant.pencilbox_youtube;
                        Uri uri = Uri.parse(url);
                        url_launcher(uri);
                      },
                      child: SvgPicture.asset('images/youtube.svg')),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                      onTap: () {
                        String url = HelperConstant.pencilbox_facebook;
                        Uri uri = Uri.parse(url);
                        url_launcher(uri);
                      },
                      child: SvgPicture.asset('images/facebook.svg')),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                      onTap: () {
                        String url = HelperConstant.pencilbox_instagram;
                        Uri uri = Uri.parse(url);
                        url_launcher(uri);
                      },
                      child: SvgPicture.asset('images/instagram.svg')),
                ],
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _launchUrl() async {
    if (!await launchUrl(Uri.parse(HelperConstant.cameraPosition))) {
      throw Exception('Could not launch the URL');
    }
  }

  void url_launcher(Uri uri) async {
    try {
      if (!await launchUrl(uri)) {
        throw Exception('Could not launch $uri');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Something went wrong!');
    }
  }
}

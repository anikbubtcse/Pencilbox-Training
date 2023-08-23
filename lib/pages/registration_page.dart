import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import '../models/student_registration.dart';
import '../provider/user_provider.dart';
import 'package:art_sweetalert/art_sweetalert.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool _obsecureText = true;
  bool confirmObsecureText = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late UserProvider userProvider;

  @override
  void didChangeDependencies() {
    userProvider = Provider.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xffFFFFFF),
        elevation: 0.0,
      ),
      body: Container(
          margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Create an Account",
                    style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff191919)),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Email Address",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff191D23))),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                          height: 48,
                          child: TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email is required';
                              } else if (!EmailValidator.validate(value)) {
                                return 'Please give us a valid email';
                              }
                            },
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.amber)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(color: Color(0xffD0D5DD))),
                              hintText: "hello@example.com",
                              // labelStyle: GoogleFonts.poppins(
                              //     fontSize: 16,
                              //     fontWeight: FontWeight.w500,
                              //     color: Color(0xff999999))
                            ),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Full Name",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff191D23))),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                          height: 48,
                          child: TextFormField(
                            controller: fullNameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Name is required';
                              }
                            },
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.amber)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(color: Color(0xffD0D5DD))),
                              hintText: "John Doe",
                              // labelStyle: GoogleFonts.poppins(
                              //     fontSize: 16,
                              //     fontWeight: FontWeight.w500,
                              //     color: Color(0xff999999))
                            ),
                          )),
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
                      Container(
                          height: 48,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: phoneNumberController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'please give us your number';
                              } else if (value.length != 11) {
                                return 'please give 11 digit phone number';
                              }
                            },
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.amber)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(color: Color(0xffD0D5DD))),
                              hintText: "+8801752045464",
                              // labelStyle: GoogleFonts.poppins(
                              //     fontSize: 16,
                              //     fontWeight: FontWeight.w500,
                              //     color: Color(0xff999999))
                            ),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("User Name",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff191D23))),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                          height: 48,
                          child: TextFormField(
                            controller: userNameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'User Name is required';
                              }
                            },
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.amber)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(color: Color(0xffD0D5DD))),
                              hintText: "John Doe",
                              // labelStyle: GoogleFonts.poppins(
                              //     fontSize: 16,
                              //     fontWeight: FontWeight.w500,
                              //     color: Color(0xff999999))
                            ),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Password",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff191D23))),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                          height: 48,
                          child: TextFormField(
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password is required';
                              }
                            },
                            obscureText: _obsecureText,
                            decoration: InputDecoration(
                              suffixIcon: _obsecureText
                                  ? IconButton(
                                      icon: Icon(Icons.visibility_off),
                                      onPressed: () {
                                        setState(() {
                                          _obsecureText = false;
                                        });
                                      },
                                    )
                                  : IconButton(
                                      icon: Icon(Icons.visibility),
                                      onPressed: () {
                                        setState(() {
                                          _obsecureText = true;
                                        });
                                      },
                                    ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.amber)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(color: Color(0xffD0D5DD))),
                              hintText: "..........",
                              // labelStyle: GoogleFonts.poppins(
                              //     fontSize: 16,
                              //     fontWeight: FontWeight.w500,
                              //     color: Color(0xff999999))
                            ),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("Confirm Password",
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff191D23))),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                          height: 48,
                          child: TextFormField(
                            controller: confirmPasswordController,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password is required';
                              } else if (value != passwordController.text) {
                                return 'Password doesn\'t matched ! ';
                              }
                            },
                            obscureText: confirmObsecureText,
                            decoration: InputDecoration(
                              suffixIcon: confirmObsecureText
                                  ? IconButton(
                                      icon: Icon(Icons.visibility_off),
                                      onPressed: () {
                                        setState(() {
                                          confirmObsecureText = false;
                                        });
                                      },
                                    )
                                  : IconButton(
                                      icon: Icon(Icons.visibility),
                                      onPressed: () {
                                        setState(() {
                                          confirmObsecureText = true;
                                        });
                                      },
                                    ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.amber)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(color: Color(0xffD0D5DD))),
                              hintText: "..........",
                              // labelStyle: GoogleFonts.poppins(
                              //     fontSize: 16,
                              //     fontWeight: FontWeight.w500,
                              //     color: Color(0xff999999))
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: FittedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'By continuing, you agree to our',
                                style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff4B5768)),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                'terms of service.',
                                style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff122E52)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 48,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                EasyLoading.show();
                                StudentRegistration studentRegistration =
                                    StudentRegistration(
                                        email_address: emailController.text,
                                        full_name: fullNameController.text,
                                        phone_number:
                                            phoneNumberController.text,
                                        username: userNameController.text,
                                        password: passwordController.text,
                                        confirm_password:
                                            confirmPasswordController.text);
                                userProvider
                                    .userRegistration(studentRegistration)
                                    .then((regResponse) {
                                  EasyLoading.dismiss();
                                  if (regResponse['error'] != null) {
                                    ArtSweetAlert.show(
                                        context: context,
                                        artDialogArgs: ArtDialogArgs(
                                            type: ArtSweetAlertType.warning,
                                            title: 'Opps..Sorry !!',
                                            text: regResponse['error'],
                                            confirmButtonText: 'Login',
                                            onConfirm: () {
                                              Navigator.of(context).pop();
                                              Navigator.of(context)
                                                  .pushNamed('login_screen');
                                            }));
                                  } else {
                                    ArtSweetAlert.show(
                                        context: context,
                                        artDialogArgs: ArtDialogArgs(
                                            type: ArtSweetAlertType.success,
                                            title:
                                                'Congratulations !! ${regResponse['student_name']}',
                                            text: regResponse['success'],
                                            confirmButtonText: 'Login',
                                            onConfirm: () {
                                              Navigator.of(context).pop();
                                              Navigator.of(context)
                                                  .pushNamed('login_screen');
                                            }));
                                  }
                                });
                              }
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xffDB1E37)),
                            ),
                            child: Text(
                              "Sign up",
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffFFFFFF)),
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Align(
                      //   alignment: Alignment.center,
                      //   child: Text(
                      //     'or',
                      //     style: GoogleFonts.poppins(
                      //         fontSize: 14,
                      //         fontWeight: FontWeight.w400,
                      //         color: Color(0xff999DA3)),
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // Container(
                      //   width: MediaQuery.of(context).size.width,
                      //   height: 48,
                      //   decoration: BoxDecoration(
                      //       color: Color(0xffE4E7EB),
                      //       borderRadius: BorderRadius.circular(8)),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Image.asset(
                      //         'images/google.png',
                      //         height: 24,
                      //         width: 24,
                      //         fit: BoxFit.cover,
                      //       ),
                      //       const SizedBox(
                      //         width: 5,
                      //       ),
                      //       FittedBox(
                      //         child: Text(
                      //           'Continue with Google',
                      //           style: GoogleFonts.poppins(
                      //               fontSize: 16,
                      //               fontWeight: FontWeight.w500,
                      //               color: Color(0xff4B5768)),
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      const SizedBox(
                        height: 10,
                      ),
                      // Container(
                      //   width: MediaQuery.of(context).size.width,
                      //   height: 48,
                      //   decoration: BoxDecoration(
                      //       color: Color(0xffE4E7EB),
                      //       borderRadius: BorderRadius.circular(8)),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Image.asset(
                      //         'images/apple.png',
                      //         height: 24,
                      //         width: 24,
                      //       ),
                      //       const SizedBox(
                      //         width: 5,
                      //       ),
                      //       FittedBox(
                      //         child: Text(
                      //           'Continue with Apple ID',
                      //           style: GoogleFonts.poppins(
                      //               fontSize: 16,
                      //               fontWeight: FontWeight.w500,
                      //               color: Color(0xff4B5768)),
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

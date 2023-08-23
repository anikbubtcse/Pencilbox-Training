import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:screen_design/helper/helper_method.dart';
import 'package:screen_design/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:email_validator/email_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obsecureText = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
      body: Center(
        child: Container(
            margin: EdgeInsets.only(left: 25, right: 25),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Welcome back!",
                      style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff191919)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Sign in to continue",
                      style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff191919)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
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
                              if (value!.isEmpty || value == null) {
                                return 'email is required';
                              } else if (!EmailValidator.validate(value)) {
                                return 'Please give us a valid email';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'hello@example.com',
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.amber)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: Color(0xffD0D5DD))),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Password",
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff191D23))),
                            // InkWell(
                            //   onTap: () {
                            //     Navigator.of(context)
                            //         .pushNamed('forgot_password_page');
                            //   },
                            //   child: Text("Forgot password",
                            //       style: GoogleFonts.poppins(
                            //           fontSize: 13,
                            //           fontWeight: FontWeight.w300,
                            //           color: Color(0xff122E52))),
                            // ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                            height: 48,
                            child: TextFormField(
                              controller: passwordController,
                              validator: (value) {
                                if (value!.isEmpty || value == null) {
                                  return 'password is required';
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
                                    borderSide:
                                        BorderSide(color: Colors.amber)),
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
                          height: 40,
                        ),
                        Container(
                          height: 48,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  EasyLoading.show();

                                  userProvider
                                      .userLogin(emailController.text,
                                          passwordController.text)
                                      .then((response) {
                                    EasyLoading.dismiss();

                                    if (response['student_id'] != null) {
                                      HelperMethod.setStudentId(
                                          response['student_id'].toString());

                                      ArtSweetAlert.show(
                                          context: context,
                                          artDialogArgs: ArtDialogArgs(
                                              type: ArtSweetAlertType.success,
                                              title: 'Congratulations !!',
                                              text: response['success']
                                                  .toString(),
                                              confirmButtonText: 'Home',
                                              onConfirm: () {
                                                Navigator.of(context).pop();
                                                Navigator.of(context).pushNamed(
                                                    'bottom_nav_screen');
                                              }));
                                    } else {
                                      ArtSweetAlert.show(
                                          context: context,
                                          artDialogArgs: ArtDialogArgs(
                                              type: ArtSweetAlertType.warning,
                                              title: 'Opps.. Sorry !!',
                                              text: response['error'],
                                              confirmButtonText: 'Ok',
                                              onConfirm: () {
                                                Navigator.pop(context);
                                              }));
                                    }
                                  });
                                }
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xffDB1E37)),
                              ),
                              child: Text(
                                "Login",
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffFFFFFF)),
                              )),
                        ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
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
                        //           'Login with Google',
                        //           style: GoogleFonts.poppins(
                        //               fontSize: 16,
                        //               fontWeight: FontWeight.w500,
                        //               color: Color(0xff4B5768)),
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 10,
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
                        //         'images/apple.png',
                        //         height: 24,
                        //         width: 24,
                        //       ),
                        //       const SizedBox(
                        //         width: 5,
                        //       ),
                        //       FittedBox(
                        //         child: Text(
                        //           'Login with Apple ID',
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
                          height: 30,
                        ),
                        FittedBox(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don’t have an account?',
                                  style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xff4B5768)),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed('registration_screen');
                                  },
                                  child: Text(
                                    'Sign up',
                                    style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff122E52)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}

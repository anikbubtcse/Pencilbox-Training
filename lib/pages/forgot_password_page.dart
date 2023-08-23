import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController smsController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xffFFFFFF),
        elevation: 0,
      ),
      body: Container(
          margin: EdgeInsets.only(left: 25, right: 25, top: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Forgot password',
                  style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff191919)),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: SvgPicture.asset(
                    'images/forgot_password.svg',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Select which contact details should we use to reset your password',
                  style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0xffF0F0F0))),
                  height: 97,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xffFFEAEC),
                          radius: 30,
                          child: Image.asset('images/number.png'),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Via SMS',
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff928FA6)),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.8,
                              height: 35,
                              child: TextFormField(
                                controller: smsController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '+880 1518422989',
                                    hintStyle: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff191D23))),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0xffF0F0F0))),
                  height: 97,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xffFFEAEC),
                          radius: 30,
                          child: Image.asset('images/mail.png'),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Via Email',
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff928FA6)),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.8,
                              height: 35,
                              child: TextFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'fardous@bitbirds.com',
                                    hintStyle: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff191D23))),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed('code_verification_page');
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xffDB1E37)),
                      ),
                      child: Text(
                        "Continue",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFFFFFF)),
                      )),
                ),
              ],
            ),
          )),
    );
  }
}

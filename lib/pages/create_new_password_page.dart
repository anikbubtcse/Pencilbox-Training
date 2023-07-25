import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';

class CreateNewPasswordPage extends StatefulWidget {
  @override
  State<CreateNewPasswordPage> createState() => _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState extends State<CreateNewPasswordPage> {
  bool passwordObsecureText = true;
  bool confirmPasswordObsecureText = true;
  bool isChecked = false;

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
                  'Create new password',
                  style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff191919)),
                ),
                const SizedBox(
                  height: 25,
                ),
                Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset('images/create_password.svg')),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Password',
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff191D23)),
                ),
                Container(
                    height: 48,
                    child: TextFormField(
                      obscureText: passwordObsecureText,
                      decoration: InputDecoration(
                        suffixIcon: passwordObsecureText
                            ? IconButton(
                                icon: Icon(Icons.remove_red_eye),
                                onPressed: () {
                                  setState(() {
                                    passwordObsecureText = false;
                                  });
                                },
                              )
                            : IconButton(
                                icon: Icon(Icons.remove_red_eye_outlined),
                                onPressed: () {
                                  setState(() {
                                    passwordObsecureText = true;
                                  });
                                },
                              ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.amber)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Color(0xffD0D5DD))),
                      ),
                    )),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Confirm Password',
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff191D23)),
                ),
                Container(
                    height: 48,
                    child: TextFormField(
                      obscureText: confirmPasswordObsecureText,
                      decoration: InputDecoration(
                        suffixIcon: confirmPasswordObsecureText
                            ? IconButton(
                                icon: Icon(Icons.remove_red_eye),
                                onPressed: () {
                                  setState(() {
                                    confirmPasswordObsecureText = false;
                                  });
                                },
                              )
                            : IconButton(
                                icon: Icon(Icons.remove_red_eye_outlined),
                                onPressed: () {
                                  setState(() {
                                    confirmPasswordObsecureText = true;
                                  });
                                },
                              ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.amber)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Color(0xffD0D5DD))),
                      ),
                    )),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                        activeColor: Color(0xffDB1E37),
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        }),
                    Text(
                      'Remember me',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xff191D23)),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                      onPressed: () {
                        // Navigator.of(context)
                        //     .pushNamed();
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

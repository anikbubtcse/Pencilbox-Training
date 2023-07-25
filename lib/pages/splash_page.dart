import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              ClipRRect(
                child: Image.asset(
                  'images/image1.png',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 1.2,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Better way to learning is calling you!',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff000000)),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff858181)),
              ),
              const SizedBox(
                height: 60,
              ),
              Container(
                height: 48,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('registration_screen');
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xffDE1E36))),
                    child: Text(
                      "Register",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffFFFFFF)),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 48,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('login_screen');
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xffFFFFFF)),
                    ),
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffDE1E36)),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

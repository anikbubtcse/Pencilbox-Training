import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicyPage extends StatelessWidget {
  dynamic launchEmail() async {
    try {
      final Uri email = Uri(
        scheme: 'mailto',
        path: "info@pencilbox.edu.bd",
        queryParameters: {'subject': ""},
      );

      await launchUrl(email);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0F0F0),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        centerTitle: true,
        title: Text(
          'Privacy & Policy',
          style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xff878787)),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Privacy policy'.toUpperCase(),
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'This Privacy Policy was last updated on 3rd August 2022.\n\nThank you for joining the online learning marketplace. We PencilBox Training respect your privacy and want you to understand how we collect, use, and share your data. This Privacy Policy covers our data collection practices and describes your rights to access, correct, or restrict our use of your data.Unless we link to a different policy or state otherwise, this Privacy Policy applies when you visit or use the PencilBox website, mobile applications, APIs or related services (the “Services”).By using the Services, you agree to the terms of this Privacy Policy. You shouldn\’t use the Services if you don\’t agree with this Privacy Policy or any other agreement that governs your use of the Services.',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                '1. What data do we get',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                '   We collect certain data from you directly, like the information you enter yourself when you participate in courses, and from third-party platforms which connect with PencilBox. We also collect some data automatically, like information about your device and what parts of our Services you interact with or spend time using.',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                '2. HOW DO WE GET DATA ABOUT YOU',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                '  We use tools like cookies, web beacons, analytics services, and advertising providers to gather the data listed above. Some of these tools offer you the ability to opt-out of data collection.',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                '3. WHAT WE USE YOUR DATA FOR',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                '   We use your data to do things like provide our Services, communicate with you, troubleshoot issues, secure against fraud and abuse, improve and update our Services, analyze how people use our Services, serve personalized advertising, and as required by law or necessary for safety and integrity.',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                '4. WHO WE SHARE YOUR DATA WITH',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                '   We share certain data about you with instructors, other students, companies performing services for us, PencilBox affiliates, our business partners, analytics and data enrichment providers, your social media providers, companies helping us run promotions and surveys, and advertising companies who help us promote our Services. We may also share your data as needed for security, legal compliance, or as part of a corporate restructuring. Lastly, we can share data in other ways if it is aggregated or de-identified or if we get your consent.',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                '5. SECURITY',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                '    We use appropriate security based on the type of data and sensitivity. As with any internet-enabled system, there is always a risk of unauthorized access, so it’s important to protect your password. If you suspect any unauthorized access to your account, please contact us as soon as possible.',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                '6. YOUR RIGHTS',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                '    You have certain rights around the use of your data, including the ability to opt-out of promotional emails, cookies, and collection of your data by certain analytics providers. You can update or terminate your account from within our Services, and can also contact us for individual rights requests about your data. Parents who believe we’ve unintentionally collected personal data about their underage child should contact us for help deleting that information.',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                '7. UPDATES & CONTACT INFO',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  text:
                      '   When we make a material change to this policy, we’ll notify users via email, in-product notice, or another mechanism required by law. Changes become effective the day they’re posted. Please contact us via email or postal mail with any questions, concerns, or disputes.If you have any questions about our use of cookies, please email us at ',
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff212121)),
                  children: <TextSpan>[
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchEmail();
                        },
                      text: 'info@pencilbox.edu.bd',
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

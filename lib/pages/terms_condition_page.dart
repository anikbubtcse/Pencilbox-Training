import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsConditionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0F0F0),
        appBar: AppBar(
          backgroundColor: const Color(0xffFFFFFF),
          centerTitle: true,
          title: Text(
            'Terms & Conditions',
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
                  'Terms & conditions'.toUpperCase(),
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'These Terms of Use were last updated on 3rd August 2022.\n\nPencilBox\'s mission is to improve lives through learning. We enable anyone anywhere to create and share educational courses (instructors) and to enrol in these educational courses to learn (students). We consider our marketplace model the best way to offer valuable educational content to our users. We have rules to keep our platform and services safe for our students and instructors communities. These Terms apply to all your activities on the PencilBox website, PencilBox mobile applications, our TV applications, our APIs and other related services.\nIf you live in Bangladesh, by agreeing to these Terms, you agree to resolve disputes with PencilBox through binding arbitration (with very limited exceptions, not in court), and you waive certain rights to participate in class actions, as detailed in the Dispute Resolution section.',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '1. Accounts',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '    You need an account for most activities on our platform. Keep your password safe, because you’re responsible for all activity associated with your account. If you suspect someone else is using your account, let us know by contacting our Support Team. You must have reached the age of consent for online services in your country to use PencilBox.\n\nYou need an account for most activities on our platform, including purchasing and enrolling in a course or offering a course for publication. When setting up and maintaining your account, you must provide and continue to provide accurate and complete information, including a valid email address. You have to take responsibility for your account and everything that happens on your account, including any harm or damage (to us or anyone else) caused by someone using your account without your permission. That means you need to be very careful with your password. You may not transfer your account to someone else or use someone else’s account. If you contact us to request access to an account, we will not grant you such access unless you can provide us with the information. You have to prove that you are the owner of that account. In the event of the death of a user, the account of that user will be closed.\n\nYou can terminate your account at any time by following the steps here. Check our Privacy Policy to see what happens when you terminate your account.',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  '2. COURSE ENROLLMENT AND LIFETIME ACCESS',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '    When you enrol in a course, you get a license from us to view it via the PencilBox Services and for no other use. Don’t try to transfer or resell courses in any way. We grant you a lifetime access license, except when we must disable the course because of legal or policy reasons.',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  '3. PAYMENTS AND REFUNDS',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  ' a. Payments:',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'When you make a payment, you agree to use a valid payment method. You agree to pay the fees for courses that you purchase, and you authorize us to charge your debit or credit card or process other means of payment (American Express, DBBL Nexus, VISA, MasterCard, UnionPay, bKash, Rocket or another mobile wallet) for those fees. PencilBox works with third-party payment processing partners to offer you the most convenient payment methods in your country and to keep your payment information secure. Check out our Privacy Policy for more details.',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'b. Refunds and Refund Credits:',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'If the course you purchased is not what you were expecting, you can request, within 7 days of your purchase of the course, that PencilBox apply a refund to your account. We reserve the right to apply for your refund as a refund credit or a refund to your original payment method, at our discretion, depending on the capabilities of our payment processing partners, the platform from which you purchased your course and other factors. No refund is due to you if you request it after the 7-day guarantee time limit has passed. However, if a course you previously purchased is disabled for legal or policy reasons, you are entitled to a refund beyond this 7-day limit. PencilBox also reserves the right to refund students beyond the 7-day limit in cases of suspected or confirmed account fraud.',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '4. CONTENT AND BEHAVIOR RULES',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '   You can only use PencilBox for lawful purposes. You’re responsible for all the content that you post on our platform. You should keep the reviews, questions, posts, courses and other content you upload in line with our Trust & Safety Guidelines and the law, and respect the intellectual property rights of others. We can ban your account for repeated or major offences. If you think someone is infringing your copyright on our platform, let us know.',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '5. PENCILBOX RIGHTS TO THE CONTENT OF YOUR POST',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '   You retain ownership of the content you post to our platform, including your courses. We’re allowed to share your content with anyone through any media, including promoting it via advertising on other websites.',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'The content you post as a student or instructor (including courses) remains yours. By posting courses or other content, you allow PencilBox to reuse and share it but you do not lose any ownership rights you may have over your content. If you are an instructor, be sure to understand the course licensing terms that are detailed in the Instructor Terms.',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '6. USING PENCILBOX AT YOUR OWN RISK',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '   Anyone can use PencilBox to create and publish courses and instructors. We enable instructors and students to interact for teaching and learning. Like other platforms where people can post content and interact, some things can go wrong, and you use PencilBox at your own risk.',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Our platform model means we do not review or edit the courses for legal issues, and we are not in a position to determine the legality of course content. We do not exercise any editorial control over the courses that are available on the platform. We do not guarantee any manner, reliability, validity, accuracy, or truthfulness of the courses. If you enrol in a course, you rely on any information provided by an instructor at your own risk.',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '7. UPDATING THESE TERMS',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '   From time to time, we may update these Terms to clarify our practices or to reflect new or different practices (such as when we add new features), and PencilBox reserves the right in its sole discretion to modify and/or make changes to these Terms at any time. Your continued use of our Services after changes become effective shall mean that you accept those changes. Any revised Terms shall supersede all previous Terms.',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '8. HOW TO CONTACT US',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '  The best way to get in touch with us is to contact our Support Team. We’d love to hear your questions, concerns, and feedback about our Services.',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Thanks for teaching and learning with us!',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          ),
        ));
  }
}

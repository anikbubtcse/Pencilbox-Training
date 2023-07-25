import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePageDrawerRow extends StatefulWidget {
  String imageLink;
  String title;

  HomePageDrawerRow(this.imageLink, this.title);

  @override
  State<HomePageDrawerRow> createState() => _HomePageDrawerRowState();
}

class _HomePageDrawerRowState extends State<HomePageDrawerRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(widget.imageLink),
        const SizedBox(
          width: 15,
        ),
        Text(
          widget.title,
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}

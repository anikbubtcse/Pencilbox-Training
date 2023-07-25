import 'package:flutter/material.dart';
import 'package:screen_design/provider/course_provider.dart';
import '../models/course_model.dart';
import 'course_blog_search_delegate.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatefulWidget {
  String title;
  IconData icon;

  Header({required this.title, required this.icon});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                color: Colors.white,
                size: 30,
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                widget.title,
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              )
            ],
          ),
        ),
        // const SizedBox(
        //   width: 30,
        // ),
        IconButton(
            onPressed: () {
              showSearchResult();
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ))
      ],
    );
  }

  void showSearchResult() {
    final provider =
        Provider.of<CourseProvider>(context, listen: false);
    List<CourseModel> courseList = provider.fullCourseList;
    showSearch(context: context, delegate: CourseBlogSearchDelegate())
        .then((value) {
      courseList.forEach((element) {
        if (element.batchId == value) {
          Navigator.of(context)
              .pushNamed('course_module-page', arguments: element);
        }
      });
    });
  }
}

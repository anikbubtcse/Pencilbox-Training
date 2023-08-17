import 'package:flutter/material.dart';
import 'package:screen_design/pages/blog_page.dart';
import 'package:screen_design/pages/course_page.dart';
import 'package:screen_design/pages/profile_page.dart';
import 'package:screen_design/pages/search_page.dart';
import 'favorite_page.dart';
import 'home_page.dart';

class BottomNavigationPage extends StatefulWidget {
  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int selectedIndex = 0;
  List<Widget> pages = [
    HomePage(),
    SearchPage(),
    CoursePage(),
    BlogPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xffDE1E36),
        unselectedItemColor: Color(0xff000000),
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('images/home.png'),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('images/search.png'),
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('images/course.png'),
            ),
            label: 'Course',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('images/blog.png'),
            ),
            label: 'Blog',
          ),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('images/user.png'),
              ),
              label: 'Profile'),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
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
  int _selectedIndex = 0;
  List<Widget> pages = [
    HomePage(),
    SearchPage(),
    CoursePage(),
    FavoritePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xffDE1E36),
        unselectedItemColor: Color(0xff000000),
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
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
              AssetImage('images/favorite.png'),
            ),
            label: 'Favorite',
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

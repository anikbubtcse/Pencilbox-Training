import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, // Fix the orientation to portrait mode
    ]);

    Timer(Duration(seconds: 7), () {
      Navigator.of(context).pushReplacementNamed('bottom_nav_screen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SimpleCircularProgressBar(
              progressColors: [Colors.amber, Colors.red],
              progressStrokeWidth: 2,
              size: 135,
              backStrokeWidth: 0,
              mergeMode: true,
              animationDuration: 4,
            ),
            CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('images/pencilbox.png'),
              radius: 50,
            )
          ],
        ),
      ),
    );
  }
}

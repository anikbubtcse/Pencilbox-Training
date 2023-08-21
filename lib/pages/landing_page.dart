import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:screen_design/provider/area_provider.dart';
import 'package:screen_design/provider/career_provider.dart';
import 'package:screen_design/provider/event_provider.dart';
import 'package:screen_design/provider/faq_provider.dart';
import 'package:screen_design/provider/trainer_provider.dart';
import 'package:screen_design/provider/user_provider.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import '../provider/blog_provider.dart';
import '../provider/course_module_provider.dart';
import '../provider/course_provider.dart';
import 'package:provider/provider.dart';


class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late CourseProvider courseProvider;
  late BlogProvider blogProvider;
  late EventProvider eventProvider;
  late CareerProvider careerProvider;
  late UserProvider userProvider;
  late FaqProvider faqProvider;
  late TrainerProvider trainerProvider;
  late CourseModuleProvider courseModuleProvider;
  late AreaProvider areaProvider;
  bool callOnce = true;
  late Timer timer;


  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, // Fix the orientation to portrait mode
    ]);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    courseProvider = Provider.of(context);
    blogProvider = Provider.of(context);
    eventProvider = Provider.of(context);
    careerProvider = Provider.of(context);
    faqProvider = Provider.of(context);
    trainerProvider = Provider.of(context);
    courseModuleProvider = Provider.of(context);
    userProvider = Provider.of(context);
    areaProvider = Provider.of(context);

    if (callOnce) {
      blogProvider.getLatestBlogServiceData();
      blogProvider.getBlogCategoryServiceData();
      courseProvider.getCourseServiceData();
      blogProvider.getPopularBlogServiceData();
      blogProvider.getArchivesBlogServiceData();
      careerProvider.getAllCareerInfo();
      eventProvider.getEvents();
      faqProvider.getFaqService();
      trainerProvider.getTrainerServiceData();
      trainerProvider.getAllTrainingSchedules();
      courseModuleProvider.getCourseModuleServiceData();
      userProvider.getAllStudentReviews();
      areaProvider.getAllDistrict();
      areaProvider.getAllSubDistrict();
      callOnce = false;
    }

    timer = Timer(const Duration(seconds: 5), () {
     Navigator.of(context).pushReplacementNamed('bottom_nav_screen');
     // Navigator.of(context).pushReplacementNamed('checkout_page');
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
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
              animationDuration: 2,
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

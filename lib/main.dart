import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:screen_design/pages/blog_list_page.dart';
import 'package:screen_design/pages/bottom_nav_page.dart';
import 'package:screen_design/pages/category_detail_page.dart';
import 'package:screen_design/pages/code_verification_page.dart';
import 'package:screen_design/pages/contact_page.dart';
import 'package:screen_design/pages/course_module_page.dart';
import 'package:screen_design/pages/create_new_password_page.dart';
import 'package:screen_design/pages/edit_profile_page.dart';
import 'package:screen_design/pages/forgot_password_page.dart';
import 'package:screen_design/pages/home_page.dart';
import 'package:screen_design/pages/landing_page.dart';
import 'package:screen_design/pages/login_page.dart';
import 'package:screen_design/pages/course_page.dart';
import 'package:screen_design/pages/my_course_page.dart';
import 'package:screen_design/pages/new_blog_page.dart';
import 'package:screen_design/pages/notification_controller.dart';
import 'package:screen_design/pages/notification_page.dart';
import 'package:screen_design/pages/privacy_policy_page.dart';
import 'package:screen_design/pages/profile_page.dart';
import 'package:screen_design/pages/review_page.dart';
import 'package:screen_design/pages/terms_condition_page.dart';
import 'package:screen_design/pages/read_blog_page.dart';
import 'package:screen_design/pages/registration_page.dart';
import 'package:screen_design/pages/splash_page.dart';
import 'package:screen_design/pages/trainer_page.dart';
import 'package:screen_design/provider/blog_provider.dart';
import 'package:screen_design/provider/course_module_provider.dart';
import 'package:screen_design/provider/trainer_provider.dart';
import 'package:screen_design/provider/course_provider.dart';
import 'package:provider/provider.dart';
import 'package:screen_design/provider/user_provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => CourseProvider()),
    ChangeNotifierProvider(
        create: (_) => TrainerProvider()..getTrainerServiceData()),
    ChangeNotifierProvider(create: (_) => CourseModuleProvider()),
    ChangeNotifierProvider(create: (_) => BlogProvider()),
    ChangeNotifierProvider(create: (_) => UserProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          builder: EasyLoading.init(),
          title: 'Flutter Demo',
          theme: ThemeData(
            scrollbarTheme: ScrollbarThemeData(
              thumbVisibility: MaterialStateProperty.all(true),
              thickness: MaterialStateProperty.all(4),
              thumbColor: MaterialStateProperty.all(Colors.red),
              radius: const Radius.circular(10),
            ),
            primarySwatch: Colors.amber,
          ),
          initialRoute: '/',
          routes: {
            '/': (_) => LandingPage(),
            'home_page': (_) => HomePage(),
            'splash_page': (_) => SplashPage(),
            'login_screen': (_) => LoginPage(),
            'registration_screen': (_) => RegistrationPage(),
            'bottom_nav_screen': (_) => BottomNavigationPage(),
            'category_detail_screen': (_) => CategoryDetailPage(),
            'course_module-page': (_) => CourseModulePage(),
            'read_blog_page': (_) => ReadBlogPage(),
            'blog_list_page': (_) => BlogListPage(),
            'edit_profile_page': (_) => EditProfilePage(),
            'new_blog_page': (_) => NewBlogPage(),
            'forgot_password_page': (_) => ForgotPasswordPage(),
            'code_verification_page': (_) => CodeVerificationPage(),
            'create_new_password_page': (_) => CreateNewPasswordPage(),
            'trainer_page': (_) => TrainerPage(),
            'contact_page': (_) => ContactPage(),
            'terms_condition_page': (_) => TermsConditionPage(),
            'privacy_policy_page': (_) => PrivacyPolicyPage(),
            'notification_page': (_) => NotificationPage(),
            'notification_controller': (_) => NotificationController(),
            'review_page': (_) => ReviewPage(),
            'course_page': (_) => CoursePage(),
            'my_course_page': (_) => MyCoursePage(),
            'profile_page': (_) => ProfilePage(),
            'course_module_page': (_) => CourseModulePage(),
          },
        );
      },
    );
  }
}

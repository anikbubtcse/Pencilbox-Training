

import 'dart:io';
import 'dart:math';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:app_settings/app_settings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:screen_design/provider/blog_provider.dart';
import 'package:screen_design/provider/course_provider.dart';
import '../pages/contact_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class NotificationServices {

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin=FlutterLocalNotificationsPlugin();

  requestForPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert : true,
      announcement : true,
      badge : true,
      carPlay : true,
      criticalAlert : true,
      provisional : true,
      sound : true,
    );

    if(settings.authorizationStatus==AuthorizationStatus.authorized){
      print('Permission granted');
    }
    else if(settings.authorizationStatus==AuthorizationStatus.provisional){
      print('Permission granted provosional');
    }
    else {
      AppSettings.openNotificationSettings().then((value) {});
      print('Permission denied');
    }
  }

  initLocalNotification(BuildContext context,RemoteMessage message)async{
    var androidSettings= AndroidInitializationSettings('mipmap/launcher_icon');
    var iosSettings=const DarwinInitializationSettings();

    var intialization=InitializationSettings(
        android: androidSettings,
        iOS: iosSettings
    );
    await _localNotificationsPlugin.initialize(intialization,onDidReceiveNotificationResponse: (payload){
      handleMessage(context,message);
    }
    );
  }

  Future<void> showNotification(RemoteMessage message) async{

    AndroidNotificationChannel channel=AndroidNotificationChannel(Random.secure().nextInt(1000).toString(),
        'High Importance nitification',importance: Importance.high);

   //// extra
    final BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
      //additional text
      message.data['details'], // Expanded Text
      htmlFormatContentTitle: true, // Optional: Format text as HTML
      htmlFormatSummaryText: true, // Optional: Format text as HTML
    );


    // Create a custom image layout for the notification

    final largeIconPath=await downloadFile(
      message.data['icon'],
      'largeIcon'
    );

    final bigPicturePath=await downloadFile(
        message.data['image'],
        'bigPicture'
    );

    final imageStyleInformation=BigPictureStyleInformation(
      FilePathAndroidBitmap(bigPicturePath),
      contentTitle: message.data['content_title'],
      summaryText: message.data['summary'],
      largeIcon: FilePathAndroidBitmap(largeIconPath)
    );



    AndroidNotificationDetails androidNotificationDetails=AndroidNotificationDetails(
        channel.id.toString(),
        channel.name.toString(),
        channelDescription: 'My loading description',
        priority: Priority.high,
        importance: Importance.high ,
        ticker: 'Ticker',
        styleInformation: imageStyleInformation
        // styleInformation: bigTextStyleInformation
    );

    DarwinNotificationDetails details=DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true
    );

    NotificationDetails notificationDetails=NotificationDetails(
      android: androidNotificationDetails,
      // iOS: details
    );

    await _localNotificationsPlugin.show(
        0,
        message.notification!.title.toString(),
        message.notification!.body.toString(),
        notificationDetails,

    );

  }

  void firebaseInit(BuildContext context,){
    FirebaseMessaging.onMessage.listen((message) {

      if(kDebugMode){
        print('Title :${message.notification!.title.toString()}');
        print('Body : ${message.notification!.body.toString()}');
        print('Data : ${message.data.toString()}');
      }
      if(Platform.isAndroid){
        initLocalNotification(context, message);
        showNotification(message);
      }
      else {

      }

    });
  }

  Future<String> getTokens()async{
    String? token=await messaging.getToken();
    return token!;
  }

  void isTokenExperied(){
    messaging.onTokenRefresh.listen((event) {
      event.toString();
      print('refresh');
    });
  }

  void handleMessage(BuildContext context,RemoteMessage message){

    if(message.data['data']=='new_course'){
      String trainingId=message.data['id'];
       print(message.data['id']);
      CourseProvider courseProvider = Provider.of(context, listen: false);
      print('courseProvider ${courseProvider.upcomingCourseList.length}');
     courseProvider.upcomingCourseList.forEach((element) {
       if(element.trainingId.toString()==trainingId){
         print('matched....');
         Navigator.of(context).pushNamed(
             'course_module_page',
             arguments: element);
       }
     });
    }

    if(message.data['data']=='new_blog'){
      String blogId=message.data['id'];
      print(message.data['id']);
      BlogProvider blogProvider = Provider.of(context, listen: false);
      print('blogProvider ${blogProvider.allLatestBlogList.length}');
      blogProvider.allLatestBlogList.forEach((element) {
        if(element.id.toString()==blogId){
          print('matched....');
          Navigator.of(context).pushNamed(
              'read_blog_page',
              arguments: [
                1,
                element
              ]);
        }
      });
    }



  }

  Future<void> setupInteractMessage(BuildContext context)async{
    //when app is terminated
    RemoteMessage? initialMessage=await FirebaseMessaging.instance.getInitialMessage();

    if(initialMessage!=null){
      handleMessage(context, initialMessage);
    }

    //when app is in background
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleMessage(context, event);
    });

  }

  downloadFile(String url, String fileName) async{
    final directory=await getApplicationDocumentsDirectory();
    final filePath='${directory.path}/$fileName';
    final response=await http.get(Uri.parse(url));
    final file=File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;

  }

}

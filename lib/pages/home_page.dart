import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/services.dart';
import 'package:screen_design/custom/home_page_drawer.dart';
import 'package:screen_design/helper/helper_method.dart';
import 'package:screen_design/models/course_model.dart';
import 'package:screen_design/provider/trainer_provider.dart';
import 'package:screen_design/provider/course_provider.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../custom/main_app_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrader/upgrader.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPosition = 0;
  late CourseProvider courseProvider;
  late StreamSubscription<ConnectivityResult> subscription;
  List<String> favoriteList = [];

  addToFavorite() async {
    final SharedPreferences favoritePrefs =
        await SharedPreferences.getInstance();
    favoriteList = favoritePrefs.getStringList('items') ?? [];
  }

  @override
  initState() {
    addToFavorite();

    checkConnectivity();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
      } else {
        setState(() {
          showNoNetworkDialog();
        });
      }
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    courseProvider = Provider.of(context, listen: true);
    courseProvider.getCarouselSliderCourses();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0F0F0),
      appBar: MainAppBar(title: ''),
      drawer: HomePageDrawer(),
      body: UpgradeAlert(
        upgrader: Upgrader(dialogStyle: UpgradeDialogStyle.cupertino),
        child: ListView(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          children: [
            CarouselSlider(
              items: courseProvider.carouselSliderCourseList.map((item) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      'https://pencilbox.edu.bd/${item.trainingImage}',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 150,
                autoPlay: true,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentPosition = index;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            DotsIndicator(
              dotsCount: courseProvider.carouselSliderCourseList.isEmpty
                  ? 1
                  : courseProvider.carouselSliderCourseList.length,
              position: currentPosition,
              decorator: DotsDecorator(
                  size: Size(6, 6),
                  spacing: EdgeInsets.only(left: 5, right: 5),
                  activeSize: Size(8, 8),
                  activeColor: Colors.deepOrange,
                  color: Colors.deepOrange.withOpacity(0.5)),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Categories',
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.w500),
                )),
            const SizedBox(
              height: 10,
            ),
            courseProvider.courseCategoryList.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Container(
                    height: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: courseProvider.courseCategoryList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: 120,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  'category_detail_screen',
                                  arguments: [
                                    courseProvider
                                        .courseCategoryList[index].catName,
                                    1
                                  ]);
                            },
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                      child: Image.network(
                                    'https://pencilbox.edu.bd/${courseProvider.courseCategoryIconList[index]}',
                                    fit: BoxFit.cover,
                                    height: 25,
                                    width: 25,
                                  )),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  AutoSizeText(
                                    courseProvider.courseCategoryList[index]
                                            .catName ??
                                        '',
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Upcoming Courses',
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Text(
                  'See all',
                  style: GoogleFonts.poppins(fontSize: 14, color: Colors.red),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            courseProvider.upcomingCourseList.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Container(
                    height: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? MediaQuery.of(context).size.width / 1.3
                        : MediaQuery.of(context).size.width / 1.9,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: courseProvider.upcomingCourseList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(19)),
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            width: MediaQuery.sizeOf(context).width / 1.4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.width / 2.5,
                                  child: Stack(
                                    children: [
                                      AspectRatio(
                                        aspectRatio: 2 / 1,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(19),
                                          child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl:
                                                'https://pencilbox.edu.bd/${courseProvider.upcomingCourseList[index].trainingImage!}',
                                            placeholder: (context, url) =>
                                                const Center(
                                                    child:
                                                        CircularProgressIndicator()),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Image.asset(
                                              'images/placeholder.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          top: 0,
                                          right: 0,
                                          child: InkWell(
                                            onTap: () {
                                              final course = courseProvider
                                                  .upcomingCourseList[index];
                                              addOrRemoveFromFavList(course);
                                            },
                                            child: CircleAvatar(
                                              radius: 12,
                                              backgroundColor:
                                                  Colors.grey.withOpacity(0.5),
                                              child: Icon(
                                                Icons.favorite_outline,
                                                color: favoriteList.contains(
                                                        courseProvider
                                                            .upcomingCourseList[
                                                                index]
                                                            .id
                                                            .toString())
                                                    ? Colors.red
                                                    : Colors.black,
                                                size: 20,
                                              ),
                                            ),
                                          )),
                                      Consumer<TrainerProvider>(builder:
                                          (BuildContext context, provider,
                                              child) {
                                        provider.getTrainerDetails(
                                            courseProvider
                                                .upcomingCourseList[index]
                                                .trainerId!);

                                        return Positioned(
                                          bottom: 0,
                                          left: 0,
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.5)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Row(
                                                children: [
                                                  ClipOval(
                                                    child: CachedNetworkImage(
                                                      imageUrl:
                                                          'https://pencilbox.edu.bd/${provider.trainerImage}',
                                                      placeholder: (context,
                                                              url) =>
                                                          CircularProgressIndicator(),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Icon(Icons.error),
                                                      height: 30,
                                                      width: 30,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Text(
                                                    provider.trainerName ?? " ",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    courseProvider.upcomingCourseList[index]
                                        .trainingName!,
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff292929)),
                                    maxLines: 2,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${courseProvider.upcomingCourseList[index].trainingPrice!}/-BDT',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xffDB1E37)),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(
                                            'course_module_page',
                                            arguments: courseProvider
                                                .upcomingCourseList[index]);
                                      },
                                      child: Container(
                                        width: 75,
                                        decoration: BoxDecoration(
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.black54,
                                                  blurRadius: 3,
                                                  offset: Offset(0.0, 0.25))
                                            ],
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8,
                                              right: 8,
                                              top: 5,
                                              bottom: 5),
                                          child: Text(
                                            'Apply Now',
                                            style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(Icons.access_time,
                                              color: Color(0xff808080)),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            '${courseProvider.upcomingCourseList[index].hours}h',
                                            style: const TextStyle(
                                                color: Color(0xff808080)),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(Icons.date_range,
                                              color: Color(0xff808080)),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            HelperMethod.getDateFormat(
                                                'dd-MM-yyyy',
                                                DateTime.parse(courseProvider
                                                    .upcomingCourseList[index]
                                                    .startDate!)),
                                            style: const TextStyle(
                                                color: Color(0xff808080)),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }

  void showNoNetworkDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext alertContext) {
          return AlertDialog(
            title: Text('Please Check your Internet Connection'),
            content: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(alertContext).pop();
                    SystemNavigator.pop();
                  },
                  child: Text('Cancel')),
            ),
          );
        });
  }

  Future<void> checkConnectivity() async {
    String status = await HelperMethod.checkConnectivity();

    if (status == "Not Connected") {
      showNoNetworkDialog();
    } else {}
  }

  void addOrRemoveFromFavList(CourseModel course) async {
    if (favoriteList.contains(course.id.toString())) {
      favoriteList.remove(course.id.toString());
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Successfully Removed from your favourite list')));
    } else {
      favoriteList.add(course.id.toString());
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Successfully Added to your favourite list')));
    }

    final SharedPreferences favoritePrefs = await SharedPreferences.getInstance();
    Set<String> stringSet = Set<String>();
    stringSet.addAll(favoriteList);
    favoriteList.clear();
    favoriteList.addAll(stringSet);
    await favoritePrefs.setStringList('items', favoriteList);
    setState(() {});
  }
}

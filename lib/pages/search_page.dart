import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../provider/course_provider.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  bool isChecked = false;
  ScrollController scrollController = ScrollController();
  late CourseProvider upcomingCourseProvider;
  String courseInfo = '';
  List<String> selectedCategoryList = [];

  @override
  void didChangeDependencies() {
    upcomingCourseProvider = Provider.of(context, listen: true);
    print(selectedCategoryList.length);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    scrollController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F0F0),
      body: SafeArea(
        child: Container(
            padding:
                const EdgeInsets.only(left: 20, right: 15, top: 20, bottom: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    child: TextField(
                      controller: searchController,
                      onChanged: (value) {
                        setState(() {
                          courseInfo = value;

                          if (courseInfo.isNotEmpty) {
                            isChecked = true;
                          }

                          if (courseInfo.isEmpty) {
                            isChecked = false;
                          }
                        });
                      },
                      decoration: InputDecoration(
                        suffixIcon: searchController.text.isNotEmpty
                            ? Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 12.0),
                                child: IconButton(
                                  iconSize: 20,
                                  icon: const Icon(
                                    Icons.cancel,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      searchController.clear();
                                      isChecked = false;
                                      courseInfo = '';
                                    });
                                  },
                                ),
                              )
                            : null,
                        hintText: 'Search Courses',
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Colors.transparent, width: 1)),
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: upcomingCourseProvider.fullCourseList.length,
                    itemBuilder: (contex, index) {
                      if (courseInfo.isEmpty) {
                        return Container();
                      } else if (upcomingCourseProvider
                              .fullCourseList[index].trainingName
                              .toString()
                              .toLowerCase()
                              .contains(courseInfo.toLowerCase()) ||
                          upcomingCourseProvider
                              .fullCourseList[index].currentBatchId
                              .toString()
                              .toLowerCase()
                              .startsWith(courseInfo.toLowerCase())) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    'course_module-page',
                                    arguments: upcomingCourseProvider
                                        .fullCourseList[index]);
                              },
                              child: ListTile(
                                dense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 0.0, vertical: 0.0),
                                visualDensity:
                                    VisualDensity(horizontal: 0, vertical: -4),
                                title: Text(
                                  upcomingCourseProvider
                                      .fullCourseList[index].trainingName!,
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff212121)),
                                ),
                                subtitle: Text(
                                  'Batch No: ${upcomingCourseProvider.fullCourseList[index].currentBatchId!.toString()}',
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff212121)),
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                  isChecked == false
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Top Searches',
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff212121)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        'category_detail_screen',
                                        arguments: ['Marketing', 2]);
                                  },
                                  child: Container(
                                    height: 39,
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(19),
                                        border: Border.all(
                                            color: Color(0xffDDDDDD))),
                                    child: Text(
                                      'Marketing',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff262626)),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        'category_detail_screen',
                                        arguments: ['UI Design', 2]);
                                  },
                                  child: Container(
                                    height: 39,
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(19),
                                        border: Border.all(
                                            color: Color(0xffDDDDDD))),
                                    child: Text(
                                      'UI Design',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff262626)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        'category_detail_screen',
                                        arguments: ['Excel', 2]);
                                  },
                                  child: Container(
                                    height: 39,
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(19),
                                        border: Border.all(
                                            color: Color(0xffDDDDDD))),
                                    child: Text(
                                      'Excel',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff262626)),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        'category_detail_screen',
                                        arguments: ['Flutter', 2]);
                                  },
                                  child: Container(
                                    height: 39,
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(19),
                                        border: Border.all(
                                            color: Color(0xffDDDDDD))),
                                    child: Text(
                                      'Flutter',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff262626)),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        'category_detail_screen',
                                        arguments: ['Web Design', 2]);
                                  },
                                  child: Container(
                                    height: 39,
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(19),
                                        border: Border.all(
                                            color: Color(0xffDDDDDD))),
                                    child: Text(
                                      'Web Design',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff262626)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Text(
                              'Categories',
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff212121)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 280,
                              child: upcomingCourseProvider
                                      .courseCategoryList.isEmpty
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : Scrollbar(
                                      trackVisibility: true,
                                      controller: scrollController,
                                      child: ListView.builder(
                                          controller: scrollController,
                                          itemCount: upcomingCourseProvider
                                              .courseCategoryList.length,
                                          itemBuilder: (context, index) {
                                            return Row(
                                              children: [
                                                Checkbox(
                                                  activeColor: Colors.red,
                                                  value: upcomingCourseProvider
                                                      .courseCategoryList[
                                                          index]
                                                      .categoryChecked,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      upcomingCourseProvider
                                                          .courseCategoryList[
                                                              index]
                                                          .categoryChecked = value!;
                                                    });
                                                  },
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  upcomingCourseProvider
                                                      .courseCategoryList[
                                                          index]
                                                      .catName!,
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xff262626)),
                                                )
                                              ],
                                            );
                                          }),
                                    ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 45,
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color((0xffDE1E36))),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                                  ),
                                  onPressed: () {
                                    for (var i = 0;
                                        i <=
                                            upcomingCourseProvider
                                                    .courseCategoryList
                                                    .length -
                                                1;
                                        i++) {
                                      if (upcomingCourseProvider
                                              .courseCategoryList[i]
                                              .categoryChecked ==
                                          true) {
                                        setState(() {
                                          selectedCategoryList.add(
                                              upcomingCourseProvider
                                                  .courseCategoryList[i]
                                                  .catName!);
                                        });
                                      }
                                    }

                                    if (selectedCategoryList.isNotEmpty) {
                                      Navigator.of(context).pushNamed(
                                          'category_detail_screen',
                                          arguments: [
                                            selectedCategoryList,
                                            3
                                          ]).then((value) {
                                        setState(() {
                                          selectedCategoryList.clear();
                                        });
                                        for (var i = 0;
                                            i <=
                                                upcomingCourseProvider
                                                        .courseCategoryList
                                                        .length -
                                                    1;
                                            i++) {
                                          setState(() {
                                            upcomingCourseProvider
                                                .courseCategoryList[i]
                                                .categoryChecked = false;
                                          });
                                        }
                                      });
                                    }
                                  },
                                  child: Text(
                                    'SHOW RESULTS',
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xffFFFFFF)),
                                  )),
                            )
                          ],
                        )
                      : Container(),
                ],
              ),
            )),
      ),
    );
  }
}

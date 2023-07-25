import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_design/helper/helper_method.dart';
import 'package:screen_design/provider/course_provider.dart';
import 'package:screen_design/provider/user_provider.dart';
import '../models/student_info_model.dart';
import 'package:provider/provider.dart';

import '../provider/trainer_provider.dart';

class MyCoursePage extends StatefulWidget {
  const MyCoursePage({super.key});

  @override
  State<MyCoursePage> createState() => _MyCoursePageState();
}

class _MyCoursePageState extends State<MyCoursePage> {
  StudentInfoModel? studentInfoModel;
  late UserProvider userProvider;
  late CourseProvider upcomingCourseProvider;
  late TrainerProvider trainerProvider;

  @override
  void didChangeDependencies() {
    userProvider = Provider.of(context);
    upcomingCourseProvider = Provider.of(context);
    trainerProvider = Provider.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F0F0),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        centerTitle: true,
        title: Text(
          'My Courses',
          style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xff878787)),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: userProvider.billingList.isEmpty
                ? const Center(child: Text('No course found!'))
                : ListView.builder(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    itemCount: userProvider.billingList.length,
                    itemBuilder: (context, index) {
                      int trainingId = upcomingCourseProvider
                          .getMyCoursesTrainerId(userProvider.billingList[index]
                              .courseRegStudents!.batch!.training!.id!
                              .toString());
                      String trainerName =
                          trainerProvider.getMyCourseTrainerName(trainingId);

                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 3,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(19),
                                  child: Image.network(
                                    'https://pencilbox.edu.bd/${userProvider.billingList[index].courseRegStudents!.batch!.training!.trainingImage!}',
                                    height:
                                        MediaQuery.of(context).size.width / 3,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 5,
                                child: SizedBox(
                                  height: MediaQuery.of(context).size.width / 3,
                                  child: Stack(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 15),
                                                child: Text(
                                                  userProvider
                                                      .billingList[index]
                                                      .courseRegStudents!
                                                      .batch!
                                                      .training!
                                                      .trainingName!,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xffDE1E36),
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Text(
                                                trainerName,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w300,
                                                  color: Color(0xff716F6F),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.access_time,
                                                    color: Color(0xff808080),
                                                    size: 13,
                                                  ),
                                                  const SizedBox(
                                                    width: 2,
                                                  ),
                                                  Text(
                                                    '${userProvider.billingList[index].courseRegStudents!.batch!.hours!.toString()} h',
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: Color(0xff808080),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.date_range,
                                                    color: Color(0xff808080),
                                                    size: 13,
                                                  ),
                                                  const SizedBox(
                                                    width: 2,
                                                  ),
                                                  Text(
                                                    HelperMethod.getDateFormat(
                                                        'dd-MM-yyyy',
                                                        DateTime.parse(userProvider
                                                            .billingList[index]
                                                            .courseRegStudents!
                                                            .batch!
                                                            .startDate!)),
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: Color(0xff808080),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Positioned(
                                        top: -15,
                                        right: -10,
                                        child: IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.favorite_border_outlined,
                                              color: Color(
                                                0xffDB1E37,
                                              ),
                                              size: 13,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
          ),
        ],
      ),
    );
  }
}

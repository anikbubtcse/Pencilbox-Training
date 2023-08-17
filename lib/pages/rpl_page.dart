import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_design/provider/course_provider.dart';
import 'package:provider/provider.dart';
import 'package:screen_design/provider/trainer_provider.dart';
import 'package:screen_design/provider/user_provider.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../helper/helper_method.dart';

class RPLPage extends StatefulWidget {
  const RPLPage({super.key});

  @override
  State<RPLPage> createState() => _RPLPageState();
}

class _RPLPageState extends State<RPLPage> {
  late CourseProvider courseProvider;
  late UserProvider userProvider;
  late TrainerProvider trainerProvider;
  bool callOnce = true;
  ScrollController scrollController = new ScrollController();

  @override
  void didChangeDependencies() {
    courseProvider = Provider.of(context);
    userProvider = Provider.of(context);
    trainerProvider = Provider.of(context);
    if (callOnce) {
      courseProvider.getRplCourseList();
      callOnce = false;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        centerTitle: true,
        title: Text(
          'RPL Certification',
          style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xff878787)),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: courseProvider.rplCourseList.isEmpty
                ? const Center(child: Text('No course found!'))
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Scrollbar(
                      thumbVisibility: true,
                      trackVisibility: true,
                      controller: scrollController,
                      child: ListView.builder(
                          controller: scrollController,
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10),
                          itemCount: courseProvider.rplCourseList.length,
                          itemBuilder: (context, index) {
                            trainerProvider.getTrainerName(
                                courseProvider.rplCourseList[index].trainerId!);

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
                                          'https://pencilbox.edu.bd/${courseProvider.rplCourseList[index].mainImage}',
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
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
                                        height:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        child: Stack(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 15),
                                                      child: Text(
                                                        courseProvider
                                                            .rplCourseList[
                                                                index]
                                                            .trainingName!,
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black,
                                                        ),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    Text(
                                                      trainerProvider
                                                          .trainerName!,
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color:
                                                            Color(0xff716F6F),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '${courseProvider.rplCourseList[index].trainingPrice!.toString()}/-BDT',
                                                      style:
                                                          GoogleFonts.poppins(
                                                              color: Colors.red,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.of(context).pushNamed(
                                                            'course_module_page',
                                                            arguments:
                                                                courseProvider
                                                                        .rplCourseList[
                                                                    index]);
                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                  color: Colors
                                                                      .black54,
                                                                  blurRadius: 2,
                                                                  offset:
                                                                      Offset(
                                                                          0.0,
                                                                          0.20))
                                                            ],
                                                            color: DateTime.parse(courseProvider
                                                                        .rplCourseList[
                                                                            index]
                                                                        .startDate!)
                                                                    .isAfter(
                                                                        DateTime
                                                                            .now())
                                                                ? Colors.red
                                                                : Colors.grey,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(6.0),
                                                          child: AutoSizeText(
                                                            DateTime.parse(courseProvider
                                                                        .rplCourseList[
                                                                            index]
                                                                        .startDate!)
                                                                    .isAfter(
                                                                        DateTime
                                                                            .now())
                                                                ? 'Apply'
                                                                : "See details",
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                            maxLines: 1,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          Icons.access_time,
                                                          color:
                                                              Color(0xff808080),
                                                          size: 13,
                                                        ),
                                                        const SizedBox(
                                                          width: 2,
                                                        ),
                                                        Text(
                                                          '${courseProvider.rplCourseList[index].hours} h',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            color: const Color(
                                                                0xff808080),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          Icons.date_range,
                                                          color:
                                                              Color(0xff808080),
                                                          size: 13,
                                                        ),
                                                        const SizedBox(
                                                          width: 2,
                                                        ),
                                                        Text(
                                                          HelperMethod.getDateFormat(
                                                              'dd-MM-yyyy',
                                                              DateTime.parse(
                                                                  courseProvider
                                                                      .rplCourseList[
                                                                          index]
                                                                      .startDate!)),
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            color: const Color(
                                                                0xff808080),
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
                                                    Icons
                                                        .favorite_border_outlined,
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
                  ),
          ),
        ],
      ),
    );
  }
}

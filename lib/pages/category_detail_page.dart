import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screen_design/helper/helper_method.dart';
import 'package:screen_design/provider/course_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import '../provider/trainer_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryDetailPage extends StatefulWidget {
  @override
  State<CategoryDetailPage> createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
  late CourseProvider courseProvider;
  bool callOnce = true;
  dynamic categoryName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments as List;
    categoryName = args[0];

    courseProvider = Provider.of(context, listen: true);

    if (callOnce) {
      courseProvider.getFilteredCategoryDetail(args[0], args[1]);
    }
    callOnce = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        centerTitle: true,
        title: Text(
          categoryName.runtimeType == String ? categoryName : 'Category detail',
          style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xff878787)),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: courseProvider.filteredCourseList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://pencilbox.edu.bd/${courseProvider.filteredCourseList[index].mainImage}',
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Image.asset('images/placeholder.png'),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'images/checkbox.png',
                                      color: Colors.red,
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    FittedBox(
                                      child: Text(
                                        'Start Date: ${HelperMethod.getDateFormat('dd-MM-yyyy', DateTime.parse(courseProvider.filteredCourseList[index].startDate!))}',
                                        style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'images/timer.png',
                                      color: Colors.red,
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    FittedBox(
                                      child: Text(
                                        'Duration: ${courseProvider.filteredCourseList[index].hours}'
                                        'h',
                                        style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                                Consumer<TrainerProvider>(
                                  builder: (BuildContext context, provider,
                                      Widget? child) {
                                    provider.getTrainerModel(courseProvider
                                        .filteredCourseList[index].trainerId!);

                                    return InkWell(
                                      onTap: () {
                                        ArtSweetAlert.show(
                                          context: context,
                                          artDialogArgs: ArtDialogArgs(
                                            type: ArtSweetAlertType.success,
                                            customColumns: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                      Navigator.of(context).pushNamed(
                                                          'Trainer_details_page',
                                                          arguments: provider
                                                              .categoryDetailPageTrainerModel!);
                                                    },
                                                    child: Text(
                                                      'Trainer: ${provider.categoryDetailPageTrainerModel!.trainerName}',
                                                      style: GoogleFonts.poppins(
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "${courseProvider.filteredCourseList[index].trainingName}",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black),
                                                  ),
                                                  const SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    'Batch No: ${courseProvider.filteredCourseList[index].currentBatchId}',
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black),
                                                  ),
                                                  const SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    'Last date: ${courseProvider.filteredCourseList[index].lastDate}',
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      child: const Icon(Icons.info_outline,
                                          color: Colors.amberAccent),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: AutoSizeText(
                              courseProvider
                                  .filteredCourseList[index].trainingName!,
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              maxLines: 2,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 10, left: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Course Fees: ${courseProvider.filteredCourseList[index].trainingPrice}/-BDT',
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.red),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        'course_module-page',
                                        arguments: courseProvider
                                            .filteredCourseList[index]);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black54,
                                            blurRadius: 3,
                                            offset: Offset(0.0, 0.25))
                                      ],
                                      borderRadius: BorderRadius.circular(5),
                                      color: DateTime.parse(courseProvider
                                                      .filteredCourseList[index]
                                                      .startDate!)
                                                  .isAfter(DateTime.now()) &&
                                              courseProvider
                                                      .filteredCourseList[index]
                                                      .status ==
                                                  1
                                          ? Colors.red
                                          : Colors.grey, // Background color
                                    ),
                                    child: DateTime.parse(courseProvider
                                                    .filteredCourseList[index]
                                                    .startDate!)
                                                .isAfter(DateTime.now()) &&
                                            courseProvider
                                                    .filteredCourseList[index]
                                                    .status ==
                                                1
                                        ? Text(
                                            'Apply Now',
                                            style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          )
                                        : Text(
                                            "Show Details",
                                            style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

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
  late CourseProvider upcomingCourseProvider;
  bool callOnce = true;
  late String caregoryName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments as List;
    caregoryName = args[0];

    upcomingCourseProvider = Provider.of(context, listen: true);

    if (callOnce) {
      upcomingCourseProvider.getFilteredCategoryDetail(args[0], args[1]);
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
          caregoryName,
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
                  itemCount: upcomingCourseProvider.filteredCourseList.length,
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
                                  'https://pencilbox.edu.bd/${upcomingCourseProvider.filteredCourseList[index].mainImage}',
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
                                        'Start Date: ${HelperMethod.getDateFormat('dd-MM-yyyy', DateTime.parse(upcomingCourseProvider.filteredCourseList[index].startDate!))}',
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
                                        'Duration: ${upcomingCourseProvider.filteredCourseList[index].hours}'
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
                                  builder: (BuildContext context, value,
                                      Widget? child) {
                                    value.getTrainerName(upcomingCourseProvider
                                        .filteredCourseList[index].trainerId!);

                                    return InkWell(
                                      onTap: () {
                                        ArtSweetAlert.show(
                                            context: context,
                                            artDialogArgs: ArtDialogArgs(
                                                type: ArtSweetAlertType.success,
                                                title:
                                                    "Trainer :- ${value.CategoryDetailPageTrainerName}",
                                                text: "${upcomingCourseProvider.filteredCourseList[index].trainingName} \n" +
                                                    'Batch No: ${upcomingCourseProvider.filteredCourseList[index].currentBatchId}\n' +
                                                    'Last date: ${upcomingCourseProvider.filteredCourseList[index].lastDate}'));
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
                              upcomingCourseProvider
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
                                  'Course Fees: ${upcomingCourseProvider.filteredCourseList[index].trainingPrice}/-BDT',
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.red),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pushNamed(
                                          'course_module-page',
                                          arguments: upcomingCourseProvider
                                              .filteredCourseList[index]);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: DateTime.parse(
                                                      upcomingCourseProvider
                                                          .filteredCourseList[
                                                              index]
                                                          .startDate!)
                                                  .isAfter(DateTime.now()) &&
                                              upcomingCourseProvider
                                                      .filteredCourseList[index]
                                                      .status ==
                                                  1
                                          ? Colors.red
                                          : Colors.grey, // Background color
                                    ),
                                    child: DateTime.parse(upcomingCourseProvider
                                                    .filteredCourseList[index]
                                                    .startDate!)
                                                .isAfter(DateTime.now()) &&
                                            upcomingCourseProvider
                                                    .filteredCourseList[index]
                                                    .status ==
                                                1
                                        ? Text(
                                            'Apply Now',
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          )
                                        : Text(
                                            "Show Details",
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          ))
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

import 'package:flutter/material.dart';
import 'package:screen_design/helper/helper_method.dart';
import 'package:screen_design/models/course_model.dart';
import 'package:provider/provider.dart';
import 'package:screen_design/models/trainer_model.dart';
import 'package:screen_design/provider/course_module_provider.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:screen_design/provider/trainer_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class CourseModulePage extends StatefulWidget {
  @override
  State<CourseModulePage> createState() => _CourseModulePageState();
}

class _CourseModulePageState extends State<CourseModulePage> {
  late CourseModel courseModel;
  late TrainerModel trainerModel;
  late CourseModuleProvider courseModuleProvider;
  late TrainerProvider trainerProvider;
  bool callOnce = true;

  @override
  void didChangeDependencies() {
    courseModel = ModalRoute.of(context)?.settings.arguments as CourseModel;
    courseModuleProvider = Provider.of(context, listen: true);
    trainerProvider = Provider.of(context);
    if (callOnce) {
      courseModuleProvider.getFilteredCourseModuleList(courseModel.trainingId!);
      trainerModel =
          trainerProvider.getTrainerInfoByTrainingId(courseModel.trainerId!);
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
          'Course module',
          style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xff878787)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: CachedNetworkImage(
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                    imageUrl:
                        'https://pencilbox.edu.bd/${courseModel.trainingImage!}',
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        Image.asset('images/placeholder.png'),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 15,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('Trainer_details_page',
                          arguments: trainerModel);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19)),
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipOval(
                              child: CachedNetworkImage(
                                height: 35,
                                width: 35,
                                imageUrl:
                                    'https://pencilbox.edu.bd/${trainerModel.trainerImage}',
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Image.asset('images/placeholder.png'),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              trainerModel.trainerName!,
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    courseModel.trainingName!,
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'images/timer.png',
                                color: Colors.grey,
                                height: 15,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${courseModel.hours.toString()}h',
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'images/technology.png',
                                color: Colors.grey,
                                height: 15,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                HelperMethod.getDateFormat('dd-MM-yyyy',
                                    DateTime.parse(courseModel.startDate!)),
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          courseModel.trainingPrice! == 0
                              ? Container()
                              : Text(
                                  '${courseModel.trainingPrice!.toString()}/-BDT',
                                  style: GoogleFonts.poppins(
                                    color: Colors.red,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                          const SizedBox(
                            height: 5,
                          ),
                          DateTime.parse(courseModel.startDate!)
                                  .isAfter(DateTime.now())
                              ? GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        'apply_course_page',
                                        arguments: courseModel);
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
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8, top: 5, bottom: 5),
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
                                )
                              : Container(),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Introduction',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Html(
                    data: courseModel.trainingShortDesc!,
                    style: {
                      'html': Style(textAlign: TextAlign.justify),
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Html(
                    data: 'Prerequisites: ${courseModel.preRequisite!}',
                    style: {
                      'html': Style(textAlign: TextAlign.justify),
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Training Modules',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:
                        courseModuleProvider.modulesByTrainingIdList.length,
                    itemBuilder: (BuildContext context, int index) {
                      print(
                          'courseModuleProvider.modulesByTrainingIdList[index].moduleName: ${courseModuleProvider.modulesByTrainingIdList[index].moduleName}');

                      return ExpansionTileCard(
                        title: Text(
                          courseModuleProvider
                                  .modulesByTrainingIdList[index].moduleName ??
                              'Module',
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        children: [
                          Html(
                            data: courseModuleProvider
                                    .modulesByTrainingIdList[index]
                                    .moduleDesc ??
                                'Not Available',
                            style: {
                              "body": Style(
                                  fontSize: FontSize(12), color: Colors.black),
                            },
                          ),
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

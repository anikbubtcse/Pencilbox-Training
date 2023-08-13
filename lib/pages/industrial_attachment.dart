import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_design/provider/course_provider.dart';
import 'package:provider/provider.dart';
import 'package:screen_design/provider/trainer_provider.dart';
import '../helper/helper_method.dart';

class IndustrialAttachmentPage extends StatefulWidget {
  const IndustrialAttachmentPage({super.key});

  @override
  State<IndustrialAttachmentPage> createState() => _IndustrialAttachmentPageState();
}

class _IndustrialAttachmentPageState extends State<IndustrialAttachmentPage> {
  late CourseProvider courseProvider;
  late TrainerProvider trainerProvider;
  bool callOnce = true;

  @override
  void didChangeDependencies() {
    courseProvider = Provider.of(context);
    trainerProvider = Provider.of(context);
    if (callOnce) {
      courseProvider.getIndustrialAttachment();
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
          'Industrial Attachment',
          style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xff878787)),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: courseProvider.industrialAttachmentList.isEmpty
                ? const Center(child: Text('Nothing has found!'))
                : ListView.builder(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 10),
                    itemCount: courseProvider.industrialAttachmentList.length,
                    itemBuilder: (context, index) {
                      String trainerName =
                          trainerProvider.getMyCourseTrainerName(courseProvider
                              .industrialAttachmentList[index].trainerId!);

                      return InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('course_module-page',
                              arguments: courseProvider
                                  .industrialAttachmentList[index]);
                        },
                        child: Card(
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
                                      'https://pencilbox.edu.bd/${courseProvider.industrialAttachmentList[index].trainingImage}',
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
                                    height:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Column(
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
                                                courseProvider
                                                    .industrialAttachmentList[
                                                        index]
                                                    .trainingName!,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xffDE1E36),
                                                ),
                                                overflow: TextOverflow.ellipsis,
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
                                        // Text(
                                        //   '${courseProvider.industrialAttachmentList[index].trainingPrice.toString()}/-BDT',
                                        //   style: GoogleFonts.poppins(
                                        //       fontSize: 14,
                                        //       fontWeight: FontWeight.w500,
                                        //       color: Colors.red),
                                        // ),
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
                                                  '${courseProvider.industrialAttachmentList[index].hours} h',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w300,
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
                                                      DateTime.parse(courseProvider
                                                          .industrialAttachmentList[
                                                              index]
                                                          .startDate!)),
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w300,
                                                    color: Color(0xff808080),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
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

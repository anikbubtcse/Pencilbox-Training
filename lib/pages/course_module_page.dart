import 'package:flutter/material.dart';
import 'package:screen_design/helper/helper_method.dart';
import 'package:screen_design/models/course_model.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:provider/provider.dart';
import 'package:screen_design/provider/course_module_provider.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:screen_design/provider/trainer_provider.dart';


class CourseModulePage extends StatefulWidget {
  @override
  State<CourseModulePage> createState() => _CourseModulePageState();
}

class _CourseModulePageState extends State<CourseModulePage> {
  CourseModel? courseModel;
  late CourseModuleProvider provider;
  bool callOnce = true;

  //bool isExpanded = false;

  @override
  void didChangeDependencies() {
    courseModel = ModalRoute.of(context)?.settings.arguments as CourseModel;
    provider = Provider.of(context, listen: true);
    if (callOnce) {
      provider.getCourseModuleServiceData().then((value) {
        provider.getFilteredCourseModuleList(courseModel!.trainingId!);
      });
      callOnce = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xff2E5A88),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.class_outlined,
              color: Colors.white,
            ),
            SizedBox(
              width: 3,
            ),
            Text(
              'Course details',
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'images/pencilbox_logo.png',
                    width: 180,
                    height: 90,
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person),
                      SizedBox(
                        height: 3,
                      ),
                      Text('Profile')
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.2), BlendMode.darken),
                      image: const AssetImage('images/details_bg.png'))),
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      courseModel!.trainingName!,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.date_range,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          'Start Date: ${HelperMethod.getDateFormat('dd/MM/yyyy', DateTime.parse(courseModel!.startDate!))}',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.access_time_filled,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          'End Date: ${HelperMethod.getDateFormat('dd/MM/yyyy', DateTime.parse(courseModel!.endDate!))}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.class_outlined,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          'No of classes/Sessions: ${courseModel!.classNo}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.schedule_outlined,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          'Registration deadline: ${HelperMethod.getDateFormat('dd/MM/yyyy', DateTime.parse(courseModel!.lastDate!))}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          'Batch No: ${courseModel!.batchId}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    child: Image.network(
                      'https://pencilbox.edu.bd/${courseModel!.mainImage!}',
                      fit: BoxFit.contain,
                      height: 200,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'INTRODUCTION',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Html(
                      data: courseModel!.trainingShortDesc!,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Prerequisites',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Html(
                      data: courseModel!.preRequisite!,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Training Modules',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  provider.filteredModulesByTrainingIdList.isEmpty
                      ? CircularProgressIndicator(
                          color: Colors.black,
                        )
                      : ExpansionPanelList(
                          animationDuration: Duration(milliseconds: 500),
                          expansionCallback: (panelIndex, isExpanded) {
                            provider.filteredModulesByTrainingIdList[panelIndex]
                                .isExpanded = !isExpanded;
                            setState(() {});
                          },
                          children: provider.filteredModulesByTrainingIdList
                              .map((module) {
                            return ExpansionPanel(
                                isExpanded: module.isExpanded ?? false,
                                canTapOnHeader: true,
                                headerBuilder: (context, isExpanded) {
                                  return ListTile(
                                    title: Html(data: module.moduleName),
                                  );
                                },
                                body: ListTile(
                                  title: Html(data: module.moduleDesc),
                                ));
                          }).toList(),
                        ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Reviews',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Consumer<TrainerProvider>(
                    builder: (BuildContext context, provider, Widget? child) {
                      provider.getTrainerDetails(courseModel!.trainerId!);
                      return Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.amber, width: 5)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.amber, width: 2)),
                              child: CircleAvatar(
                                  radius: 60,
                                  backgroundImage: NetworkImage(
                                      'https://pencilbox.edu.bd/${provider.trainerImage!}')),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Trainer',
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              provider.trainerName!.toUpperCase(),
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
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

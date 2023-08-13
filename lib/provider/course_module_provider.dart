import 'package:flutter/material.dart';

import '../models/course_module_model.dart';
import '../service/course_module_service.dart';

class CourseModuleProvider extends ChangeNotifier {
  List<CourseModuleModel> courseModuleList = [];
  List<CourseModuleModel> filteredModulesByTrainingIdList = [];

  Future<void> getCourseModuleServiceData() async {
    final data = await CourseModuleService.getAllModules();
    for (Map i in data) {
      courseModuleList.add(CourseModuleModel.fromJson(i));
    }
    notifyListeners();
  }

  getFilteredCourseModuleList(num id) {
    print('id ${id}');
    filteredModulesByTrainingIdList.clear();
    courseModuleList.forEach((element) {
      if (element.trainingId.toString() == id.toString()) {
        filteredModulesByTrainingIdList.add(element);
        notifyListeners();
      }
    });
  }



}

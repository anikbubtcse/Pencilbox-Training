import 'package:flutter/cupertino.dart';
import 'package:screen_design/service/upcoming_course_service.dart';
import '../models/course_model.dart';
import 'package:intl/intl.dart';

class UpcomingCourseProvider extends ChangeNotifier {
  var startDateString;
  var currentDateString;
  List<CourseModel> fullCourseList = [];
  List<CourseModel> filteredUpcomingCourseList = [];
  List<CourseModel> filteredCourseCategory = [];
  List<String> filteredCourseCategoryIcon = [];
  List<CourseModel> filteredCourseList = [];

  getCourseServiceData() async {
    filteredUpcomingCourseList.clear();
    dynamic data = await UpcomingCourseService.getAllCourses();

    for (Map i in data) {
      fullCourseList.add(CourseModel.fromJson(i));
    }
    notifyListeners();

    fullCourseList.forEach((element) {
      startDateString =
          DateFormat('yyyy-MM-dd').format(DateTime.parse(element.startDate!));
      currentDateString = DateFormat('yyyy-MM-dd').format(DateTime.now());
      if ((element.batchType == 'Training' ||
              element.batchType == 'Certification') &&
          element.publicationStatus == 1 &&
          DateTime.parse(startDateString)
              .isAfter(DateTime.parse(currentDateString))) {
        filteredUpcomingCourseList.add(element);
      }
    });
    notifyListeners();

    filteredCourseCategory.clear();
    fullCourseList.forEach((element) {
      if (!doesNameExists(element.catName!)) {
        filteredCourseCategory.add(element);
      }
    });

    filteredCourseCategoryIcon.clear();
    fullCourseList.forEach((element) {
      if (!filteredCourseCategoryIcon.contains(element.catIcon)) {
        filteredCourseCategoryIcon.add(element.catIcon!);
      }
    });
  }

  getFilteredCategoryDetail(var name, int marker) {
    filteredCourseList.clear();

    if (marker == 1) {
      fullCourseList.forEach((element) {
        if (element.catName == name) {
          filteredCourseList.add(element);
        }
      });
    } else if (marker == 2) {
      fullCourseList.forEach((element) {
        if (element.trainingName
            .toString()
            .toLowerCase()
            .contains((name.toString().toLowerCase()))) {
          filteredCourseList.add(element);
        }
      });
    } else if (marker == 3) {
      for (var i in name) {
        fullCourseList.forEach((element) {
          if (element.catName == i) {
            filteredCourseList.add(element);
          }
        });
      }
      print('filteredCourseList ${filteredCourseList.length}');
    }

    filteredCourseList.sort((a, b) => b.startDate!.compareTo(a.startDate!));
  }

  bool doesNameExists(String name) {
    bool tag = false;
    for (var n in filteredCourseCategory) {
      if (name == n.catName) {
        tag = true;
        break;
      }
    }
    return tag;
  }

  int getMyCoursesTrainerId(String trainingId) {
    int trainerId = 0;

    fullCourseList.forEach((element) {
      if (element.trainingId.toString() == trainingId) {
        trainerId = element.trainerId!;
      }
    });

    return trainerId;
  }
}

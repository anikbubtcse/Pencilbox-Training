import 'package:flutter/cupertino.dart';
import 'package:screen_design/service/course_service.dart';
import '../models/course_model.dart';
import 'package:intl/intl.dart';

class CourseProvider extends ChangeNotifier {
  List<CourseModel> fullCourseList = [];
  List<CourseModel> upcomingCourseList = [];
  List<CourseModel> carouselSliderCourseList = [];
  List<CourseModel> courseCategoryList = [];
  List<String> courseCategoryIconList = [];
  List<CourseModel> filteredCourseList = [];
  List<CourseModel> ongoingCoursesList = [];
  List<CourseModel> oldCoursesList = [];
  List<CourseModel> collaboratedCourseList = [];
  List<CourseModel> rplCourseList = [];
  List<CourseModel> industrialAttachmentList = [];

  getCourseServiceData() async {
    oldCoursesList.clear();
    upcomingCourseList.clear();
    fullCourseList.clear();
    ongoingCoursesList.clear();
    dynamic data = await CourseService.getAllCourses();

    for (Map i in data) {
      fullCourseList.add(CourseModel.fromJson(i));
    }
    notifyListeners();

    fullCourseList.sort((a, b) => b.startDate!.compareTo(a.startDate!));

    fullCourseList.forEach((element) {
      String startDateString =
          DateFormat('yyyy-MM-dd').format(DateTime.parse(element.startDate!));
      String currentDateString =
          DateFormat('yyyy-MM-dd').format(DateTime.now());
      if ((element.batchType == 'Training' ||
              element.batchType == 'Certification') &&
          element.publicationStatus == 1 &&
          DateTime.parse(startDateString)
              .isAfter(DateTime.parse(currentDateString))) {
        upcomingCourseList.add(element);
      }
    });

    upcomingCourseList.sort((a, b) => b.startDate!.compareTo(a.startDate!));

    fullCourseList.forEach((element) {
      String startDateString =
          DateFormat('yyyy-MM-dd').format(DateTime.parse(element.startDate!));
      String endDateString =
          DateFormat('yyyy-MM-dd').format(DateTime.parse(element.endDate!));
      if (element.publicationStatus == 1 &&
          DateTime.parse(startDateString).isBefore(DateTime.now()) &&
          DateTime.parse(endDateString).isAfter(DateTime.now())) {
        ongoingCoursesList.add(element);
      }
    });

    ongoingCoursesList.sort((a, b) => b.startDate!.compareTo(a.startDate!));

    fullCourseList.forEach((element) {
      String endDateString =
          DateFormat('yyyy-MM-dd').format(DateTime.parse(element.endDate!));
      if (element.batchType == 'Training' &&
          element.publicationStatus == 1 &&
          DateTime.parse(endDateString).isBefore(DateTime.now()) &&
          !collaboratedCourseList.contains(element.catName) &&
          !collaboratedCourseList.contains(element.catId)) {
        oldCoursesList.add(element);
      }
    });
    oldCoursesList.sort((a, b) {
      return b.startDate!.compareTo(a.startDate!);
    });
    oldCoursesList = oldCoursesList.take(8).toList();

    fullCourseList.forEach((element) {
      if (element.batchType == 'Training' &&
          element.publicationStatus == 1 &&
          element.collaborative == 1 &&
          !collaboratedCourseList.contains(element.catName) &&
          !collaboratedCourseList.contains(element.catId)) {
        collaboratedCourseList.add(element);
      }
    });
    collaboratedCourseList.sort((a, b) => b.startDate!.compareTo(a.startDate!));

    courseCategoryList.clear();
    fullCourseList.forEach((element) {
      if (!doesNameExists(element.catName!)) {
        courseCategoryList.add(element);
      }
    });
    notifyListeners();

    courseCategoryIconList.clear();
    fullCourseList.forEach((element) {
      if (!courseCategoryIconList.contains(element.catIcon)) {
        courseCategoryIconList.add(element.catIcon!);
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
    for (var n in courseCategoryList) {
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

  getRplCourseList() {
    rplCourseList.clear();

    fullCourseList.forEach((element) {
      if (element.batchType == "Certification") {
        rplCourseList.add(element);
      }
    });
    rplCourseList.sort((a, b) {
      return b.startDate!.compareTo(a.startDate!);
    });
  }

  getIndustrialAttachment() {
    industrialAttachmentList.clear();

    fullCourseList.forEach((element) {
      if (element.batchType == "Industrial" && element.status == 1) {
        industrialAttachmentList.add(element);
      }
    });
  }

  getCarouselSliderCourses() {
    carouselSliderCourseList.clear();
    for (dynamic i in upcomingCourseList) {
      if (carouselSliderCourseList.length < 5) {
        carouselSliderCourseList.add(i);
      }
    }
  }
}

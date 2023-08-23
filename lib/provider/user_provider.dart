import 'package:flutter/cupertino.dart';
import 'package:screen_design/models/review_model.dart';
import 'package:screen_design/models/student_info_model.dart';
import 'package:screen_design/models/student_registration.dart';
import '../models/update_profile_model.dart';
import '../service/user_service.dart';

class UserProvider extends ChangeNotifier {
  StudentInfoModel? studentInfoModel;
  List<Billing> billingList = [];
  List<ReviewModel> allStudentReviews = [];
  List<ReviewModel> allSortedStudentReviews = [];

  Future<dynamic> userLogin(String email, String password) async {
    dynamic data = await UserService.studentLoginService(email, password);
    return data;
  }

  Future<dynamic> userRegistration(
      StudentRegistration studentRegistration) async {
    dynamic data =
        await UserService.studentRegisterService(studentRegistration);
    return data;
  }

  Future getUserInfoServiceData(String studentId) async {
    dynamic data = await UserService.studentInfoService(studentId);
    studentInfoModel = StudentInfoModel.fromJson(data);
    notifyListeners();
  }

  getBillingList() {
    billingList.clear();
    studentInfoModel!.success!.billing!.forEach((element) {
      if (element.courseRegStudents != null) {
        billingList.add(element);
      }
    });
    notifyListeners();
  }

  Future<dynamic> userProfileUpdate(
      UpdateProfileModel updateProfileModel) async {
    dynamic data =
        await UserService.userProfileUpdateService(updateProfileModel);
    // notifyListeners();
    return data;
  }

  getAllStudentReviews() async {
    allStudentReviews.clear();
    allSortedStudentReviews.clear();
    dynamic data = await UserService.getStudentReviews();

    if (data != null) {
      for (Map i in data) {
        allStudentReviews.add(ReviewModel.fromJson(i));
      }

      allStudentReviews.sort((a, b) {
        return b.id!.compareTo(a.id!);
      });
      for (int i = 0; i < 10; i++) {
        allSortedStudentReviews.add(allStudentReviews[i]);
      }
    } else {
      print('Something went wrong');
    }
  }
}

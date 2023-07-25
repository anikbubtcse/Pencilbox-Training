import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:screen_design/models/update_profile_model.dart';
import '../models/student_registration.dart';

class UserService {
  static Future<dynamic> studentLoginService(String email, String pass) async {
    var data;
    try {
      final response = await http.post(
        Uri.parse('https://pencilbox.edu.bd/api/login'),
        body: {'email_address': email, 'password': pass},
      );
      if (response.statusCode == 200) {
        data = jsonDecode(response.body.toString());
        return data;
      } else {
        return data;
      }
    } catch (e) {
      print(e.toString());
      return data;
    }
  }

  static Future<dynamic> studentRegisterService(
      StudentRegistration studentRegistrationModel) async {
    var data;
    try {
      final response = await http.post(
        Uri.parse('https://pencilbox.edu.bd/api/register'),
        body: studentRegistrationModel.toJson(),
      );
      if (response.statusCode == 200) {
        data = jsonDecode(response.body.toString());

        return data;
      } else {
        return data;
      }
    } catch (e) {
      print(e.toString());
      return data;
    }
  }

  static Future<dynamic> studentInfoService(String studentId) async {
    var data;
    try {
      final response = await http.get(
        Uri.parse('https://pencilbox.edu.bd/api/profile?id=$studentId'),
      );
      if (response.statusCode == 200) {
        data = jsonDecode(response.body.toString());
        return data;
      } else {
        return data;
      }
    } catch (e) {
      print(e.toString());
      return data;
    }
  }

  static Future<dynamic> userProfileUpdateService(
      UpdateProfileModel updateProfileModel) async {
    var data;
    try {
      final response = await http.post(
        Uri.parse('https://pencilbox.edu.bd/api/profile-info-update'),
        body: updateProfileModel.toJson(),
      );
      if (response.statusCode == 200) {
        data = jsonDecode(response.body.toString());

        return data;
      } else {
        return data;
      }
    } catch (e) {
      print(e.toString());
      return data;
    }
  }
}

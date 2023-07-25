import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperMethod {
  static late String formatDate;

  static getDateFormat(String format, DateTime date) {
    formatDate = DateFormat(format).format(date);
    return formatDate;
  }

  static setStudentId(String id) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('studentID', id);
  }

  static Future<String?> getStudentId() async {
    final pref = await SharedPreferences.getInstance();
    String? data = pref.getString("studentID");
    return data;
  }

  static Future<bool> userLogOut() async {
    final pref = await SharedPreferences.getInstance();
    return pref.remove('studentID');
  }

}

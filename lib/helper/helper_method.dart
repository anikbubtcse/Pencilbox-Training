import 'package:intl/intl.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperMethod {
  static late String formatDate;
  static String status = '';

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

  static Future<String> checkConnectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      status = 'Mobile Data';
    } else if (connectivityResult == ConnectivityResult.wifi) {
      status = 'Wifi Data';
    } else {
      status = 'Not Connected';
    }

    return status;
  }
}

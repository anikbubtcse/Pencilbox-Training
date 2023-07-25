import 'dart:convert';
import 'package:http/http.dart' as http;

class UpcomingCourseService {
  static Future<dynamic> getAllCourses() async {
    try {
      final response =
          await http.get(Uri.parse('https://pencilbox.edu.bd/api/courses'));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        return data;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

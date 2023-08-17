import 'dart:convert';
import 'package:http/http.dart' as http;

class CourseModuleService {
  static Future<dynamic> getAllModules() async {
    try {
      final response =
          await http.get(Uri.parse('https://pencilbox.edu.bd/api/modules'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body.toString());

        return data;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

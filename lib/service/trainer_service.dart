import 'dart:convert';
import 'package:http/http.dart' as http;

class TrainerService {
  static Future<dynamic> getTrainerData() async {
    dynamic data;
    try {
      final response =
          await http.get(Uri.parse('https://pencilbox.edu.bd/api/trainers'));
      if (response.statusCode == 200) {
        data = jsonDecode(response.body.toString());
        return data;
      } else {
        return data;
      }
    } catch (e) {
      return data;
    }
  }

  static Future<dynamic> TrainingSchedulesService() async {
    dynamic data;

    final response = await http
        .get(Uri.parse('https://pencilbox.edu.bd/api/training_schedules'));

    try {
      if (response.statusCode == 200) {
        data = jsonDecode(response.body.toString());
        return data;
      } else {
        return data;
      }
    } catch (e) {
      return data;
    }
  }
}

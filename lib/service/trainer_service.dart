import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/student_info_model.dart';

class TrainerService {

  Future<dynamic> getTrainerData() async {
    try {
      final response =
          await http.get(Uri.parse('https://pencilbox.edu.bd/api/trainers'));
      if (response.statusCode == 200) {
        dynamic data = jsonDecode(response.body.toString());
        return data;
      }
      return [];
    } catch (e) {
      throw e.toString();
    }
  }
}

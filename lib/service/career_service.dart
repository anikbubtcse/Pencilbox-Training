import 'dart:convert';

import '../models/career_model.dart';
import 'package:http/http.dart' as http;

class CareerService {
  static Future<dynamic> getAllCareerInfo() async {
    dynamic data;
    try {
      final response =
          await http.get(Uri.parse('https://pencilbox.edu.bd/api/career'));

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

import 'dart:convert';

import '../models/district_model.dart';
import 'package:http/http.dart' as http;

class AreaService {
  static Future<dynamic> getAllDistrict() async {
    dynamic data;

    try {
      final response =
          await http.get(Uri.parse('https://seip.pencilbox.edu.bd/districts'));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        return data;
      } else {
        return data;
      }
    } catch (e) {
      return data;
    }
  }

  static Future<dynamic> getAllSubDistrict() async {
    dynamic data;

    try {
      final response = await http
          .get(Uri.parse('https://seip.pencilbox.edu.bd/sub-districts'));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        return data;
      } else {
        return data;
      }
    } catch (e) {
      return data;
    }
  }
}

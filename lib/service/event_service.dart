import 'dart:convert';

import 'package:http/http.dart' as http;

class EventService {
  static Future<dynamic> getEventService() async {
    dynamic data;
    try {
      final response =
          await http.get(Uri.parse('https://pencilbox.edu.bd/api/event'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body.toString());
        return data;
      } else {
        return data;
      }
    } catch (e) {
      return data;
    }
  }
}

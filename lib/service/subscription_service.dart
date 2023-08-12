import 'dart:convert';

import 'package:http/http.dart' as http;

class SubscriptionService {
  static Future<dynamic> subscribeUserService(String email) async {
    dynamic data;

    try {
      final response = await http.post(
        Uri.parse('https://pencilbox.edu.bd/api/subscribe?subscribe'),
        body: {
          'subscribe': email,
        },
      );
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

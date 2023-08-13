import 'dart:convert';
import 'package:http/http.dart' as http;

class FaqService {
  static Future<dynamic> getAllFaqs() async {
    dynamic data;
    try {
      final response =
          await http.get(Uri.parse('https://pencilbox.edu.bd/api/faq'));

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

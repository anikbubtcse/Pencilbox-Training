import 'dart:convert';

import 'package:screen_design/models/contact_model.dart';
import 'package:http/http.dart' as http;

class ContactService {
  static Future<dynamic> contactService(ContactModel contactModel) async {
    dynamic data;
    try {
      final response = await http.post(
          Uri.parse('https://pencilbox.edu.bd/api/contactReg'),
          body: contactModel.toMap());
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

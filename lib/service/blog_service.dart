import 'dart:convert';

import 'package:http/http.dart' as http;

class BlogService {
  static Future<dynamic> getLatestBlog() async {
    try {
      final response =
          await http.get(Uri.parse('https://pencilbox.edu.bd/api/latestBlog'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body.toString());
        return data;
      } else {
        return [];
      }
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<dynamic> getPopularBlog() async {
    try {
      final response =
      await http.get(Uri.parse('https://pencilbox.edu.bd/api/popularBlog'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body.toString());
        return data;
      } else {
        return [];
      }
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<dynamic> getBlogCategory() async {
    try {
      final response =
      await http.get(Uri.parse('https://pencilbox.edu.bd/api/blogCats'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body.toString());
        return data;
      } else {
        return [];
      }
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<dynamic> getArchivesBlog() async {
    try {
      final response =
      await http.get(Uri.parse('https://pencilbox.edu.bd/api/blogArchives'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body.toString());
        return data;
      } else {
        return [];
      }
    } catch (e) {
      throw e.toString();
    }
  }

}

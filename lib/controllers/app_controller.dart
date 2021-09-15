import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tester_api/models/post.dart';

class AppController {
  static String url = 'https://jsonplaceholder.typicode.com/posts';

  static Future<List<Post>> getPosts() async {
    final response = await http.get(Uri.parse(url));
    return List<Post>.from(
        jsonDecode(response.body).map((e) => Post.fromJson(e)));
  }

  static Future createPost({required Map<String, dynamic> body}) async {
    return http.post(Uri.parse(url),
        body: jsonEncode(body),
        headers: {"Content-type": "application/json"}).then((value) {
      final statusCode = value.statusCode;
      if (statusCode < 200 || statusCode > 400) {
        throw Exception('Error while fetchinh data');
      }
      print(value.statusCode);
      print(value.body);
    });
  }
}

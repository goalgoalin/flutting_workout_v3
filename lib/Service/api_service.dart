//Login화면 API

import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<http.Response> getUserId() async {
    final url = Uri.parse('$baseUrl/user/id');
    return await http.get(url, headers: {'Content-Type': 'application/json'});
  }

  Future<http.Response> signup(String userId, String password, String name,
      String email, String nickname) {
    final url = Uri.parse('$baseUrl/user/signup');
    return http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'userId': userId,
        'password': password,
        'name': name,
        'email': email,
        'nickname': nickname,
      }),
    );
  }

  Future<http.Response> login(String userId, String password) {
    final url = Uri.parse('$baseUrl/user/login');
    return http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'userId': userId, 'password': password}),
    );
  }

  Future<http.Response> forgotPassword(String userId, String email) {
    final url = Uri.parse('$baseUrl/user/forgot_password');
    return http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'userId': userId, 'email': email}),
    );
  }

  Future<http.Response> verifyCode(String code) {
    final url = Uri.parse('$baseUrl/user/code');
    return http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'code': code}),
    );
  }

  Future<http.Response> getHome(
      String name, List<Map<String, dynamic>> routine) {
    final url = Uri.parse('$baseUrl/home');
    return http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'routine': routine,
      }),
    );
  }

  Future<http.Response> manageHealthRoutine(
      String userId, List<Map<String, dynamic>> exerciseRoutine) {
    final url = Uri.parse('$baseUrl/user/health_routine');
    return http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'userId': userId,
        'exerciseRoutine': exerciseRoutine,
      }),
    );
  }

  Future<http.Response> getBoardHome(List<Map<String, dynamic>> board) {
    final url = Uri.parse('$baseUrl/board/home');
    return http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'board': board}),
    );
  }

  Future<http.Response> writeBoardPost(
      String id, String title, String content) {
    final url = Uri.parse('$baseUrl/board/write/$id');
    return http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'title': title, 'content': content}),
    );
  }
}

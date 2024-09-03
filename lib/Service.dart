/*import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Service {
  Future<http.Response> saveUser(
      String schoolname, String name, String email) async {
    var uri = Uri.parse("http://localhost:8080/register");
    Map<String, String> headers = {"Content-Type": "application/json"};

    Map data = {
      'email': '$email',
      'name': '$name'
    };
    var body = json.encode(data);
    var response = await http.post(uri, headers: headers, body: body);

    print("${response.body}");

    return response;
  }
}*/
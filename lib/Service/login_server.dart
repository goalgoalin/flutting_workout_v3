import 'dart:convert'; // JSON 인코딩 및 디코딩을 위해 필요

void main() {
  // 예시로 사용할 아이디와 비밀번호
  String username = "user123";
  String password = "mypassword";

  // JSON 데이터를 생성하는 방법
  Map<String, String> data = {
    'username': username,
    'password': password,
  };

  // JSON으로 변환
  String jsonData = jsonEncode(data);

  // jsonData는 서버로 전송될 JSON 문자열
  print(jsonData);
}
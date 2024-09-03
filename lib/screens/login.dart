import 'package:flutter/material.dart';
import 'home.dart';
import 'signup.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//로그인 페이지 -아이디 입력, 비밀번호 입력, 회원가입 버튼

class LoginP extends StatefulWidget {
  const LoginP({super.key}); 

  @override
  State<StatefulWidget> createState() => _LoginPState();
}

class _LoginPState extends State<LoginP> {

  //벡엔드 서버와 연결 
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final String _loginUrl = "https://"; // 백엔드 서버 URL을 입력

  Future<void> _login() async {
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    final response = await http.post(
      Uri.parse(_loginUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // 서버에서 200 OK 응답을 받으면, JSON을 파싱
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      print('로그인 성공: ${responseData['message']}');
      // 로그인 성공 시의 처리
    } else {
      // 서버에서 200 이외의 응답을 받으면, 오류를 처리
      print('로그인 실패: ${response.body}');
      // 로그인 실패 시의 처리 (예: 오류 메시지 표시)
    }
  }

  //앱 UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Image.asset(
                'assets/flirting_icon2.jpg', // 이미지 경로
                height: 100,
              ),
            ),
            SizedBox(height: 40),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: '아이디',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: '비밀번호',
                border: OutlineInputBorder(),
              ),
              obscureText: true, // 텍스트 가림
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: /*_login,*/
              () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
                ); // 로그인 버튼 동작
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0XFF561689),
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Text('로그인',
              style: TextStyle(
                color: Colors.white,
                  ),),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupP()),
                );// 회원가입 버튼 동작
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0XFF561689),
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Text(
                '회원가입',
                style: TextStyle(
                color: Colors.white,
                  ),),              
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
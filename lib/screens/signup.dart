import 'package:flutter/material.dart';
import 'login.dart';

class SignupP extends StatefulWidget {
    const SignupP({super.key}); 
    
  @override
  State<StatefulWidget> createState() => _SignupPState();
}

class _SignupPState extends State<SignupP> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('홈'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginP()),
            );// 뒤로 가기 동작
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: '이름',
                hintText: '이름',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: '별명',
                hintText: '별명',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: '아이디',
                hintText: 'userid',
                border: OutlineInputBorder(),
              ),
              obscureText: true, // 비밀번호 가리기
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: '비밀번호',
                hintText: 'password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: '이메일',
                hintText: 'email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginP()),
                  );// 회원가입 버튼 동작
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0XFF561689),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  '회원 가입',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
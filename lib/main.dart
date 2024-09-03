import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:flutting_workout/screens/login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutting',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      backgroundColor: Color(0xFF561689), // 배경 색상 설정
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(), // 상단 공간 확보
            Image.asset(
              'assets/flirting_icon.jpg', // 이미지 경로 설정
              width: 400, // 이미지 크기 설정
              height: 400, // 이미지 색상 흰색으로 설정
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginP()),
                  );// 시작 버튼 클릭 시의 동작
                },
                style: ElevatedButton.styleFrom(
                  //primary: Colors.white, // 버튼 배경 색상 흰색
                  //onPrimary: Colors.black, // 버튼 텍스트 색상 검정
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text(
                  '시작하기',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
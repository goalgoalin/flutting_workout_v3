import 'package:flutter/material.dart';
import 'package:camera/camera.dart'; // camera 패키지 import
import 'qrcodescanner.dart';

class EquipmentP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EquipmentPScreen(),
    );
  }
}

class EquipmentPScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(
              'assets/flirting_icon2.jpg',
              width: 150,
              height: 150,
              color: Colors.white,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    // 사용 가능한 카메라 목록을 가져옴
                    final cameras = await availableCameras();
                    final firstCamera = cameras.first;

                    // QRScannerApp으로 화면 전환
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QRScannerApp(camera: firstCamera),
                      ),
                    );
                  } catch (e) {
                    print("Error: $e");
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF561689),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text(
                  '스캔하기',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

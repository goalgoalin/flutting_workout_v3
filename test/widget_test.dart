// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
//import 'package:integration_test/integration_test.dart'; QR코드 스캐너테스트 코드

import 'package:flutting_workout/main.dart';
//import 'package:flutting_workout/screens/equipment_usage.dart'; QR코드 스캐너테스트 코드

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

//QR 코드 스캔 테스트
/*
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("QR Code Scan Test", (WidgetTester tester) async {
    // 앱을 렌더링합니다.
    await tester.pumpWidget(MaterialApp(home: CameraQRPage()));

    // QRView가 준비되기를 기다립니다.
    await tester.pumpAndSettle();

    // 특정 UI 요소의 존재를 확인합니다.
    expect(find.byType(QRView), findsOneWidget);
    expect(find.text('Scan a QR code'), findsOneWidget);

    // 실제 QR 코드 스캔을 시뮬레이션하는 것은 현재 가능한 테스트 범위를 넘어섭니다.
    // QR 코드 스캐너의 응답을 검증하기 위해 목 객체나 더미 데이터를 사용하는 테스트는
    // 일반적으로 가능하지 않습니다.
    // 대신, 앱이 QR 코드 스캐너 화면을 제대로 렌더링하는지 확인하는 것이 중요합니다.
  });
}*/
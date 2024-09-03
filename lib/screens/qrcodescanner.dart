import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

// QR 코드 스캔 기능을 포함한 카메라 앱의 StatefulWidget
class QRScannerApp extends StatefulWidget {
  final CameraDescription camera;

  // 생성자를 통해 선택된 카메라를 전달
  QRScannerApp({required this.camera});

  @override
  _QRScannerAppState createState() => _QRScannerAppState();
}

// QR 코드 스캔 기능을 포함한 카메라 앱의 상태를 관리하는 클래스
class _QRScannerAppState extends State<QRScannerApp> {
  late CameraController _cameraController;  // 카메라 컨트롤러 객체
  QRViewController? _qrViewController;  // QR 코드 스캔을 제어하는 컨트롤러
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');  // QR 스캐너의 키
  Barcode? _scanResult;  // QR 코드 스캔 결과를 저장할 변수

  @override
  void initState() {
    super.initState();

    // 카메라 컨트롤러 초기화
    _cameraController = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    // 카메라 초기화 후 화면을 갱신
    _cameraController.initialize().then((_) {
      if (!mounted) return;
      setState(() {});
    });
  }

  @override
  void dispose() {
    // 화면이 종료될 때 리소스를 해제
    _cameraController.dispose();
    _qrViewController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 카메라 초기화가 완료되지 않은 경우 빈 컨테이너를 반환
    if (!_cameraController.value.isInitialized) {
      return Container();
    }

    // 화면에 QR 코드 스캐너와 카메라 미리보기를 표시
    return Scaffold(
      appBar: AppBar(title: Text('운동 기구 설명')),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.yellow,
                borderRadius: 10,
                borderLength: 20,
                borderWidth: 10,
                cutOutSize: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (_scanResult != null)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${_scanResult!.code}'),
                        SizedBox(height: 10),
                        _scanResult!.code!.startsWith('http')
                            ? ElevatedButton(
                                onPressed: () => _launchURL(_scanResult!.code!),
                                child: Text('링크열기'),
                              )
                            : Container(),
                      ],
                    )
                  : Text('QR코드를 스캔해주세요!'),
            ),
          ),
        ],
      ),
    );
  }

  // QR 뷰가 생성되었을 때 호출되는 콜백 함수
  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      _qrViewController = controller;
    });

    // QR 코드 스캔 결과를 스트림에서 수신하여 처리
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        _scanResult = scanData;
      });
    });
  }

  // URL을 열기 위한 메서드
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

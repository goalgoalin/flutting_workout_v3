 import 'package:flutter/material.dart';
 //import 'package:webview_flutter/webview_flutter.dart';

  class HealthGymMapScreen extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.white,
       appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            // Handle back button press
          },
        ),
        backgroundColor: Color(0xFF561689),
         title: Text(
          '내 주변 헬스장',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
       ),
       /*body: WebView(
         initialUrl: 'assets/kakao_map.html',
         javascriptMode: JavascriptMode.unrestricted,
         onWebViewCreated: (WebViewController webViewController) {
           webViewController.loadUrl(Uri.dataFromString(
             '''
             <html>
               <head>
                 <style>html, body { margin: 0; padding: 0; height: 100%; }</style>
                 <meta name="viewport" content="width=device-width, initial-scale=1.0">
               </head>
               <body>
                 <iframe src="assets/kakao_map.html" width="100%" height="100%" frameborder="0"></iframe>
               </body>
             </html>
             ''',
             mimeType: 'text/html',
             encoding: Encoding.getByName('utf-8')
           ).toString());
         },
       ),*/
     );
   }
 }

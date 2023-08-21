import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AppWebView extends StatefulWidget {
  const AppWebView({super.key, this.baseUrl});
  final String? baseUrl;
  @override
  State<AppWebView> createState() => _AppWebViewState();
}

class _AppWebViewState extends State<AppWebView> {
  late WebViewController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.baseUrl ?? 'https://flutter.dev'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(controller: controller),
    );
  }
}
//   Widget _buildWebView() {
//     WebView webView = WebView(
//       // initialUrl: _prepareWebViewUrl(widget.webUrl),
//       javascriptMode: JavascriptMode.unrestricted,
//       onWebViewCreated: (WebViewController webViewController) async {
//         Map<String, String> headers = {
//           "x-requested-with": "com.awecode.edusanjal",
//           "platform": Platform.isAndroid ? "android" : "ios"
//         };

//         webViewController.loadUrl(_prepareWebViewUrl(widget.webUrl),
//             headers: headers);
//         controller.complete(webViewController);
//       },
//       onPageStarted: (url) async {
//         debugPrint("on page started: $url");
//       },
//       onPageFinished: (url) async {
//         debugPrint("on page finished: $url");
//       },
//       onProgress: (progress) {
//         debugPrint("on page progress: $progress");
//         if (progress == 100)
//           setState(() {
//             isLoading = false;
//           });
//         else
//           setState(() {
//             isLoading = true;
//           });
//       },
//       gestureNavigationEnabled: true,
//       navigationDelegate: (action) async {
//         return NavigationDecision.navigate;
//       },
//       debuggingEnabled: false,
//     );

//     var view = Stack(children: <Widget>[
//       webView,
//       isLoading
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : Stack(),
//     ]);
//     return view;
//   }
// }

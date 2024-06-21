import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class WebViewe extends StatefulWidget {
  const WebViewe({super.key});
  @override
  State<WebViewe> createState() => WebVieweState();
}

class WebVieweState extends State<WebViewe> {
  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://www.ansuataohanoi.com/getregister'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng ký tài khoản'),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}

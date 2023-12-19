import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewFlutterController extends GetxController {
  final WebViewController controller = WebViewController();

  void loadRequest(String url) {
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) => debugPrint("----------onPageStarted, url = $url"),
        onPageFinished: (url) => debugPrint("----------onPageFinished, url = $url"),
        onProgress: (progress) => debugPrint("----------onProgress, progress = ${progress.toString()}"),
        onNavigationRequest: (request) {
          debugPrint("----------onNavigationRequest, request.url = ${request.url}");
          return NavigationDecision.navigate;
        },
        onWebResourceError: (error) => debugPrint("----------onWebResourceError, error.description = ${error.description}"),
      ))
      ..loadRequest(Uri.parse(url));
  }
}

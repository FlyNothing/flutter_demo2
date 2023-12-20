// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_demo2/common/global/global_theme_config.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class PlatformWebviewFlutterController extends GetxController {
  WebViewController controller = WebViewController();
  PlatformNavigationDelegateCreationParams params = const PlatformNavigationDelegateCreationParams();

  loadRequest(String url) {
    controller.loadRequest(Uri.parse(url));
    // 使用PlatformWebViewController配置会覆盖WebViewController配置
    controller.platform
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(gColorWhite)
      ..setPlatformNavigationDelegate(
        WebViewPlatform.instance is WebKitWebViewPlatform
            ? WebKitNavigationDelegate(WebKitNavigationDelegateCreationParams.fromPlatformNavigationDelegateCreationParams(params))
            : AndroidNavigationDelegate(AndroidNavigationDelegateCreationParams.fromPlatformNavigationDelegateCreationParams(params)),
      );
  }
}

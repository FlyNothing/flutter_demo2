import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class FlutterInappwebController extends GetxController {
  late String url;
  late PullToRefreshController? pullToRefreshController;

  void loadRequest(String lUrl) {
    url = lUrl;
    pullToRefreshController = GetPlatform.isWeb
        ? null
        : PullToRefreshController(
            settings: PullToRefreshSettings(color: Colors.blue, backgroundColor: Colors.green),
            onRefresh: () => debugPrint("PullToRefreshController onRefresh"),
          );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/global/global_theme_config.dart';
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
            settings: PullToRefreshSettings(color: gColorLightPrimary, backgroundColor: gColorGreen),
            onRefresh: () => debugPrint("PullToRefreshController onRefresh"),
          );
  }
}

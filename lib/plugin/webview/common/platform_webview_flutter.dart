// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/plugin/webview/common/platform_webview_flutter_controller.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PlatformWebviewFlutter extends GetView<PlatformWebviewFlutterController> {
  const PlatformWebviewFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: "Webview2"),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Center(
      child: WebViewWidget(controller: controller.controller),
    );
  }
}

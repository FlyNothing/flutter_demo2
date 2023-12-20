// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/plugin/webview/common/webview_flutter_controller.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewFlutter extends GetView<WebviewFlutterController> {
  const WebviewFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gAppBar("Webview1"),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Center(
      child: WebViewWidget(controller: controller.controller),
    );
  }
}

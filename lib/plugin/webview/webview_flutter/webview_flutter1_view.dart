import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/plugin/webview/common/webview_flutter.dart';
import 'package:flutter_demo2/plugin/webview/common/webview_flutter_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WebviewFlutter1View extends StatelessWidget {
  WebviewFlutter1View({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gAppBar("Webview1"),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Column(
      children: [
        _getUrlTextField(),
        gTextButton(
          "打开",
          () => Get.to(const WebviewFlutter(), binding: BindingsBuilder(() {
            var controller = Get.put<WebviewFlutterController>(WebviewFlutterController());
            controller.loadRequest(_controller.text);
          })),
        ),
      ],
    );
  }

  Container _getUrlTextField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.w),
      height: 40.h,
      width: 1.sw,
      child: gTextField(_controller, hintText: "请输入需要打开的网址"),
    );
  }
}

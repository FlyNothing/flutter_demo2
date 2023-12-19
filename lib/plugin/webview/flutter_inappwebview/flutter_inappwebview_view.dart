import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/plugin/webview/common/flutter_inappwebview.dart';
import 'package:flutter_demo2/plugin/webview/common/flutter_inappwebview_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FlutterInappwebviewView extends StatelessWidget {
  FlutterInappwebviewView({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: "Inappwebview1"),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Column(
      children: [
        _getUrlTextField(),
        StandardTextButton(
          "打开",
          () => Get.to(const FlutterInappwebview(), binding: BindingsBuilder(() {
            var controller = Get.put<FlutterInappwebController>(FlutterInappwebController());
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
      child: StandardTextField(_controller, hintText: "请输入需要打开的网址"),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/plugin/screenshot/screenshot_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

class ScreenshotView extends GetView<ScreenshotGetxController> {
  const ScreenshotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'Screenshot测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Column(
      children: [
        _getViewContainer(),
        Padding(padding: EdgeInsets.symmetric(vertical: 10.h)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StandardTextButton("页面部件", () => controller.controller1.capture().then((value) => _showDialog(context, value))),
            StandardTextButton("未展示的部件", () => controller.controller2.captureFromWidget(_getContainer()).then((value) => _showDialog(context, value))),
          ],
        )
      ],
    );
  }

  Screenshot _getViewContainer() {
    return Screenshot(
      controller: controller.controller1,
      child: Container(
        height: 0.6.sh,
        width: double.infinity,
        color: Colors.green,
        alignment: Alignment.center,
        child: Container(
          color: Colors.purple,
          height: 0.4.sh,
          width: 0.6.sw,
          alignment: Alignment.center,
          child: const Text("截图可见区域"),
        ),
      ),
    );
  }

  Screenshot _getContainer() {
    return Screenshot(
      controller: controller.controller2,
      child: Container(
        height: 0.6.sh,
        width: double.infinity,
        color: Colors.red,
        alignment: Alignment.center,
        child: Container(
          color: Colors.yellow,
          height: 0.4.sh,
          width: 0.6.sw,
          alignment: Alignment.center,
          child: const Text("截图不在组件树结构中的区域"),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, Uint8List? data) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.zero,
          child: data == null
              ? Container(
                  height: 0.6.sh,
                  width: double.infinity,
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: const Text("未抓取到截图"),
                )
              : Image.memory(data),
        );
      },
    );
  }
}

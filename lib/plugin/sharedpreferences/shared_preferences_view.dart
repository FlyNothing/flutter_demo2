import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/common/util/text_style.dart';
import 'package:flutter_demo2/plugin/sharedpreferences/shared_preferences_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SharedPreferencesView extends GetView<SharedPreferencesController> {
  const SharedPreferencesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'SharedPreferences测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Container(
            padding: EdgeInsets.only(top: 30.h, bottom: 40.h),
            width: double.infinity,
            child: Text(
              "当前值为: ${controller.intValue}",
              style: size22W600(color: Colors.red),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StandardTextButton("加一", () => controller.increment()),
            StandardTextButton("减一", () => controller.decrement()),
          ],
        )
      ],
    );
  }
}

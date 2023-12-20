import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/plugin/easyloading/page/easy_loading_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EasyLoadingView extends GetView<EasyLoadingController> {
  const EasyLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gAppBar('EasyLoading测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Wrap(
        spacing: 20.w,
        runSpacing: 10.h,
        children: [
          gTextButton('push', () => controller.push()),
          gTextButton('dismiss', () => controller.dismiss()),
          gTextButton('show', () => controller.show()),
          gTextButton('showInfo', () => controller.showInfo()),
          gTextButton('showToast', () => controller.showToast()),
          gTextButton('showSuccess', () => controller.showSuccess()),
          gTextButton('showError', () => controller.showError()),
          gTextButton('showProgress', () => controller.showProgress()),
        ],
      ),
    );
  }
}

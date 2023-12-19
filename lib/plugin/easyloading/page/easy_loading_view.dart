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
      appBar: appBarStandard(title: 'EasyLoading测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        spacing: 20.w,
        runSpacing: 10.h,
        children: [
          StandardTextButton('push', () => controller.push()),
          StandardTextButton('dismiss', () => controller.dismiss()),
          StandardTextButton('show', () => controller.show()),
          StandardTextButton('showInfo', () => controller.showInfo()),
          StandardTextButton('showToast', () => controller.showToast()),
          StandardTextButton('showSuccess', () => controller.showSuccess()),
          StandardTextButton('showError', () => controller.showError()),
          StandardTextButton('showProgress', () => controller.showProgress()),
        ],
      ),
    );
  }
}

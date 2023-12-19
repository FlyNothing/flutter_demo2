import 'package:flutter/material.dart';
import 'package:flutter_demo2/base/widget/progressindicator/circular_progress_indicator_controller.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/common/util/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LinearProgressIndicatorView extends GetView<ProgressIndicatorController> {
  const LinearProgressIndicatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: "线性指示器"),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Center(
      child: Column(
        children: [
          AnimatedBuilder(
            animation: controller.controller,
            builder: (context, child) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 100.h, bottom: 15.h),
                    child: Text(
                      "${(controller.controller.value * 100).round()}%",
                      style: size16W500(color: Colors.blue),
                    ),
                  ),
                  SizedBox(
                      width: 1.sw - 50.w,
                      child: LinearProgressIndicator(
                        minHeight: 6.h,
                        backgroundColor: Colors.grey[400],
                        valueColor: controller.colorAnimation,
                        value: controller.controller.value,
                      ))
                ],
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 40.h),
            child: Text("正在加载中", style: size16W600(color: Colors.blue)),
          ),
        ],
      ),
    );
  }
}

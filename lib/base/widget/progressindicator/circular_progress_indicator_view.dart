import 'package:flutter/material.dart';
import 'package:flutter_demo2/base/widget/progressindicator/circular_progress_indicator_controller.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/common/util/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CircularProgressIndicatorView extends GetView<ProgressIndicatorController> {
  const CircularProgressIndicatorView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: '圆形指示器'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              _getProgress(),
              _getContent(),
            ],
          ),
        )
      ],
    );
  }

  Padding _getProgress() {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: AnimatedBuilder(
        animation: controller.controller,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 80.w,
                height: 80.h,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey[400],
                  valueColor: controller.colorAnimation,
                  value: controller.controller.value,
                  strokeWidth: 6,
                ),
              ),
              Text(
                "${(controller.controller.value * 100).round()}%",
                style: size16W400(color: Colors.indigo),
              )
            ],
          );
        },
      ),
    );
  }

  Padding _getContent() {
    return Padding(
      padding: EdgeInsets.only(top: 40.h, bottom: 40.h),
      child: Text("正在加载中", style: size16W600(color: Colors.indigo)),
    );
  }
}

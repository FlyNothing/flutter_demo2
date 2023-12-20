import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_date_picker_timeline/flutter_date_picker_timeline.dart';
import 'package:flutter_demo2/common/global/global_theme_config.dart';
import 'package:flutter_demo2/common/util/date.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/common/util/text_style.dart';
import 'package:flutter_demo2/plugin/flutterdatepickertimeline/flutter_date_picker_timeline_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FlutterDatePickerTimelineView extends GetView<FlutterDatePickerTimelineController> {
  const FlutterDatePickerTimelineView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gAppBar('水平日期选择器测试2'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Column(
      children: [
        _getDatePicker(),
        _getDateText(),
      ],
    );
  }

  Container _getDatePicker() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20.w),
      child: FlutterDatePickerTimeline(
        startDate: DateTime(controller.selectDay.value.year, controller.selectDay.value.month, 1),
        endDate: DateTime(controller.selectDay.value.year, controller.selectDay.value.month + 1, 1).add(const Duration(days: -1)),
        initialSelectedDate: controller.selectDay.value,
        initialFocusedDate: controller.selectDay.value,
        itemHeight: 30.h,
        unselectedItemWidth: 30.w,
        unselectedItemTextStyle: size16W400(),
        selectedItemWidth: 30.w,
        selectedItemBackgroundColor: gColorLightPrimary,
        selectedItemTextStyle: size16W400(color: gColorWhite),
        itemRadius: 30.w,
        selectedItemMargin: const EdgeInsets.symmetric(horizontal: 10),
        unselectedItemMargin: const EdgeInsets.symmetric(horizontal: 10),
        onSelectedDateChange: (DateTime? dateTime) {
          Timer(const Duration(milliseconds: 100), () async {
            controller.setDateTime(dateTime ?? DateTime.now());
          });
        },
      ),
    );
  }

  Container _getDateText() {
    return Container(
      padding: EdgeInsets.all(20.w),
      alignment: Alignment.centerLeft,
      child: Obx(() => Text("您选择的日期是：${DateUtil.toDay(controller.selectDay.value)}", style: size14W600())),
    );
  }
}

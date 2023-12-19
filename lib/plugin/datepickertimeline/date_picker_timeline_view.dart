import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/date.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/common/util/text_style.dart';
import 'package:flutter_demo2/plugin/datepickertimeline/date_picker_timeline_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DatePickerTimelineView extends GetView<DatePickerTimelineController> {
  const DatePickerTimelineView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: '水平日期选择器测试1'),
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
      child: DatePicker(
        DateTime(controller.selectDay.value.year, controller.selectDay.value.month, 1),
        width: 60.w,
        height: 100.h,
        controller: DatePickerController(),
        selectedTextColor: Colors.white,
        selectionColor: Colors.blue,
        initialSelectedDate: controller.selectDay.value,
        activeDates: [
          DateTime.now().add(const Duration(days: 1)),
          DateTime.now().add(const Duration(days: 2)),
        ],
        locale: "zh_CN",
        onDateChange: (date) => controller.setDateTime(date),
        daysCount: 30,
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

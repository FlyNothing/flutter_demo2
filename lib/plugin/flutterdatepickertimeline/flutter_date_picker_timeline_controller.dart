import 'package:get/get.dart';

class FlutterDatePickerTimelineController extends GetxController {
  var selectDay = DateTime.now().obs; // 当前日期

  setDateTime(DateTime date) {
    selectDay.value = date;
  }
}

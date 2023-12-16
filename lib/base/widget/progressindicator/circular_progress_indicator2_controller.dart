import 'package:get/get.dart';

class CircularProgressIndicator2Controller extends GetxController {
  var percent = 0.obs;

  @override
  void onInit() {
    _calcPercent();
    super.onInit();
  }

  void _calcPercent() async {
    for (int i = 0; i < 100; i++) {
      await Future.delayed(const Duration(milliseconds: 50));
      percent.value = i + 1;
    }
  }
}

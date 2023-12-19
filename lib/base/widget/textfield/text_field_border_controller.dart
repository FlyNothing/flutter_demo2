import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldBorderController extends GetxController {
  late TextEditingController controller1;
  late TextEditingController controller2;
  late TextEditingController controller3;
  late TextEditingController controller4;

  @override
  void onInit() {
    super.onInit();
    controller1 = TextEditingController();
    controller2 = TextEditingController();
    controller3 = TextEditingController();
    controller4 = TextEditingController();
  }

  @override
  void onClose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    super.onClose();
  }
}

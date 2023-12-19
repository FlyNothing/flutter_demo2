import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ValueNotifierController extends GetxController {
  late ValueNotifier<int> ageNotifier;
  late ValueNotifier<String> nameNotifier;
  late TextEditingController nameController;
  late TextEditingController ageController;
  var age = 0.obs;

  @override
  void onInit() {
    super.onInit();
    ageNotifier = ValueNotifier(0);
    ageNotifier.addListener(_setAge);
    nameNotifier = ValueNotifier("");
    nameController = TextEditingController();
    ageController = TextEditingController();
  }

  @override
  void onClose() {
    ageNotifier.removeListener(_setAge);
    ageNotifier.dispose();
    nameNotifier.dispose();
    nameController.dispose();
    ageController.dispose();
    super.onClose();
  }

  void _setAge() {
    age.value = ageNotifier.value;
  }
}

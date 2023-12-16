import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircularProgressIndicatorController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> colorAnimation;
  final int _durationSeconds = 5;

  @override
  void onInit() {
    controller = AnimationController(vsync: this, duration: Duration(seconds: _durationSeconds));
    controller.forward();
    colorAnimation = ColorTween(begin: Colors.blue, end: Colors.blue).animate(
      CurvedAnimation(parent: controller, curve: Curves.linear),
    );
    super.onInit();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}

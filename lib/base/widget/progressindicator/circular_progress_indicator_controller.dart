import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/global/global_theme_config.dart';
import 'package:get/get.dart';

class ProgressIndicatorController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> colorAnimation;
  final int _durationSeconds = 5;

  @override
  void onInit() {
    super.onInit();
    controller = AnimationController(vsync: this, duration: Duration(seconds: _durationSeconds));
    controller.forward();
    colorAnimation = ColorTween(begin: gColorLightPrimary, end: gColorLightPrimary).animate(
      CurvedAnimation(parent: controller, curve: Curves.linear),
    );
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}

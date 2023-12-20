import 'package:flutter/material.dart';
import 'package:flutter_demo2/base/widget/bottomnavigationbar/navigation_bar_hidden_controller.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:get/get.dart';

class NavigationBarHiddenView extends GetView<NavigationBarHiddenController> {
  const NavigationBarHiddenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gAppBar("NavigationBar测试"),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return Obx(
      () => Center(
        child: gTextButton(
          controller.visible.value ? "HideBar" : "ShowBar",
          () => controller.switchVisible(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_demo2/base/widget/bottomnavigationbar/navigation_bar_hidden_controller.dart';
import 'package:flutter_demo2/common/util/global_widget.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:get/get.dart';

class NavigationBarHiddenView extends StatelessWidget {
  const NavigationBarHiddenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: "NavigationBar测试"),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return Center(
      child: GetBuilder<NavigationBarHiddenController>(
        init: NavigationBarHiddenController(),
        builder: (controller) => StandardTextButton(
          controller.visible ? "HideBar" : "ShowBar",
          () => controller.switchVisible(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/global/global_data.dart';
import 'package:flutter_demo2/home/home_controller.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: bottomBarList,
          currentIndex: controller.barIndex,
          onTap: (int index) => controller.setIndex(index),
          type: BottomNavigationBarType.fixed,
        ),
        body: bottomBarDataList[controller.barIndex]['page'],
      ),
    );
  }
}

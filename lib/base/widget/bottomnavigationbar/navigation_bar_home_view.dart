import 'package:flutter/material.dart';
import 'package:flutter_demo2/base/widget/bottomnavigationbar/navigation_bar_hidden_controller.dart';
import 'package:flutter_demo2/base/widget/bottomnavigationbar/navigation_bar_hidden_view.dart';
import 'package:flutter_demo2/base/widget/bottomnavigationbar/navigation_bar_show_view.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

List _barList = [
  {'text': 'Show1', 'icon': const Icon(Icons.visibility), 'page': const NavigationBarShowView("Page1")},
  {'text': 'Show2', 'icon': const Icon(Icons.visibility), 'page': const NavigationBarShowView("Page2")},
  {'text': 'Hidden', 'icon': const Icon(Icons.disabled_visible), 'page': const NavigationBarHiddenView()},
];

List<BottomNavigationBarItem> _myTabs = List.generate(
  _barList.length,
  (index) => BottomNavigationBarItem(
    icon: _barList[index]['icon'],
    label: _barList[index]['text'],
  ),
);

class NavigationBarHomeView extends StatelessWidget {
  const NavigationBarHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationBarHiddenController>(
      init: NavigationBarHiddenController(),
      builder: (controller) => Scaffold(
        bottomNavigationBar: Visibility(
          visible: controller.visible,
          child: BottomNavigationBar(
            items: _myTabs,
            currentIndex: controller.index,
            onTap: (index) => controller.setIndex(index),
            type: BottomNavigationBarType.fixed,
          ),
        ),
        body: _barList[controller.index]['page'],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_demo2/base/base_menu_config.dart';
import 'package:flutter_demo2/common/page/base_menu_view.dart';

final List bottomBarDataList = [
  {'text': 'Base', 'icon': const Icon(Icons.account_balance), 'page': BaseMenuView('Flutter基础', baseMenuList)},
  // {'text': 'Issue', 'icon': const Icon(Icons.ac_unit), 'page': BaseMenuView('问题修复', issueMenuList)},
  // {'text': 'Plugin', 'icon': const Icon(Icons.access_alarms), 'page': const BaseMenuView()},
  {'text': 'Issue', 'icon': const Icon(Icons.ac_unit), 'page': BaseMenuView('问题修复', [])},
  {'text': 'Plugin', 'icon': const Icon(Icons.access_alarms), 'page': BaseMenuView('插件', [])},
];

final List<BottomNavigationBarItem> bottomBarList = List.generate(
  bottomBarDataList.length,
  (i) => BottomNavigationBarItem(
    icon: bottomBarDataList[i]['icon'],
    label: bottomBarDataList[i]['text'],
  ),
);

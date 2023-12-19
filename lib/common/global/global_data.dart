import 'package:flutter/material.dart';
import 'package:flutter_demo2/base/base_menu_config.dart';
import 'package:flutter_demo2/common/page/base_menu_view.dart';
import 'package:flutter_demo2/issue/issue_menu_config.dart';
import 'package:flutter_demo2/plugin/plugin_menu_view.dart';
import 'package:get/get.dart';

final List bottomBarDataList = [
  {'text': 'bottomBarBase'.tr, 'icon': const Icon(Icons.account_balance), 'page': BaseMenuView('appBarTitleBase'.tr, baseMenuList)},
  {'text': 'bottomBarIssue'.tr, 'icon': const Icon(Icons.ac_unit), 'page': BaseMenuView('appBarTitleIssue'.tr, issueMenuList)},
  {'text': 'bottomBarPlugin'.tr, 'icon': const Icon(Icons.access_alarms), 'page': const PluginMenuView()},
];

final List<BottomNavigationBarItem> bottomBarList = List.generate(
  bottomBarDataList.length,
  (i) => BottomNavigationBarItem(
    icon: bottomBarDataList[i]['icon'],
    label: bottomBarDataList[i]['text'],
  ),
);

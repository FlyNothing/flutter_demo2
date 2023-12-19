import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/common/vo/base_menu_vo.dart';

List<BaseMenuVO> issueMenuList = [
  BaseMenuVO("测试页面", Scaffold(appBar: appBarStandard(title: '测试页面'), body: const Center(child: Text("测试页面")))),
];

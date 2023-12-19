import 'package:flutter_demo2/common/vo/base_menu_vo.dart';
import 'package:flutter_demo2/plugin/pulltorefresh/pull_to_refresh_controller.dart';
import 'package:flutter_demo2/plugin/pulltorefresh/pull_to_refresh_view.dart';
import 'package:get/get.dart';

List<BaseMenuVO> pullToRefreshMenuList = [
  BaseMenuVO("PullToRefresh", const PullToRefreshView(), binding: BindingsBuilder.put(() => PullToRefreshController())),
];

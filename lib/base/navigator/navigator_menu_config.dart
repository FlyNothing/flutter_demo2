import 'package:flutter_demo2/base/navigator/1.0/origin_view.dart';
import 'package:flutter_demo2/base/navigator/2.0/navigator/listitem_navigator_app.dart';
import 'package:flutter_demo2/base/navigator/2.0/router/listitem_navigator_router_app.dart';
import 'package:flutter_demo2/common/vo/base_menu_vo.dart';

List<BaseMenuVO> navigatorMenuList = [
  BaseMenuVO("路由1.0测试", const OriginView()),
  BaseMenuVO("路由2.0测试1", const ListitemNavigatorApp()),
  BaseMenuVO("路由2.0测试2", const ListitemNavigatorRouterApp()),
];

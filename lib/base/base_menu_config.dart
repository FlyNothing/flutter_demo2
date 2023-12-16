import 'package:flutter_demo2/base/enumpage/enum_menu_config.dart';
import 'package:flutter_demo2/base/navigator/navigator_menu_config.dart';
import 'package:flutter_demo2/base/widget/widget_menu_config.dart';
import 'package:flutter_demo2/common/page/base_menu_view.dart';
import 'package:flutter_demo2/base/futuretimer/future_view.dart';
import 'package:flutter_demo2/base/stream/stream_view.dart';
import 'package:flutter_demo2/base/theme/theme_view.dart';

import 'package:flutter_demo2/common/vo/base_menu_vo.dart';

List<BaseMenuVO> baseMenuList = [
  BaseMenuVO("常用码表", BaseMenuView("常用码表", enumMenuList)),
  BaseMenuVO("路由", BaseMenuView("路由", navigatorMenuList)),
  BaseMenuVO("常用部件", BaseMenuView("常用部件", widgetMenuList)),
  BaseMenuVO("FutureBuilder", const FutureView()),
  BaseMenuVO("StreamBuilder", const StreamView()),
  BaseMenuVO("主题", const ThemeView()),
];

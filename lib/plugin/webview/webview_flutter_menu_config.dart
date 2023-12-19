import 'package:flutter_demo2/common/vo/base_menu_vo.dart';
import 'package:flutter_demo2/plugin/webview/webview_flutter/webview_flutter1_view.dart';
import 'package:flutter_demo2/plugin/webview/webview_flutter/webview_flutter2_view.dart';

List<BaseMenuVO> webviewFlutterMenuList = [
  BaseMenuVO("Webview1", WebviewFlutter1View()),
  BaseMenuVO("Webview2", WebviewFlutter2View()),
];

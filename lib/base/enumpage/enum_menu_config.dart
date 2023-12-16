import 'package:flutter_demo2/base/enumpage/blend_mode_view.dart';
import 'package:flutter_demo2/base/enumpage/box_fit_view.dart';
import 'package:flutter_demo2/common/vo/base_menu_vo.dart';

List<BaseMenuVO> enumMenuList = [
  BaseMenuVO("BoxFit模式", const BoxFitView()),
  BaseMenuVO("BlendMode模式", const BlendModeView()),
];

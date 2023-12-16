import 'package:flutter_demo2/common/vo/base_menu_vo.dart';
import 'package:flutter_demo2/base/widget/progressindicator/circular_progress_indicator_view.dart';
import 'package:flutter_demo2/base/widget/progressindicator/circular_progress_indicator2_view.dart';
import 'package:flutter_demo2/base/widget/progressindicator/linear_progress_indicator_view.dart';

List<BaseMenuVO> progressIndicatorMenuList = [
  BaseMenuVO("圆形指示器1", const CircularProgressIndicatorView()),
  BaseMenuVO("圆形指示器2", const CircularProgressIndicator2View()),
  BaseMenuVO("线性指示器", const LinearProgressIndicatorView()),
];

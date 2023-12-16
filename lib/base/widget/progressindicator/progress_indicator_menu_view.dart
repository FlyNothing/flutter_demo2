import 'package:flutter_demo2/base/widget/progressindicator/circular_progress_indicator2_controller.dart';
import 'package:flutter_demo2/base/widget/progressindicator/circular_progress_indicator_controller.dart';
import 'package:flutter_demo2/base/widget/progressindicator/linear_progress_indicator_controller.dart';
import 'package:flutter_demo2/common/vo/base_menu_vo.dart';
import 'package:flutter_demo2/base/widget/progressindicator/circular_progress_indicator_view.dart';
import 'package:flutter_demo2/base/widget/progressindicator/circular_progress_indicator2_view.dart';
import 'package:flutter_demo2/base/widget/progressindicator/linear_progress_indicator_view.dart';
import 'package:get/get.dart';

List<BaseMenuVO> progressIndicatorMenuList = [
  BaseMenuVO("圆形指示器1", const CircularProgressIndicatorView(), binding: BindingsBuilder.put(() => CircularProgressIndicatorController())),
  BaseMenuVO("圆形指示器2", const CircularProgressIndicator2View(), binding: BindingsBuilder.put(() => CircularProgressIndicator2Controller())),
  BaseMenuVO("线性指示器", const LinearProgressIndicatorView(), binding: BindingsBuilder.put(() => LinearProgressIndicatorController())),
];

import 'package:flutter_demo2/base/widget/bottom_sheet_view.dart';
import 'package:flutter_demo2/base/widget/bottomnavigationbar/navigation_bar_hidden_controller.dart';
import 'package:flutter_demo2/base/widget/image/image_controller.dart';
import 'package:flutter_demo2/base/widget/listview_gridview1_view.dart';
import 'package:flutter_demo2/base/widget/listview_gridview2_view.dart';
import 'package:flutter_demo2/base/widget/stack_gridview_view.dart';
import 'package:flutter_demo2/base/widget/textfield/text_field_border_controller.dart';
import 'package:flutter_demo2/base/widget/valuenotifier/value_notifier_controller.dart';
import 'package:flutter_demo2/base/widget/widget_view.dart';
import 'package:flutter_demo2/base/widget/bottomnavigationbar/navigation_bar_home_view.dart';
import 'package:flutter_demo2/base/widget/flexible/flexible_view.dart';
import 'package:flutter_demo2/base/widget/image/image_view.dart';
import 'package:flutter_demo2/base/widget/progressindicator/progress_indicator_menu_view.dart';
import 'package:flutter_demo2/base/widget/repaintboundary/repaint_boundary_view.dart';
import 'package:flutter_demo2/base/widget/textfield/text_field_border_view.dart';
import 'package:flutter_demo2/base/widget/transform/transform_view.dart';
import 'package:flutter_demo2/base/widget/valuenotifier/value_notifier_view.dart';
import 'package:flutter_demo2/common/page/base_menu_view.dart';
import 'package:flutter_demo2/common/vo/base_menu_vo.dart';
import 'package:get/get.dart';

List<BaseMenuVO> widgetMenuList = [
  BaseMenuVO("Widget测试", const WidgetView()),
  BaseMenuVO("底部弹窗", const BottomSheetView()),
  BaseMenuVO("ListView和GridView1", const ListviewGridview1View()),
  BaseMenuVO("ListView和GridView2", const ListviewGridview2View()),
  BaseMenuVO("Stack和GridView2", const StackGridviewView()),
  BaseMenuVO("指示器", BaseMenuView("指示器", progressIndicatorMenuList)),
  BaseMenuVO("隐藏NavigationBar", const NavigationBarHomeView(), binding: BindingsBuilder.put(() => NavigationBarHiddenController())),
  BaseMenuVO("文本框边框", const TextFieldBorderView(), binding: BindingsBuilder.put(() => TextFieldBorderController())),
  BaseMenuVO("截图", RepaintBoundaryView()),
  BaseMenuVO("Flexible和Expanded", FlexibleView()),
  BaseMenuVO("图片显示", const ImageView(), binding: BindingsBuilder.put(() => ImageController())),
  BaseMenuVO("转换", const TransformView()),
  BaseMenuVO("ValueNotifier", const ValueNotifierView(), binding: BindingsBuilder.put(() => ValueNotifierController())),
];

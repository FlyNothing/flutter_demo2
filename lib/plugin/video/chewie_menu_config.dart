import 'package:flutter_demo2/common/vo/base_menu_vo.dart';
import 'package:flutter_demo2/plugin/video/chewie/chewie_custom_view.dart';
import 'package:flutter_demo2/plugin/video/chewie/chewie_view.dart';

List<BaseMenuVO> chewieMenuList = [
  BaseMenuVO("Chewie", const ChewiePage("Chewie")),
  BaseMenuVO("自定义Chewie", const ChewieCustomPage("自定义Chewie")),
];

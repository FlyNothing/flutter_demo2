import 'package:flutter_demo2/common/vo/base_menu_vo.dart';
import 'package:flutter_demo2/plugin/video/chewie/chewie_controller.dart';
import 'package:flutter_demo2/plugin/video/chewie/chewie_custom_controller.dart';
import 'package:flutter_demo2/plugin/video/chewie/chewie_custom_view.dart';
import 'package:flutter_demo2/plugin/video/chewie/chewie_view.dart';
import 'package:get/get.dart';

List<BaseMenuVO> chewieMenuList = [
  BaseMenuVO("Chewie", const ChewieView(), binding: BindingsBuilder.put(() => ChewieGexController())),
  BaseMenuVO("自定义Chewie", const ChewieCustomView(), binding: BindingsBuilder.put(() => ChewieCustomController())),
];

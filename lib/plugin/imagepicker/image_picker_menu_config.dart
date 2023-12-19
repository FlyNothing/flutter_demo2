import 'package:flutter_demo2/common/vo/base_menu_vo.dart';
import 'package:flutter_demo2/plugin/imagepicker/image_picker_image_controller.dart';
import 'package:flutter_demo2/plugin/imagepicker/image_picker_image_view.dart';
import 'package:flutter_demo2/plugin/imagepicker/image_picker_video_controller.dart';
import 'package:flutter_demo2/plugin/imagepicker/image_picker_video_view.dart';
import 'package:get/get.dart';

List<BaseMenuVO> imagePickerMenuList = [
  BaseMenuVO("选择图片", const ImagePickerImageView(), binding: BindingsBuilder.put(() => ImagePickerImageController())),
  BaseMenuVO("选择视频", const ImagePickerVideoView(), binding: BindingsBuilder.put(() => ImagePickerVideoController())),
];

import 'package:flutter_demo2/common/vo/base_menu_vo.dart';
import 'package:flutter_demo2/plugin/imagepicker/image_picker_image_view.dart';
import 'package:flutter_demo2/plugin/imagepicker/image_picker_video_view.dart';

List<BaseMenuVO> imagePickerMenuList = [
  BaseMenuVO("选择图片", const ImagePickerImagePage()),
  BaseMenuVO("选择视频", const ImagePickerVideoPage()),
];

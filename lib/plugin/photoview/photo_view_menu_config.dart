import 'package:flutter_demo2/common/vo/base_menu_vo.dart';
import 'package:flutter_demo2/plugin/imagepicker/image_picker_image_controller.dart';
import 'package:flutter_demo2/plugin/photoview/photo_view_ctrl_controller.dart';
import 'package:flutter_demo2/plugin/photoview/photo_view_ctrl_view.dart';
import 'package:flutter_demo2/plugin/photoview/photo_view_custom_child_view.dart';
import 'package:flutter_demo2/plugin/photoview/photo_view_gallery_builder_view.dart';
import 'package:flutter_demo2/plugin/photoview/photo_view_gallery_view.dart';
import 'package:flutter_demo2/plugin/photoview/photo_view_scale_state_controller_controller.dart';
import 'package:flutter_demo2/plugin/photoview/photo_view_view.dart';
import 'package:flutter_demo2/plugin/photoview/photo_view_scale_state_controller_view.dart';
import 'package:get/get.dart';

List<BaseMenuVO> photoViewMenuList = [
  BaseMenuVO("PhotoView", const PhotoViewView()),
  BaseMenuVO("PhotoView.customChild", const PhotoViewCustomChildView(), binding: BindingsBuilder.put(() => PhotoViewCtrlController())),
  BaseMenuVO("PhotoViewGallery", const PhotoViewGalleryView(), binding: BindingsBuilder.put(() => ImagePickerImageController())),
  BaseMenuVO("PhotoViewGallery.builder", const PhotoViewGalleryBuilderView(), binding: BindingsBuilder.put(() => ImagePickerImageController())),
  BaseMenuVO("PhotoViewController", const PhotoViewCtrlView(), binding: BindingsBuilder.put(() => PhotoViewCtrlController())),
  BaseMenuVO("PhotoViewScaleStateController", const PhotoViewScaleStateControllerView(), binding: BindingsBuilder.put(() => PhotoViewScaleStateControllerController())),
];

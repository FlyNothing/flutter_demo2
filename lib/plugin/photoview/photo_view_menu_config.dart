import 'package:flutter_demo2/common/vo/base_menu_vo.dart';
import 'package:flutter_demo2/plugin/photoview/photo_view_controller_view.dart';
import 'package:flutter_demo2/plugin/photoview/photo_view_custom_child_view.dart';
import 'package:flutter_demo2/plugin/photoview/photo_view_gallery_builder_view.dart';
import 'package:flutter_demo2/plugin/photoview/photo_view_gallery_view.dart';
import 'package:flutter_demo2/plugin/photoview/photo_view_view.dart';
import 'package:flutter_demo2/plugin/photoview/photo_view_scale_state_controller_view.dart';

List<BaseMenuVO> photoViewMenuList = [
  BaseMenuVO("PhotoView", const PhotoViewPage()),
  BaseMenuVO("PhotoView.customChild", const PhotoViewCustomChildPage()),
  BaseMenuVO("PhotoViewGallery", const PhotoViewGalleryPage()),
  BaseMenuVO("PhotoViewGallery.builder", const PhotoViewGalleryBuilderPage()),
  BaseMenuVO("PhotoViewController", const PhotoViewControllerPage()),
  BaseMenuVO("PhotoViewScaleStateController", const PhotoViewScaleStateControllerPage()),
];

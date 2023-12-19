import 'package:flutter_demo2/common/vo/base_menu_vo.dart';
import 'package:flutter_demo2/plugin/video/video_player/video_player_asset_controller.dart';
import 'package:flutter_demo2/plugin/video/video_player/video_player_asset_view.dart';
import 'package:flutter_demo2/plugin/video/video_player/video_player_network_controller.dart';
import 'package:flutter_demo2/plugin/video/video_player/video_player_network_view.dart';
import 'package:get/get.dart';

List<BaseMenuVO> videoPlayerMenuList = [
  BaseMenuVO("Network视频", const VideoPlayerNetworkView(), binding: BindingsBuilder.put(() => VideoPlayerNetworkController())),
  BaseMenuVO("Asset视频", const VideoPlayerAssetView(), binding: BindingsBuilder.put(() => VideoPlayerAssetController())),
];

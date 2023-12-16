import 'package:flutter_demo2/common/vo/base_menu_vo.dart';
import 'package:flutter_demo2/plugin/video/video_player/video_player_asset_view.dart';
import 'package:flutter_demo2/plugin/video/video_player/video_player_network_view.dart';

List<BaseMenuVO> videoPlayerMenuList = [
  BaseMenuVO("Network视频", const VideoPlayerNetworkPage("Network视频")),
  BaseMenuVO("Asset视频", const VideoPlayerAssetPage("Asset视频")),
];

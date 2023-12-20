import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/global/global_theme_config.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/plugin/video/video_player/video_player_network_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerNetworkView extends GetView<VideoPlayerNetworkController> {
  const VideoPlayerNetworkView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gAppBar("Network视频"),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return GetBuilder<VideoPlayerNetworkController>(
      builder: (controller) => SizedBox(
        height: 1.sw * 9 / 16,
        width: 1.sw,
        child: Stack(
          children: controller.controller.value.isInitialized
              ? [
                  AspectRatio(
                    aspectRatio: controller.controller.value.aspectRatio,
                    child: VideoPlayer(controller.controller),
                  ),
                  Align(
                    child: IconButton(
                      onPressed: () => controller.switchPlay(),
                      icon: Icon(
                        controller.controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                        size: 50.w,
                        color: gColorLightPrimary,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ]
              : [
                  Container(color: gColorBlack87),
                ],
        ),
      ),
    );
  }
}

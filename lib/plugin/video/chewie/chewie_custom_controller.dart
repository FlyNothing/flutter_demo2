import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/text_style.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class ChewieCustomController extends GetxController {
  late VideoPlayerController controller;
  late ChewieController chewieController;

  @override
  void onInit() {
    super.onInit();
    controller = VideoPlayerController.asset("assets/videos/poppy-field.mp4");
    // _controller = VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4");
    controller.initialize().then((value) {
      chewieController = ChewieController(
        videoPlayerController: controller,
        optionsTranslation: OptionsTranslation(
          playbackSpeedButtonText: "倍速",
          subtitlesButtonText: "子标题",
          cancelButtonText: "取消",
        ),
        autoPlay: true,
        looping: true,
        showControlsOnInitialize: false,
        fullScreenByDefault: false,
        showOptions: true,
        additionalOptions: (context) => [
          OptionItem(
              onTap: () {
                debugPrint("自定义Options");
                Get.back();
              },
              iconData: Icons.close,
              title: "关闭")
        ],
        showControls: true,
        subtitle: Subtitles([
          Subtitle(index: 1, start: const Duration(seconds: 0), end: const Duration(seconds: 3), text: "前三秒"),
          Subtitle(index: 2, start: const Duration(seconds: 10), end: const Duration(seconds: 13), text: "中三秒")
        ]),
        subtitleBuilder: (context, subtitle) => Text(
          subtitle.toString(),
          style: size22W400(color: Colors.white),
        ),
        isLive: false,
        // 如果使用自定义按钮，则控件自带按钮将不再显示
        // customControls: Align(
        //   alignment: Alignment.bottomRight,
        //   child: StandardIconButton(Icons.close, () => Get.back(), color: Colors.white),
        // ),
      );
      update();
    });
  }

  @override
  void onClose() {
    controller.dispose();
    chewieController.dispose();
    super.onClose();
  }
}

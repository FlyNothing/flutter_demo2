import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class ChewieGexController extends GetxController {
  late VideoPlayerController controller;
  late ChewieController chewieController;

  @override
  void onInit() {
    super.onInit();
    controller = VideoPlayerController.asset("assets/videos/poppy-field.mp4");
    controller.initialize().then((value) {
      chewieController = ChewieController(
        videoPlayerController: controller,
        autoPlay: true,
        looping: true,
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

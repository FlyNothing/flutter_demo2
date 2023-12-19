import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerAssetController extends GetxController {
  late VideoPlayerController controller;

  @override
  void onInit() {
    super.onInit();
    controller = VideoPlayerController.asset("assets/videos/poppy-field.mp4");
    controller.setLooping(true);
    controller.initialize().then((value) => update());
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  switchPlay() {
    controller.value.isPlaying ? controller.pause() : controller.play();
    update();
  }
}

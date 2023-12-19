import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerNetworkController extends GetxController {
  late VideoPlayerController controller;

  @override
  void onInit() {
    super.onInit();
    // 已过时
    // controller = VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4");
    Uri url = Uri.parse("https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4");
    controller = VideoPlayerController.networkUrl(url);
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

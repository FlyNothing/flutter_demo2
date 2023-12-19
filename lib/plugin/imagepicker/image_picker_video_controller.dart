import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class ImagePickerVideoController extends GetxController {
  final ImagePicker _imagePicker = ImagePicker();
  VideoPlayerController? controller;

  @override
  void onClose() {
    controller?.dispose();
    super.onClose();
  }

  Future<void> pickVideo(ImageSource source) async {
    XFile? videoFile = await _imagePicker.pickVideo(source: source);
    if (videoFile != null) {
      controller = VideoPlayerController.file(File(videoFile.path));
      controller?.initialize();
      controller?.play();
      update();
    }
  }
}

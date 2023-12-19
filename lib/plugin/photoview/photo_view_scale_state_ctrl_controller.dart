import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewScaleStateCtrlController extends GetxController {
  final ImagePicker _imagePicker = ImagePicker();
  late PhotoViewScaleStateController controller;
  Image? image;

  @override
  void onInit() {
    super.onInit();
    controller = PhotoViewScaleStateController();
    controller.outputScaleStateStream.listen((state) {
      debugPrint("----------state.name=${state.name} index=${state.index} runtimeType=${state.runtimeType}");
    });

    debugPrint("----------prevScaleState ${controller.prevScaleState}");

    debugPrint("----------outputScaleStateStream ${controller.outputScaleStateStream}");
    debugPrint("----------hasChanged ${controller.hasChanged}");
    debugPrint("----------isZooming ${controller.isZooming}");
    debugPrint("----------scaleState ${controller.scaleState}");

    // _controller.addIgnorableListener(() {});
    // _controller.removeIgnorableListener(() {});
    // _controller.reset();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  Future<void> pickImage(ImageSource source) async {
    XFile? imageFile = await _imagePicker.pickImage(source: source);
    if (imageFile != null) {
      image = Image.file(File(imageFile.path), fit: BoxFit.cover);
      update();
    }
  }
}

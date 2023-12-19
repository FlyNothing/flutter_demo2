import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewCtrlController extends GetxController {
  final ImagePicker _imagePicker = ImagePicker();
  late PhotoViewController controller;
  Image? image;

  @override
  void onInit() {
    super.onInit();
    controller = PhotoViewController(
      initialPosition: const Offset(50, 50),
      initialRotation: 0,
      initialScale: 1.0,
    );
    controller.outputStateStream.listen((value) {
      debugPrint("----------value = $value");
    });

    debugPrint("----------initial ${controller.initial}");
    debugPrint("----------prevValue ${controller.prevValue}");

    debugPrint("----------outputStateStream ${controller.outputStateStream}");
    debugPrint("----------position ${controller.position}");
    debugPrint("----------rotation ${controller.rotation}");
    debugPrint("----------rotationFocusPoint ${controller.rotationFocusPoint}");
    debugPrint("----------scale ${controller.scale}");
    debugPrint("----------value ${controller.value}");

    // _controller.addIgnorableListener(() {});
    // _controller.removeIgnorableListener(() {});
    // _controller.reset();
    // _controller.updateMultiple();
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

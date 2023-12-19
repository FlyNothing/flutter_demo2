import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageController extends GetxController {
  late TextEditingController textController;
  var imageUrl = "".obs;

  @override
  void onInit() {
    super.onInit();
    textController = TextEditingController();
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }

  refreshImageUrl() {
    imageUrl.value = textController.text;
  }
}

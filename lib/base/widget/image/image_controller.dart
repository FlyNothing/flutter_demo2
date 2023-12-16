import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageController extends GetxController {
  late TextEditingController textController;
  var imageUrl = "".obs;

  refreshImageUrl() {
    imageUrl.value = textController.text;
  }

  @override
  void onInit() {
    textController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}

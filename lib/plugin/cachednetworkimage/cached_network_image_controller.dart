import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CachedNetworkImageController extends GetxController {
  late TextEditingController textController;
  var imageUrl = "".obs;

  refreshImageUrl() {
    imageUrl.value = textController.text;
  }

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
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PhotoViewCustomChildController extends GetxController {
  final ImagePicker _imagePicker = ImagePicker();
  Image? image;

  Future<void> pickImage(ImageSource source) async {
    XFile? imageFile = await _imagePicker.pickImage(source: source);
    if (imageFile != null) {
      image = Image.file(File(imageFile.path), fit: BoxFit.cover);
      update();
    }
  }
}

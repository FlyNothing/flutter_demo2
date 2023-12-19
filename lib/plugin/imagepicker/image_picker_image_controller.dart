import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerImageController extends GetxController {
  final ImagePicker _imagePicker = ImagePicker();
  var images = List.empty(growable: true).obs;

  Future<void> pickImage(ImageSource source) async {
    XFile? imageFile = await _imagePicker.pickImage(source: source);
    if (imageFile != null) {
      images.clear();
      images.add(Image.file(File(imageFile.path), fit: BoxFit.cover));
      update();
    }
  }

  Future<void> pickMultiImage() async {
    List<XFile>? imageFiles = await _imagePicker.pickMultiImage();
    if (imageFiles.isNotEmpty) {
      images.clear();
      images.addAll(
        List.generate(
          imageFiles.length,
          (index) => Image.file(File(imageFiles[index].path), fit: BoxFit.cover),
        ),
      );
    }
  }
}

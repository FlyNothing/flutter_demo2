import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/plugin/imagecropper/image_cropper_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';

class ImageCropperView extends StatelessWidget {
  const ImageCropperView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gAppBar('ImageCropper测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return GetBuilder<ImageCropperController>(
      init: ImageCropperController(),
      builder: (controller) => Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 10.h)),
                gTextButton("相册", () => controller.pickImage()),
                Padding(padding: EdgeInsets.symmetric(vertical: 10.h)),
                Container(
                  decoration: BoxDecoration(border: Border.all(width: 1)),
                  width: 0.8.sw,
                  height: 0.4.sh,
                  child: controller.croppedFile != null ? Image.file(File((controller.croppedFile as CroppedFile).path), fit: BoxFit.cover) : const SizedBox.shrink(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

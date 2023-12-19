import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/plugin/imagegallerysaver/image_gallery_saver_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ImageGallerySaverView extends GetView<ImageGallerySaverController> {
  const ImageGallerySaverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'ImageGallerySaver测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Column(
      children: [
        _getUrlTextField(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StandardTextButton("保存到相册", () => controller.saveToGallery()),
            StandardTextButton("查看相册", () => controller.pickImage()),
          ],
        )
      ],
    );
  }

  Container _getUrlTextField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.w),
      height: 40.h,
      width: 1.sw,
      child: StandardTextField(controller.controller, hintText: "请输入图片下载地址"),
    );
  }
}

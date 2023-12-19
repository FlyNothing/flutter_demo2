import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/plugin/photoview/photo_view_scale_state_controller_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewScaleStateControllerView extends GetView<PhotoViewScaleStateControllerController> {
  const PhotoViewScaleStateControllerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'PhotoViewScaleStateController'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Stack(
      children: [
        GetBuilder<PhotoViewScaleStateControllerController>(
          builder: (controller) => Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(border: Border.all(width: 1)),
              width: double.infinity,
              height: double.infinity,
              child: controller.image != null ? PhotoView(imageProvider: controller.image!.image, scaleStateController: controller.controller) : const SizedBox.shrink(),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: StandardTextButton("相册", () => controller.pickImage(ImageSource.gallery)),
          ),
        )
      ],
    );
  }
}

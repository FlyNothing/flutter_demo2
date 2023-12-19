import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/plugin/photoview/photo_view_custom_child_controller.dart';
// import 'package:flutter_demo2/common/util/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewCustomChildView extends GetView<PhotoViewCustomChildController> {
  const PhotoViewCustomChildView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'PhotoView.customChild'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: GetBuilder<PhotoViewCustomChildController>(
            builder: (controller) => Container(
              decoration: BoxDecoration(border: Border.all(width: 1)),
              width: double.infinity,
              height: double.infinity,
              child: controller.image == null ? const SizedBox.shrink() : PhotoView.customChild(child: controller.image),
              // child: PhotoView.customChild(
              //   child: Center(
              //     child: Container(
              //       width: 1.sw,
              //       height: 1.sh,
              //       alignment: Alignment.center,
              //       color: Colors.yellow.withOpacity(0.5),
              //       child: Text(
              //         "PhotoView.customChild",
              //         style: size14W600(color: Colors.red),
              //       ),
              //     ),
              //   ),
              // ),
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

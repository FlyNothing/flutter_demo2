import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/plugin/imagepicker/image_picker_image_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoViewGalleryBuilderView extends GetView<ImagePickerImageController> {
  const PhotoViewGalleryBuilderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'PhotoViewGallery.builder'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(border: Border.all(width: 1)),
            width: double.infinity,
            height: double.infinity,
            child: Obx(
              () => controller.images.isEmpty
                  ? const SizedBox.shrink()
                  : PhotoViewGallery.builder(
                      itemCount: controller.images.length,
                      builder: (context, index) => PhotoViewGalleryPageOptions(imageProvider: controller.images[index].image),
                    ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: StandardTextButton("相册列表", () => controller.pickMultiImage()),
          ),
        )
      ],
    );
  }
}

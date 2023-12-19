import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/plugin/imagepicker/image_picker_image_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoViewGalleryView extends GetView<ImagePickerImageController> {
  const PhotoViewGalleryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'PhotoViewGallery'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Obx(
            () => Container(
              decoration: BoxDecoration(border: Border.all(width: 1)),
              width: double.infinity,
              height: double.infinity,
              child: controller.images.isEmpty
                  ? const SizedBox.shrink()
                  : PhotoViewGallery(
                      pageOptions: List.generate(controller.images.length, (index) => PhotoViewGalleryPageOptions(imageProvider: controller.images[index].image)),
                      reverse: false,
                      pageController: PageController(
                        initialPage: 0,
                        keepPage: false,
                        viewportFraction: 1,
                      ),
                      onPageChanged: (index) => debugPrint("----------index=$index"),
                      scrollDirection: Axis.horizontal,
                      scrollPhysics: const ClampingScrollPhysics(),
                      allowImplicitScrolling: false,
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

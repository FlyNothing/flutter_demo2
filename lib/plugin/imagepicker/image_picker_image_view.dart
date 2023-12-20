import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/plugin/imagepicker/image_picker_image_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerImageView extends GetView<ImagePickerImageController> {
  const ImagePickerImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gAppBar('选择图片'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 10.h)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  gTextButton("拍照", () => controller.pickImage(ImageSource.camera)),
                  gTextButton("相册", () => controller.pickImage(ImageSource.gallery)),
                  gTextButton("相册列表", () => controller.pickMultiImage()),
                ],
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10.h)),
              Obx(
                () => controller.images.isEmpty
                    ? Container(decoration: BoxDecoration(border: Border.all(width: 1)), width: 0.9.sw, height: 0.4.sh)
                    : GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        children: List.generate(controller.images.length, (index) => _getImageView(controller.images[index])),
                      ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Container _getImageView(Image image) {
    return Container(
      decoration: BoxDecoration(border: Border.all(width: 1)),
      width: 0.4.sw,
      height: 0.4.sh,
      child: image,
    );
  }
}

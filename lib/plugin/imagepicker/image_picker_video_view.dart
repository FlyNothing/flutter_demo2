import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/plugin/imagepicker/image_picker_video_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class ImagePickerVideoView extends GetView<ImagePickerVideoController> {
  const ImagePickerVideoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gAppBar('选择视频'),
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
                  gTextButton("拍照", () => controller.pickVideo(ImageSource.camera)),
                  gTextButton("相册", () => controller.pickVideo(ImageSource.gallery)),
                ],
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10.h)),
              _getVideoView()
            ],
          ),
        )
      ],
    );
  }

  Container _getVideoView() {
    return Container(
      decoration: BoxDecoration(border: Border.all(width: 1)),
      width: 0.8.sw,
      height: 0.4.sh,
      child: GetBuilder<ImagePickerVideoController>(
        builder: (controller) => controller.controller != null
            ? AspectRatio(
                aspectRatio: controller.controller!.value.aspectRatio,
                child: VideoPlayer(controller.controller!),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}

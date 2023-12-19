import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/plugin/video/chewie/chewie_custom_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChewieCustomView extends GetView<ChewieCustomController> {
  const ChewieCustomView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: "自定义Chewie"),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return GetBuilder<ChewieCustomController>(
      builder: (controller) => SizedBox(
        height: 1.sw * 9 / 16,
        width: 1.sw,
        child: controller.controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: controller.controller.value.aspectRatio,
                child: Chewie(
                  controller: controller.chewieController,
                ),
              )
            : Container(
                color: Colors.black.withOpacity(0.8),
              ),
      ),
    );
  }
}

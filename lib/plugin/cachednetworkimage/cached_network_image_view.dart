import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/plugin/cachednetworkimage/cached_network_image_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CachedNetworkImageView extends GetView<CachedNetworkImageController> {
  const CachedNetworkImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'CachedNetworkImage测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Column(
      children: [
        _getUrlTextField(),
        StandardTextButton("刷新图片", () => controller.refreshImageUrl()),
        _getImage(),
      ],
    );
  }

  Center _getImage() {
    return Center(
      child: Obx(
        () => CachedNetworkImage(
          imageUrl: controller.imageUrl.value,
          // imageBuilder: (context, imageProvider) => Container(
          //   decoration: BoxDecoration(
          //     image: DecorationImage(image: imageProvider, fit: BoxFit.cover, colorFilter: const ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
          //   ),
          // ),
          // placeholder: (context, url) => const CircularProgressIndicator(),
          progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }

  Container _getUrlTextField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.w),
      height: 40.h,
      width: 1.sw,
      child: StandardTextField(controller.textController, hintText: "请输入图片下载地址"),
    );
  }
}

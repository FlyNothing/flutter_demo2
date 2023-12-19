import 'package:flutter/material.dart';
import 'package:flutter_demo2/base/widget/image/image_controller.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/common/util/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ImageView extends GetView<ImageController> {
  const ImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'Image测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _getUrlTextField(),
          StandardTextButton("刷新图片", () => controller.refreshImageUrl()),
          _getImage(),
          _getFadeInImage(),
        ],
      ),
    );
  }

  Widget _getImage() {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Stack(
        children: [
          Obx(() => controller.imageUrl.value.isEmpty ? Image.asset("assets/images/avatar.png") : Image.network(controller.imageUrl.value)),
          Text(
            "Image",
            style: size16W400(color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget _getFadeInImage() {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Stack(
        children: [
          Obx(
            () => controller.imageUrl.value.isEmpty
                ? Image.asset("assets/images/avatar.png")
                : FadeInImage(
                    placeholder: const AssetImage("assets/images/avatar.png"),
                    placeholderErrorBuilder: (context, error, stackTrace) {
                      return Text(
                        "Placeholder加载错误",
                        style: size16W400(color: Colors.black),
                      );
                    },
                    image: NetworkImage(controller.imageUrl.value),
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Text(
                        "图片加载错误",
                        style: size16W400(color: Colors.black),
                      );
                    },
                  ),
          ),
          Text(
            "FadeInImage",
            style: size16W400(color: Colors.white),
          )
        ],
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

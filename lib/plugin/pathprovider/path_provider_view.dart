import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/plugin/pathprovider/path_provider_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PathProviderView extends GetView<PathProviderController> {
  const PathProviderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gAppBar('PathProvider测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        gTextButton("获取目录", () => controller.showDirectorys()),
        Padding(padding: EdgeInsets.symmetric(vertical: 10.h), child: Divider(thickness: 2.h)),
        _getUrlTextField(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            gTextButton("HttpGet到本地", () => controller.getHttpFile(controller.controller.text)),
            gTextButton("下载到本地", () => controller.downloadFile(controller.controller.text)),
          ],
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 10.h), child: Divider(thickness: 2.h)),
        gTextButton("读取本地文件", () => controller.loadLocalFile(controller.controller.text)),
        GetBuilder<PathProviderController>(
          builder: (controller) => controller.localFile != null ? Image.file(controller.localFile as File) : const SizedBox.shrink(),
        )
      ],
    );
  }

  Container _getUrlTextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      height: 40.h,
      width: 1.sw,
      child: gTextField(controller.controller, hintText: "请输入图片下载地址"),
    );
  }
}

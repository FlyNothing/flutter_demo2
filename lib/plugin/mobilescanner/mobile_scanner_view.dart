import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/plugin/mobilescanner/mobile_scanner_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class MobileScannerView extends GetView<MobileScannerGetxController> {
  const MobileScannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: '扫描二维码'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(0, 0, 0, 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _getMobileScanner(),
          _getOperateList(),
        ],
      ),
    );
  }

  Container _getMobileScanner() {
    Widget? widget = controller.controller.isStarting
        ? MobileScanner(
            allowDuplicates: true,
            controller: controller.controller,
            onDetect: (barcode, args) {
              if (barcode.rawValue != null) {
                String code = barcode.rawValue!;
                controller.controller.stop();
                EasyLoading.showInfo("扫描到的二维码是：$code", duration: const Duration(seconds: 3));
              }
            },
          )
        : null;
    return Container(
      height: 0.6.sw,
      width: 0.6.sw,
      color: const Color.fromRGBO(255, 255, 255, 0.15),
      child: widget,
    );
  }

  Container _getOperateList() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _getOperateButton(Icons.play_arrow, () => controller.controller.start()),
              _getOperateButton(Icons.stop, () => controller.controller.stop()),
            ],
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10.h)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _getOperateButton(Icons.flashlight_on, () => controller.controller.toggleTorch()),
              _getOperateButton(Platform.isAndroid ? Icons.flip_camera_android : Icons.flip_camera_ios, () => controller.controller.switchCamera()),
              _getOperateButton(Icons.image, () async {
                XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                if (xFile == null) {
                  EasyLoading.showInfo("选择图片失败");
                  return;
                }
                bool hasCode = await controller.controller.analyzeImage(xFile.path);
                if (!hasCode) {
                  EasyLoading.showInfo("图片解析二维码失败");
                  return;
                }
              }),
            ],
          ),
        ],
      ),
    );
  }

  Container _getOperateButton(IconData iconData, Function()? onPressed) {
    return Container(
      height: 60.h,
      width: 60.h,
      margin: EdgeInsets.symmetric(horizontal: 10.h),
      color: const Color.fromRGBO(255, 255, 255, 0.15),
      child: IconButton(
        iconSize: 30.h,
        icon: Icon(
          iconData,
          color: Colors.white,
          size: 30.h,
        ),
        onPressed: onPressed,
      ),
    );
  }
}

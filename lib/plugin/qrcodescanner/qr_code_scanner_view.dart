import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/plugin/qrcodescanner/qr_code_scanner_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeScannerView extends GetView<QRCodeScannerController> {
  QRCodeScannerView({super.key});
  final GlobalKey gkey = GlobalKey(debugLabel: 'ScanCode');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: '扫描二维码', backgroundColor: Colors.transparent),
      body: _getBody(context),
      extendBodyBehindAppBar: true,
    );
  }

  Widget _getBody(BuildContext context) {
    return Stack(
      children: [
        _getQRView(context),
        _getOperateList(),
      ],
    );
  }

  QRView _getQRView(BuildContext context) {
    return QRView(
      key: gkey,
      onQRViewCreated: controller.onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.white,
        borderRadius: 0,
        borderLength: 12.w,
        borderWidth: 5.w,
        cutOutSize: 230.w,
        cutOutBottomOffset: 100.h,
      ),
    );
  }

  Container _getOperateList() {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      padding: EdgeInsets.only(top: 300.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _getOperateButton(Icons.pause, () => controller.qrController?.pauseCamera()),
              _getOperateButton(Icons.play_arrow, () => controller.qrController?.resumeCamera()),
              _getOperateButton(Icons.stop, () => controller.qrController?.stopCamera()),
            ],
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10.w)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _getOperateButton(Icons.flashlight_on, () => controller.qrController?.toggleFlash()),
              _getOperateButton(Platform.isAndroid ? Icons.flip_camera_android : Icons.flip_camera_ios, () => controller.qrController?.flipCamera()),
            ],
          ),
        ],
      ),
    );
  }

  Container _getOperateButton(IconData iconData, Function()? onPressed) {
    return Container(
      height: 60.w,
      width: 60.w,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      color: const Color.fromRGBO(255, 255, 255, 0.15),
      child: IconButton(
        iconSize: 30.w,
        icon: Icon(
          iconData,
          color: Colors.white,
          size: 30.w,
        ),
        onPressed: onPressed,
      ),
    );
  }
}

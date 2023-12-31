// ignore_for_file: use_build_context_synchronously

import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_demo2/common/global/global_theme_config.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/common/util/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RepaintBoundaryView extends StatelessWidget {
  RepaintBoundaryView({super.key});

  final GlobalKey _textKey = GlobalKey();
  final GlobalKey _picKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gAppBar("RepaintBoundary截图"),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Column(
      children: [
        _getRepaintBoundary(_getText(), _textKey),
        _getRepaintBoundary(_getImage(), _picKey),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            gTextButton("截图文本", () => _capture(context, _textKey)),
            gTextButton("截图图片", () => _capture(context, _picKey)),
          ],
        )
      ],
    );
  }

  Container _getText() {
    return Container(
      height: 0.4.sh,
      width: 0.8.sw,
      decoration: BoxDecoration(
        color: gColorGreen,
        border: Border.all(width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "测试文本1",
            style: size14W400(color: gColorBlue),
          ),
          Text(
            "测试文本2",
            style: size14W400(color: gColorOrange),
          ),
          Text(
            "测试文本3",
            style: size14W400(color: gColorRed),
          )
        ],
      ),
    );
  }

  Container _getImage() {
    return Container(
      height: 0.4.sh,
      width: 0.8.sw,
      alignment: Alignment.center,
      child: Image.asset(
        "assets/images/avatar.png", // 目标图片
        fit: BoxFit.cover,
      ),
    );
  }

  RepaintBoundary _getRepaintBoundary(Widget child, GlobalKey key) {
    return RepaintBoundary(key: key, child: child);
  }

  Future<void> _capture(BuildContext context, GlobalKey key) async {
    BuildContext? buildContext = key.currentContext;
    if (buildContext != null && buildContext.findRenderObject() is RenderRepaintBoundary) {
      RenderRepaintBoundary boundary = buildContext.findRenderObject() as RenderRepaintBoundary;
      if (boundary.debugNeedsPaint) {
        // 首次执行boundary.debugNeedsPaint为true 无法进行截图
        await Future.delayed(const Duration(milliseconds: 100));
        _capture(context, key);
      }
      ui.Image image = await boundary.toImage();
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List? imageBytes = byteData?.buffer.asUint8List();
      if (imageBytes != null) {
        Image image = Image.memory(imageBytes);
        Get.dialog(Dialog(child: image));
      }
    }
  }
}

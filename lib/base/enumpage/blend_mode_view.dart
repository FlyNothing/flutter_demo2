import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/global/global_theme_config.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/common/util/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlendModeView extends StatelessWidget {
  const BlendModeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gAppBar('BlendMode模式'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(
        BlendMode.values.length,
        (index) => getImage(colorBlendMode: BlendMode.values[index]),
      ),
    );
  }

  Container getImage({BlendMode? colorBlendMode}) {
    return Container(
      margin: EdgeInsets.all(5.w),
      child: Stack(
        children: [
          Image.asset(
            "assets/images/avatar.png", // 目标图片
            opacity: const AlwaysStoppedAnimation(0.7),
            color: gColorRed, // 源图片
            fit: BoxFit.cover,
            colorBlendMode: colorBlendMode,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Text(colorBlendMode.toString(), style: size12W400()),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/global_widget.dart';
import 'package:flutter_demo2/common/util/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlendModeView extends StatelessWidget {
  const BlendModeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'BlendMode模式'),
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
            color: Colors.red.withOpacity(0.7), // 源图片
            fit: BoxFit.cover,
            colorBlendMode: colorBlendMode,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Text(colorBlendMode.toString(), style: size12W400(color: Colors.black)),
          )
        ],
      ),
    );
  }
}

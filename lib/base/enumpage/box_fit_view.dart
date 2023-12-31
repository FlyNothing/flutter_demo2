import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/global/global_theme_config.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/common/util/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoxFitView extends StatelessWidget {
  const BoxFitView({super.key});
  static const Color _color = gColorBlack54;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gAppBar('BoxFit模式'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    List<Widget> images = genImageList();
    return GridView.count(crossAxisCount: 1, children: images);
  }

  List<Widget> genImageList() {
    List<Widget> res = [];
    for (var boxFit in BoxFit.values) {
      res.add(getImage("assets/images/image1.jpg", fit: boxFit));
      res.add(getImage("assets/images/image1_vertical.jpg", fit: boxFit));
      res.add(getImage("assets/images/image2.jpg", fit: boxFit));
      res.add(getImage("assets/images/image2_vertical.jpg", fit: boxFit));
      res.add(const Divider(color: _color, thickness: 1));
    }
    return res;
  }

  Container getImage(String image, {BoxFit? fit}) {
    return Container(
      margin: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: _color),
        image: DecorationImage(image: AssetImage(image), fit: fit),
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Text(fit == null ? "Origin" : fit.toString(), style: size16W600(color: _color)),
      ),
    );
  }
}

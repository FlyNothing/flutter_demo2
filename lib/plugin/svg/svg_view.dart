// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/global/global_theme_config.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class FlutterSvgView extends StatelessWidget {
  const FlutterSvgView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gAppBar('SVG'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        SvgPicture.asset(
          "assets/images/ubuntu.svg",
          semanticsLabel: "ubuntu.svg",
        ),
        SvgPicture.asset(
          "assets/images/ubuntu.svg",
          colorFilter: const ColorFilter.mode(gColorLightPrimary, BlendMode.darken),
        ),
        const SvgPicture(
          AssetBytesLoader("assets/images/ubuntu.svg.vec"),
        ),
        SvgPicture.asset(
          "assets/images/debian.svg",
          semanticsLabel: "debian.svg",
        ),
        SvgPicture.asset(
          "assets/images/debian.svg",
          colorFilter: const ColorFilter.mode(gColorLightPrimary, BlendMode.darken),
        ),
        SvgPicture.network(
          "https://dev.w3.org/SVG/tools/svgweb/samples/svg-files/USStates.svg",
          placeholderBuilder: (context) => Center(
            child: SizedBox(
              width: 0.2.sw,
              height: 0.2.sw,
              child: const CircularProgressIndicator(),
            ),
          ),
        ),
      ],
    );
  }
}

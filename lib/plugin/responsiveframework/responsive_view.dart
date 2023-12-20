import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/global/global_theme_config.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';

class ResponsiveView extends StatelessWidget {
  const ResponsiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gAppBar('ResponsivePage'),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(width: 200, height: 50, color: gColorRed),
        Container(width: 400, height: 50, color: gColorOrange),
        Container(width: 600, height: 50, color: gColorYellow),
        Container(width: 800, height: 50, color: gColorGreen),
        Container(width: 1000, height: 50, color: gColorBlue),
        Container(width: 1200, height: 50, color: gColorLightPrimary),
        Container(width: 1400, height: 50, color: gColorPurple),
        Container(width: 1600, height: 50, color: gColorGrey),
      ],
    );
  }
}

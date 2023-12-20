import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/global/global_theme_config.dart';
import 'package:flutter_demo2/common/util/text_style.dart';

List<Widget> widgets = [
  _genWidget("1", gColorRed),
  _genWidget("2", gColorOrange),
  _genWidget("3", gColorYellow),
  _genWidget("4", gColorGreen),
  _genWidget("5", gColorBlue),
  _genWidget("6", gColorLightPrimary),
  _genWidget("7", gColorPurple),
  _genWidget("8", gColorBlack),
];

Widget _genWidget(String text, Color color) {
  return Container(
    alignment: Alignment.center,
    height: double.infinity,
    width: double.infinity,
    color: color,
    child: Text(text, style: size36W600()),
  );
}

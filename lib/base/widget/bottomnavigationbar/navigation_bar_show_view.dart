import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/global/global_theme_config.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/common/util/text_style.dart';

class NavigationBarShowView extends StatelessWidget {
  const NavigationBarShowView(this._text, {super.key});
  final String _text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gAppBar("NavigationBar测试"),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return Center(
      child: Text(
        _text,
        style: size18W400(color: gColorGreen),
      ),
    );
  }
}

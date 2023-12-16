import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/global_widget.dart';
import 'package:flutter_demo2/common/util/text_style.dart';

class NavigationBarShowView extends StatelessWidget {
  const NavigationBarShowView(this._text, {super.key});
  final String _text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: "NavigationBar测试"),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return Center(
      child: Text(
        _text,
        style: size18W400(color: Colors.green),
      ),
    );
  }
}

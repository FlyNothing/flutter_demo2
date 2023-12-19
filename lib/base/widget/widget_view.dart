import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/common/util/text_style.dart';

/// 测试State中获取Widget属性
class WidgetView extends StatelessWidget {
  final String finalName = "widget-demo";
  const WidgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'Widget测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.indigo)),
        child: Text("This is a test widget page. widget final name : $finalName", textAlign: TextAlign.center, style: size16W500()),
      ),
    );
  }
}

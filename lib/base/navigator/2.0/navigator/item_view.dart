import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/common/util/text_style.dart';

class ItemView extends StatelessWidget {
  static const String valueKey = "/item";
  final String _item;
  const ItemView(this._item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: '路由跳转'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.red)),
      child: Text("你选择的选项是：$_item", textAlign: TextAlign.center, style: size16W500(color: Colors.red)),
    );
  }
}

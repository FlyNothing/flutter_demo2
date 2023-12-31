import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';

List<String> fruits = ["西瓜", "草莓", "苹果", "香蕉", "梨子", "桃子"];

class ListViewView extends StatelessWidget {
  static const String valueKey = "/list";
  final Function(String item) _itemTapped;
  const ListViewView(this._itemTapped, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gAppBar('路由跳转'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return ListView(
      children: List.generate(
        fruits.length,
        (index) => ListTile(
          leading: Text(index.toString()),
          title: Text(fruits[index]),
          onTap: () => _itemTapped(fruits[index]),
        ),
      ),
    );
  }
}

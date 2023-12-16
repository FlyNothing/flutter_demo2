import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/global_widget.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/common/vo/base_menu_vo.dart';
import 'package:get/get.dart';

class BaseMenuView extends StatelessWidget {
  final String _title;
  final List<BaseMenuVO> _baseMenuList;
  const BaseMenuView(this._title, this._baseMenuList, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: _title),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Text(_baseMenuList[index].name),
        trailing: StandardIconButton(
          Icons.navigate_next,
          () => Get.to(_baseMenuList[index].page),
        ),
      ),
      itemCount: _baseMenuList.length,
    );
  }
}

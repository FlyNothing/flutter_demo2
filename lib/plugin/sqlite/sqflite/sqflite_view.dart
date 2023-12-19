import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/common/util/text_style.dart';
import 'package:flutter_demo2/plugin/sqlite/sqflite/sqflite_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SqfliteView extends GetView<SqfliteController> {
  const SqfliteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'Sqflite测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.symmetric(vertical: 5.h), child: _getUserList()),
        _addUserButton(),
      ],
    );
  }

  Widget _getUserList() {
    List<TableRow> rows = List.generate(
      controller.userList.length,
      (index) => TableRow(
        children: [
          _getTableText(controller.userList[index].id.toString()),
          _getTableText(controller.userList[index].name),
          _getTableText(controller.userList[index].age.toString()),
          _getTableText(controller.userList[index].addr ?? ""),
          GestureDetector(
            child: Center(child: Text("删除", style: size14W500(color: Colors.blue))),
            onTap: () => controller.delete(index),
          )
        ],
      ),
    );
    rows.insert(0, TableRow(children: [_getTableText("主键"), _getTableText("姓名"), _getTableText("年纪"), _getTableText("地址"), _getTableText("操作")]));
    return Obx(
      () => Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: {
          0: FixedColumnWidth(0.1.sw),
          1: FixedColumnWidth(0.2.sw),
          2: FixedColumnWidth(0.2.sw),
          3: FixedColumnWidth(0.3.sw),
          4: FixedColumnWidth(0.2.sw),
        },
        border: TableBorder.all(width: 1.h, color: Colors.grey),
        children: rows,
      ),
    );
  }

  Center _getTableText(String text) {
    return Center(child: Text(text));
  }

  Widget _addUserButton() {
    return StandardTextButton("新增", () {
      Future<String?> res = Get.dialog(
        AlertDialog(
          backgroundColor: Colors.white,
          content: SizedBox(
            height: 0.25.sh,
            child: Column(
              children: [
                StandardTextField(controller.nameController, hintText: "请输入姓名"),
                Padding(padding: EdgeInsets.only(top: 0.02.sh)),
                StandardTextField(controller.ageController, hintText: "请输入年龄"),
                Padding(padding: EdgeInsets.only(top: 0.02.sh)),
                StandardTextField(controller.addrController, hintText: "请输入地址")
              ],
            ),
          ),
          actions: [
            StandardTextButton("取消", () => Get.back()),
            StandardTextButton("确认", () => Get.back(result: controller.nameController.text)),
          ],
          actionsAlignment: MainAxisAlignment.center,
        ),
      );
      res.then((value) => controller.insert());
    });
  }
}

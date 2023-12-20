import 'package:flutter/material.dart';
import 'package:flutter_demo2/base/widget/valuenotifier/value_notifier_controller.dart';
import 'package:flutter_demo2/common/global/global_theme_config.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:get/get.dart';

class ValueNotifierView extends GetView<ValueNotifierController> {
  const ValueNotifierView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gAppBar('ValueNotifier测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Text("姓名"),
          title: ValueListenableBuilder(valueListenable: controller.nameNotifier, builder: (context, String value, child) => Text(value)),
          trailing: _getNameButton(context),
        ),
        ListTile(
          leading: const Text("年龄"),
          title: Obx(() => Text("${controller.age}")),
          trailing: _getAgeButton(context),
        )
      ],
    );
  }

  IconButton _getNameButton(BuildContext context) {
    return gIconButton(
      Icons.navigate_next,
      () {
        Future<String?> res = Get.dialog(AlertDialog(
          backgroundColor: gColorGrey400,
          content: gTextField(controller.nameController, hintText: "请输入姓名"),
          actions: [
            gTextButton("取消", () => Get.back()),
            gTextButton("确认", () => Get.back(result: controller.nameController.text)),
          ],
          actionsAlignment: MainAxisAlignment.center,
        ));
        res.then((value) => controller.nameNotifier.value = value ?? "");
      },
    );
  }

  IconButton _getAgeButton(BuildContext context) {
    return gIconButton(
      Icons.navigate_next,
      () {
        Future<int?> res = Get.dialog(
          AlertDialog(
            backgroundColor: gColorGrey400,
            content: gTextField(controller.ageController, hintText: "年龄"),
            actions: [
              gTextButton("取消", () => Get.back()),
              gTextButton("确认", () => Get.back(result: int.parse(controller.ageController.text))),
            ],
            actionsAlignment: MainAxisAlignment.center,
          ),
        );
        res.then((value) => controller.ageNotifier.value = value ?? 0);
      },
    );
  }
}

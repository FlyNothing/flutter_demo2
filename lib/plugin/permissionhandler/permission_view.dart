import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/text_style.dart';
import 'package:flutter_demo2/plugin/permissionhandler/permission_controller.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionWidget extends GetView<PermissionController> {
  const PermissionWidget(this._permission, {super.key});

  final Permission _permission;

  Color getPermissionColor() {
    String value = controller.map[_permission.value] ?? "";
    if (value == PermissionStatus.denied.name) {
      return Colors.red;
    } else if (value == PermissionStatus.granted.name) {
      return Colors.green;
    } else if (value == PermissionStatus.limited.name) {
      return Colors.orange;
    } else {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_permission.toString(), style: size16W400()),
      subtitle: Obx(
        () => Text(
          controller.map[_permission.value] ?? "",
          style: size16W400(color: getPermissionColor()),
        ),
      ),
      trailing: (_permission is PermissionWithService)
          ? IconButton(
              icon: const Icon(Icons.info, color: Colors.orange),
              onPressed: () => checkServiceStatus(context, _permission as PermissionWithService),
            )
          : null,
      onTap: () => controller.requestPermission(_permission),
    );
  }

  void checkServiceStatus(BuildContext context, PermissionWithService permission) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text((await permission.serviceStatus).toString()),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_demo2/plugin/permissionhandler/permission_controller.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionWidget extends GetView<PermissionController> {
  const PermissionWidget(this._permission, {super.key});

  final Permission _permission;

  Color getPermissionColor() {
    switch (controller.permissionStatus.value) {
      case PermissionStatus.denied:
        return Colors.red;
      case PermissionStatus.granted:
        return Colors.green;
      case PermissionStatus.limited:
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        _permission.toString(),
        style: Theme.of(context).textTheme.bodyText1,
      ),
      subtitle: Obx(() => Text(
            controller.permissionStatus.toString(),
            style: TextStyle(color: getPermissionColor()),
          )),
      trailing: (_permission is PermissionWithService)
          ? IconButton(
              icon: const Icon(
                Icons.info,
                color: Colors.white,
              ),
              onPressed: () {
                checkServiceStatus(context, _permission as PermissionWithService);
              })
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

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionController extends GetxController {
  var permissionStatus = PermissionStatus.denied.obs;

  Future<void> requestPermission(Permission permission) async {
    permissionStatus.value = await permission.request();
  }
}

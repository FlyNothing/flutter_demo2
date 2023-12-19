import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionController extends GetxController {
  var map = {}.obs;

  Future<void> requestPermission(Permission permission) async {
    PermissionStatus status = await permission.request();
    map[permission.value] = status.name;
  }
}

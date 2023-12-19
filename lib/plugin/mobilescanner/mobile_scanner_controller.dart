import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class MobileScannerGetxController extends GetxController {
  late MobileScannerController controller;

  @override
  void onInit() {
    super.onInit();
    controller = MobileScannerController();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeScannerController extends GetxController {
  QRViewController? qrController;
  Barcode? barcode;

  @override
  void onClose() {
    qrController?.dispose();
    super.onClose();
  }

  void onQRViewCreated(QRViewController controller) {
    qrController = controller;
    qrController?.resumeCamera();
    update();
    controller.scannedDataStream.listen((scanData) {
      barcode = scanData;
      String? code = barcode?.code;
      if (code == null) {
        return;
      }
      qrController?.pauseCamera();
      EasyLoading.showInfo("扫描到的二维码是：$code", duration: const Duration(seconds: 3));
      update();
    });
  }
}

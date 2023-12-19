import 'dart:async';

import 'package:flutter_demo2/plugin/easyloading/page/test_view.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class EasyLoadingController extends GetxController {
  late Timer _timer;
  late double _progress;

  @override
  void onInit() {
    super.onInit();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (Timer timer) => showProgress());
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }

  showProgress() {
    EasyLoading.showProgress(_progress, status: '${(_progress * 100).toStringAsFixed(0)}%');
    _progress += 0.03;
    if (_progress >= 1) {
      _timer.cancel();
      EasyLoading.dismiss();
    }
  }

  push() {
    _timer.cancel();
    Get.to(const TestView());
  }

  dismiss() {
    _timer.cancel();
    EasyLoading.dismiss();
  }

  show() {
    _timer.cancel();
    EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black);
  }

  showInfo() {
    _timer.cancel();
    EasyLoading.showInfo('loading...', maskType: EasyLoadingMaskType.black);
  }

  showToast() {
    _timer.cancel();
    EasyLoading.showToast('Toast.', maskType: EasyLoadingMaskType.black);
  }

  showSuccess() {
    _timer.cancel();
    EasyLoading.showSuccess('Great Success!');
  }

  showError() {
    _timer.cancel();
    EasyLoading.showError('Failed with Error');
  }

  cancel() {
    _timer.cancel();
  }
}

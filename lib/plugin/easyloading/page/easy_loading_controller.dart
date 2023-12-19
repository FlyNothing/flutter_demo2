import 'dart:async';

import 'package:flutter_demo2/plugin/easyloading/page/test_view.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class EasyLoadingController extends GetxController {
  Timer? _timer;

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  showProgress() {
    double progress = 0;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
      EasyLoading.showProgress(progress, status: '${(progress * 100).toStringAsFixed(0)}%');
      progress += 0.03;
      if (progress >= 1) {
        _timer?.cancel();
        EasyLoading.dismiss();
      }
    });
  }

  push() {
    _timer?.cancel();
    Get.to(const TestView());
  }

  dismiss() {
    _timer?.cancel();
    EasyLoading.dismiss();
  }

  show() {
    _timer?.cancel();
    EasyLoading.show(status: 'loading...');
  }

  showInfo() {
    _timer?.cancel();
    EasyLoading.showInfo('loading...');
  }

  showToast() {
    _timer?.cancel();
    EasyLoading.showToast('Toast.');
  }

  showSuccess() {
    _timer?.cancel();
    EasyLoading.showSuccess('Great Success!');
  }

  showError() {
    _timer?.cancel();
    EasyLoading.showError('Failed with Error');
  }
}

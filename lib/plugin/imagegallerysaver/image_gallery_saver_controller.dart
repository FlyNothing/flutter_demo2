import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/dio_api.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';

import 'package:uuid/uuid.dart';

class ImageGallerySaverController extends GetxController {
  late TextEditingController controller;
  final ImagePicker _imagePicker = ImagePicker();
  final Uuid _uuid = const Uuid();

  @override
  void onInit() {
    super.onInit();
    controller = TextEditingController();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  /// 保存到相册
  Future<void> saveToGallery() async {
    // 下载文件
    String url = controller.text;
    dio.Response resp = await getHttpFile(url);
    List<int> dataList = resp.data as List<int>;
    Map res = await ImageGallerySaver.saveImage(Uint8List.fromList(dataList), name: _getFileName(url));
    if (res["isSuccess"]) {
      EasyLoading.showInfo("保存成功");
    } else {
      EasyLoading.showError("保存失败");
    }
  }

  void pickImage() {
    _imagePicker.pickImage(source: ImageSource.gallery);
  }

  String _getFileName(String url) {
    return _uuid.v5(Uuid.NAMESPACE_URL, url);
  }
}

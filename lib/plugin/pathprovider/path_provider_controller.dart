import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/dio_api.dart' as api;
import 'package:flutter_demo2/common/util/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import 'package:get/get.dart';

class PathProviderController extends GetxController {
  late TextEditingController controller;
  late Uuid _uuid;
  File? localFile;

  @override
  void onInit() {
    super.onInit();
    _uuid = const Uuid();
    controller = TextEditingController();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  Future<void> showDirectorys() async {
    Map<String, String> dirMap = await getDirectorys();
    showModalBottomSheet(
      context: Get.context!,
      builder: (context) {
        return Container(
          height: 400.h,
          color: Colors.white,
          child: Column(
            children: dirMap.entries
                .map(
                  (e) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: e.key, style: size16W600()),
                          TextSpan(text: e.value, style: size14W400()),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }

  Future<Map<String, String>> getDirectorys() async {
    Map<String, String> dirMap = {};
    Directory tempDir = await getTemporaryDirectory();
    dirMap["  Temporary:  "] = tempDir.path;

    Directory appSupDir = await getApplicationSupportDirectory();
    dirMap["  ApplicationSupport:  "] = appSupDir.path;

    Directory appDocDir = await getApplicationDocumentsDirectory();
    dirMap["  ApplicationDocuments:  "] = appDocDir.path;

    Directory? extStoDir = await getExternalStorageDirectory();
    dirMap["  ExternalStorage:  "] = extStoDir?.path ?? "";

    List<Directory>? extCacheDirs = await getExternalCacheDirectories();
    dirMap["  ExternalCaches:  "] = _dirsToStrings(extCacheDirs);

    List<Directory>? extStoDirs = await getExternalStorageDirectories();
    dirMap["  ExternalStorages:  "] = _dirsToStrings(extStoDirs);
    return dirMap;
  }

  String _dirsToStrings(List<Directory>? extCacheDirs) {
    if (extCacheDirs == null) {
      return "";
    }
    return extCacheDirs.map((dir) => dir.path).toList().join(",");
  }

  /// Http Get存储到本地
  Future<void> getHttpFile(String url) async {
    // 下载文件
    dio.Response resp = await api.getHttpFile(url);
    List<int> dataList = resp.data as List<int>;

    // 存储到本地文件
    Directory dir = await getApplicationDocumentsDirectory();
    String path = "${dir.path}/${_getFileName(url)}";
    File newFile = File(path);
    await newFile.writeAsBytes(dataList);
  }

  /// 下载到本地
  Future<void> downloadFile(String url) async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = "${dir.path}/${_getFileName(url)}";
    await api.download(url, path);
  }

  Future<void> loadLocalFile(String url) async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = "${dir.path}/${_getFileName(url)}";
    localFile = File(path);
    update();
  }

  String _getFileName(String url) {
    return _uuid.v5(Uuid.NAMESPACE_URL, url);
  }
}

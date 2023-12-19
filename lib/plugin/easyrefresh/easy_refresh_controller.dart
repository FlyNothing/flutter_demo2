import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter_demo2/plugin/easyrefresh/easy_refresh_data.dart';
import 'package:get/get.dart';

class EasyRefreshGetxController extends GetxController {
  var data = List.empty(growable: true).obs;
  late EasyRefreshController controller;
  late int _page;
  final int _size = 10;

  @override
  void onInit() {
    super.onInit();
    controller = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );
    refreshData();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  refreshData() {
    _page = 1;
    List<Map<String, String>> respData = getPageData(_page, _size);
    _page = _page + 1;
    data.value = respData;
    controller.finishRefresh();
  }

  loadData() {
    List<Map<String, String>> respData = getPageData(_page, _size);
    _page = _page + 1;
    data.addAll(respData);
    controller.finishLoad(respData.length < _size ? IndicatorResult.noMore : IndicatorResult.success);
  }
}

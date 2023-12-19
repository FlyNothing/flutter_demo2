import 'package:flutter_demo2/plugin/pulltorefresh/entity/student.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PullToRefreshController extends GetxController {
  late RefreshController refreshController;
  int page = 1, pageSize = 10;
  var studentList = List.empty(growable: true).obs;

  @override
  void onInit() {
    super.onInit();
    refreshController = RefreshController(initialRefresh: false);
    _refreshStudent();
  }

  @override
  void onClose() {
    refreshController.dispose();
    super.onClose();
  }

  void onRefresh() {
    Future.delayed(const Duration(milliseconds: 100), () {
      _refreshStudent();
      refreshController.refreshCompleted(resetFooterState: true);
    });
  }

  void onLoading() async {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_loadStudent()) {
        refreshController.loadComplete();
      } else {
        refreshController.loadNoData();
      }
    });
  }

  _refreshStudent() {
    page = 1;
    studentList.clear();
    studentList.addAll(getStudent(page, pageSize));
    page += 1;
  }

  bool _loadStudent() {
    List<Student> res = getStudent(page, pageSize);
    studentList.addAll(res);
    page += 1;
    return res.isNotEmpty;
  }
}

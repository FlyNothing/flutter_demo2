import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/plugin/pulltorefresh/pull_to_refresh_controller.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PullToRefreshView extends GetView<PullToRefreshController> {
  const PullToRefreshView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'PullToRefresh'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return SmartRefresher(
      controller: controller.refreshController,
      header: const ClassicHeader(),
      footer: CustomFooter(
        builder: (context, status) {
          if (status == LoadStatus.idle) {
            return const Center(child: Text("初始化加载"));
          } else if (status == LoadStatus.canLoading) {
            return const Center(child: Text("允许加载"));
          } else if (status == LoadStatus.loading) {
            return const Center(child: Text("正在加载中"));
          } else if (status == LoadStatus.failed) {
            return const Center(child: Text("加载失败"));
          } else if (status == LoadStatus.noMore) {
            return const Center(child: Text("没有更多"));
          } else {
            return const Center(child: Text("加载错误"));
          }
        },
      ),
      enablePullDown: true,
      onRefresh: controller.onRefresh,
      enablePullUp: true,
      onLoading: controller.onLoading,
      enableTwoLevel: true,
      onTwoLevel: (isOpen) async {
        if (isOpen) {
          Get.to(Scaffold(
            appBar: appBarStandard(title: "二楼"),
            body: Center(child: Image.asset("assets/images/avatar.png")),
          ));
          controller.refreshController.twoLevelComplete();
        }
      },
      child: Obx(
        () => ListView.builder(
          itemCount: controller.studentList.length,
          itemBuilder: (context, index) => ListTile(
            leading: Text(
              controller.studentList[index].no.toString(),
            ),
            title: Text(
              controller.studentList[index].subject,
            ),
            trailing: Text(
              controller.studentList[index].score.toString(),
            ),
          ),
        ),
      ),
    );
  }
}

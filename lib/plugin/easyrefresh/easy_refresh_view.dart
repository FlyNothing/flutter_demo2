import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/easy_refresh.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/plugin/easyrefresh/easy_refresh_controller.dart';
import 'package:get/get.dart';

class FlutterEasyRefreshView extends GetView<EasyRefreshGetxController> {
  const FlutterEasyRefreshView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gAppBar('EasyRefresh测试'),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return getEasyRefresh(
      controller: controller.controller,
      onLoad: controller.loadData,
      onRefresh: controller.refreshData,
      child: Obx(
        () => ListView.builder(
          itemCount: controller.data.length,
          itemBuilder: ((context, index) => ListTile(
                // contentPadding: const EdgeInsets.all(20),
                leading: Text(controller.data[index]["leading"] as String),
                title: Text(controller.data[index]["title"] as String),
                trailing: Text(controller.data[index]["trailing"] as String),
              )),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_demo2/base/futuretimer/future_controller.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:get/get.dart';

class FutureView extends GetView<FutureController> {
  const FutureView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gAppBar('Future测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Center(
      child: FutureBuilder<String>(
        builder: (context, AsyncSnapshot<String> snapshot) {
          return Text(snapshot.data ?? "get data failed");
        },
        initialData: "init data",
        future: controller.getRaw('https://www.baidu.com'),
      ),
    );
  }
}

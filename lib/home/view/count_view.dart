import 'package:flutter/material.dart';
import 'package:flutter_demo2/home/controller/count_controller.dart';
import 'package:get/get.dart';

class CountView extends GetView<CountController> {
  const CountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("计算")),
        body: Row(
          children: [
            Row(
              children: [
                IconButton(onPressed: () => controller.increment(), icon: const Icon(Icons.add)),
                IconButton(onPressed: () => controller.decrement(), icon: const Icon(Icons.remove)),
              ],
            ),
            const Text("当前值为："),
            Obx(() => Text("${controller.cnt.value}")),
          ],
        ));
  }
}

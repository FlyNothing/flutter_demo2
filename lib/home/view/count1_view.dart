import 'package:flutter/material.dart';
import 'package:flutter_demo2/home/controller/count_controller.dart';
import 'package:get/get.dart';

class Count1View extends GetView<Count1Controller> {
  const Count1View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("计算")),
      body: GetBuilder<Count1Controller>(
        builder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(onPressed: () => controller.increment(), icon: const Icon(Icons.add)),
                IconButton(onPressed: () => controller.decrement(), icon: const Icon(Icons.remove)),
              ],
            ),
            Row(
              children: [
                const Text("当前值为："),
                Text("${controller.cnt}"),
              ],
            ),
            const Text("操作历史："),
            Column(
              children: List.generate(
                controller.his.length,
                (index) => Text(controller.his[index]),
              ),
            )
          ],
        ),
      ),
    );
  }
}

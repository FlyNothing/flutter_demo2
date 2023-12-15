import 'package:flutter/material.dart';
import 'package:flutter_demo2/binding.dart';
import 'package:flutter_demo2/home/view/count_view.dart';
import 'package:get/get.dart';

import 'home/controller/count_controller.dart';
import 'home/view/count1_view.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    // 初始化默认的全局Binding
    initialBinding: GlobalBinding(),
    // initialRoute: Routes.SPLASH,
    theme: ThemeData(
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
    ),
    defaultTransition: Transition.fade,
    // initialBinding: SplashBinding(),
    // getPages: AppPages.pages,
    home: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () => Get.to(
            const CountView(),
            // 自定义binding
            binding: BindingsBuilder(() => Get.put<CountController>(CountController())),
          ),
          child: const Text("CountView"),
        ),
        TextButton(
          onPressed: () => Get.to(
            const Count1View(),
            // 自定义binding
            binding: BindingsBuilder(() => Get.put<Count1Controller>(Count1Controller())),
          ),
          child: const Text("Count1View"),
        ),
      ],
    ),
  ));
}

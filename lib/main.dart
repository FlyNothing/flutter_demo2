import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/global/global_binding.dart';
import 'package:flutter_demo2/home/home_view.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    // 初始化默认的全局Binding
    initialBinding: GlobalBinding(),
    // initialRoute: Routes.SPLASH,
    theme: ThemeData(
      primarySwatch: Colors.indigo,
      brightness: Brightness.light,
    ),
    defaultTransition: Transition.fade,
    // initialBinding: SplashBinding(),
    // getPages: AppPages.pages,
    home: const HomeView(),
  ));
}

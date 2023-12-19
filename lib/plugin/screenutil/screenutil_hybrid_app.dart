import 'package:flutter/material.dart';
import 'package:flutter_demo2/plugin/screenutil/screenutil_init_home_view.dart';

/// 混合开发 - 部分主题
class ScreenutilHybridPartThemeApp extends StatelessWidget {
  const ScreenutilHybridPartThemeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const ScreenutilInitHomeView(),
    );
  }
}

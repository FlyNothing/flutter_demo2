import 'package:flutter/material.dart';
import 'package:flutter_demo2/plugin/screenutil/screenutil_home_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 混合开发 - 设置全局主题
class ScreenutilHybridGlobalThemeApp extends StatelessWidget {
  const ScreenutilHybridGlobalThemeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        ScreenUtil.init(context, designSize: const Size(200, 600));
        return Theme(
          data: ThemeData(
            primarySwatch: Colors.yellow,
          ),
          child: const ScreenutilHomeView(),
        );
      },
    );
  }
}

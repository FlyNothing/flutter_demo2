import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/global/global_theme_config.dart';
import 'package:flutter_demo2/plugin/responsiveframework/responsive_view.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ResponsiveFrameworkApp extends StatelessWidget {
  const ResponsiveFrameworkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, child!),
        maxWidth: 1200,
        minWidth: 600,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(450, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
        background: Container(color: gColorWhite),
      ),
      home: const ResponsiveView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

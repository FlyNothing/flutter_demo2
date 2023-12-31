import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/global/global_theme_config.dart';
import 'package:flutter_demo2/common/page/base_menu_view.dart';
import 'package:flutter_demo2/plugin/pulltorefresh/pull_to_refresh_menu_config.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PullToRefreshApp extends StatelessWidget {
  const PullToRefreshApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      headerBuilder: () => const WaterDropHeader(),
      footerBuilder: () => const ClassicFooter(),
      headerTriggerDistance: 80.0,
      springDescription: const SpringDescription(stiffness: 170, damping: 16, mass: 1.9),
      maxOverScrollExtent: 100,
      maxUnderScrollExtent: 0,
      enableScrollWhenRefreshCompleted: true,
      enableLoadingWhenFailed: true,
      enableLoadMoreVibrate: false,
      enableRefreshVibrate: true,
      skipCanRefresh: false,
      enableScrollWhenTwoLevel: true,
      shouldFooterFollowWhenNotFull: (status) {
        return false;
      },
      hideFooterWhenNotFull: false,
      enableBallisticLoad: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: gColorLightPrimary,
        ),
        home: BaseMenuView("PullToRefresh", pullToRefreshMenuList),
      ),
    );
    // return MaterialApp(
    //   localizationsDelegates: const [RefreshLocalizations.delegate],
    //   supportedLocales: const [Locale('en'), Locale('zh')],
    //   localeResolutionCallback: (locale, supportedLocales) => locale,
    //   home: const Scaffold(
    //     body: BasePullToRefreshMenuPage(),
    //   ),
    // );
  }
}

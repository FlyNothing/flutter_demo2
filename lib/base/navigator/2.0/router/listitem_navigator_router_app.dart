import 'package:flutter/material.dart';
import 'package:flutter_demo2/base/navigator/2.0/router/listview_view.dart';
import 'package:flutter_demo2/base/navigator/2.0/router/listitem_route_information_parser.dart';
import 'package:flutter_demo2/base/navigator/2.0/router/listitem_router_delegate.dart';

class ListitemNavigatorRouterApp extends StatelessWidget {
  const ListitemNavigatorRouterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 去掉右上角debug贴纸
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Router(
        routerDelegate: ListitemRouterDelegate(),
        routeInformationParser: ListitemRouteInformationParser(),

        ///parser不为空时，需要设置provider
        routeInformationProvider: PlatformRouteInformationProvider(
          initialRouteInformation: const RouteInformation(location: ListViewView.valueKey),
        ),
      ),
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:flutter_demo2/plugin/gorouter/go_origin_view.dart';
import 'package:flutter_demo2/plugin/gorouter/go_router2_view.dart';
import 'package:flutter_demo2/plugin/gorouter/go_router_view.dart';
import 'package:go_router/go_router.dart';

final GoRouter goRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const GoOriginView();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'router1',
          builder: (BuildContext context, GoRouterState state) {
            return const GoRouterView();
          },
        ),
        GoRoute(
          path: 'router2',
          builder: (BuildContext context, GoRouterState state) {
            return const GoRouter2View();
          },
        ),
      ],
    ),
  ],
);

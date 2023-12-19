import 'package:flutter/widgets.dart';
import 'package:flutter_demo2/plugin/gorouter/go_origin_view.dart';
import 'package:flutter_demo2/plugin/gorouter/go_router2_view.dart';
import 'package:flutter_demo2/plugin/gorouter/go_router_view.dart';
import 'package:go_router/go_router.dart';

part 'go_router_page_gen.g.dart';

@TypedGoRoute<GoOriginPageRoute>(path: '/', routes: [
  TypedGoRoute<GoRouterPageRoute>(
    path: 'router1',
  ),
  TypedGoRoute<GoRouter2PageRoute>(
    path: 'router2',
  )
])
@immutable
class GoOriginPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const GoOriginView();
  }
}

@immutable
class GoRouterPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const GoRouterView();
  }
}

@immutable
class GoRouter2PageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const GoRouter2View();
  }
}

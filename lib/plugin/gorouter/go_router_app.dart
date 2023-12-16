import 'package:flutter/material.dart';
import 'package:flutter_demo2/plugin/gorouter/go_router_table.dart';

class GoRouterApp extends StatelessWidget {
  const GoRouterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      routerConfig: goRouter,
    );
  }
}

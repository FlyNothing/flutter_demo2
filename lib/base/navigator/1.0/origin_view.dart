import 'package:flutter/material.dart';
import 'package:flutter_demo2/base/navigator/1.0/router_view.dart';
import 'package:flutter_demo2/common/global/global_theme_config.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/common/util/text_style.dart';

/// OriginPage结合RouterView一起，实现参数通过Route的Settings传递
class OriginView extends StatelessWidget {
  static const String routeName = "/router";
  const OriginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gAppBar('路由跳转'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(border: Border.all(width: 1, color: gColorRed)),
          child: Text("This is a home page.", textAlign: TextAlign.center, style: size16W500(color: gColorRed)),
        ),
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          settings: const RouteSettings(name: RouterView.routeName, arguments: {"page-title": "router"}),
          builder: (context) => const RouterView(),
        ),
        // Navigator.pushNamed(context, RouterView.routeName, arguments: {"page-title": "router"}),
      ),
    );
  }
}

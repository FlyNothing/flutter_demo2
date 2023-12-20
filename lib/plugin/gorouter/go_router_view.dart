import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/global/global_theme_config.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/common/util/text_style.dart';
import 'package:go_router/go_router.dart';

class GoRouterView extends StatelessWidget {
  const GoRouterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gAppBar('路由跳转1'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(border: Border.all(width: 1, color: gColorPurple)),
          child: Text("Router1.", textAlign: TextAlign.center, style: size16W500(color: gColorPurple)),
        ),
      ),
      onTap: () => context.pop(),
    );
  }
}

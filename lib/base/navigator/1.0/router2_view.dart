import 'package:flutter/material.dart';
import 'package:flutter_demo2/base/navigator/1.0/router_view.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/common/util/text_style.dart';

class Router2View extends StatelessWidget {
  static const String routeName = "/router2-page";
  const Router2View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: '路由跳转2'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    Object? argMap = ModalRoute.of(context)?.settings.arguments;
    Map argu = {};
    if (argMap != null && (argMap as Map).isNotEmpty) {
      argu = argMap;
    }

    return GestureDetector(
      child: Center(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.purple)),
          child: Text("This is a router2 page. argMap = $argu", textAlign: TextAlign.center, style: size16W500(color: Colors.purple)),
        ),
      ),
      onTap: () => Navigator.popUntil(context, ModalRoute.withName(RouterView.routeName)),
      // Navigator.pop(context),
    );
  }
}

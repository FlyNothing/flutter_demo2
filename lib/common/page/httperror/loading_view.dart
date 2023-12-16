import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/text_style.dart';

class HttpLoadingView extends StatelessWidget {
  const HttpLoadingView({Key? key}) : super(key: key);
  static const String routeName = "/loading";

  @override
  Widget build(BuildContext context) {
    return getTextContainer();
  }

  Container getTextContainer() {
    return Container(
      alignment: Alignment.center,
      child: Text("正在加载中", style: size16W400(color: Colors.red)),
    );
  }
}

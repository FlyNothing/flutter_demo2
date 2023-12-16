import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/global_widget.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/plugin/webview/common/webview_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WebviewFlutter2Page extends StatelessWidget {
  WebviewFlutter2Page(this._title, {Key? key}) : super(key: key);
  final String _title;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: _title),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Column(
      children: [
        _getUrlTextField(),
        StandardTextButton("打开", () => Navigator.push(context, MaterialPageRoute(builder: (context) => PlatformWebviewFlutter(_title, _controller.text)))),
      ],
    );
  }

  Container _getUrlTextField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.w),
      height: 40.h,
      width: 1.sw,
      child: StandardTextField(_controller, hintText: "请输入需要打开的网址"),
    );
  }
}

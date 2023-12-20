import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gAppBar('EasyLoading测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return const Center(
      child: Text("TestPage"),
    );
  }
}

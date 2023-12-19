import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';

class FutureView extends StatelessWidget {
  const FutureView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'Future测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Center(
      child: FutureBuilder(
        builder: (context, AsyncSnapshot<String> snapshot) {
          return Text(snapshot.data ?? "");
        },
        initialData: "init data",
        future: _getData(),
      ),
    );
  }

  Future<String> _getData() {
    return Future.delayed(const Duration(milliseconds: 1000), () => Future.value("get data success."));
  }
}

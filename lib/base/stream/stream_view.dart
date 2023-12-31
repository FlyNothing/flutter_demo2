import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';

class StreamView extends StatelessWidget {
  const StreamView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gAppBar('Stream测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Center(
      child: StreamBuilder(
        builder: (context, AsyncSnapshot<String> snapshot) {
          return Text(snapshot.data ?? "");
        },
        initialData: "init data",
        stream: _getData(),
      ),
    );
  }

  Stream<String> _getData() {
    return Stream.fromFuture(
      Future.delayed(const Duration(milliseconds: 1000), () => Future.value("get data success.")),
    );
  }
}

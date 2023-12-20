import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/global/global_theme_config.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ThemeView extends StatelessWidget {
  const ThemeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gAppBar("主题测试"),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      children: [
        const TextField(),
        TextButton(onPressed: () {}, child: const Text("文本按钮")),
        IconButton(onPressed: () {}, icon: const Icon(Icons.forward)),
        ElevatedButton(onPressed: () {}, child: const Text("漂浮按钮")),
        OutlinedButton(onPressed: () {}, child: const Text("线框按钮")),
        FloatingActionButton(
          onPressed: () => Get.bottomSheet(
            Container(
              height: 200.h,
              color: gColorWhite,
              alignment: Alignment.center,
              child: const Text("bottomSheet"),
            ),
          ),
        ),
        DropdownButtonFormField(
          isExpanded: true,
          alignment: Alignment.center,
          value: 1,
          items: const [DropdownMenuItem(value: 1, child: Text("One")), DropdownMenuItem(value: 2, child: Text("Two")), DropdownMenuItem(value: 3, child: Text("Three"))],
          onChanged: (value) => debugPrint("select value = $value"),
        ),
      ],
    );
  }
}

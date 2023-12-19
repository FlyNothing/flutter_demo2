import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// showModalBottomSheet和showBottomSheet
class BottomSheetView extends StatelessWidget {
  const BottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: "BottomSheet测试"),
      // 加上Builder，否则showBottomSheet调用会出现异常
      // No Scaffold widget found.
      // BottomSheetDemoView widgets require a Scaffold widget ancestor.
      body: Builder(builder: (context) => _getBody(context)),
    );
  }

  Widget _getBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          StandardTextButton(
            "showBottomSheet",
            () => showBottomSheet(
              context: context,
              builder: (context) => _getBottomSheet(),
            ),
          ),
          StandardTextButton(
            "showModalBottomSheet",
            () => showModalBottomSheet(
              barrierColor: Colors.black54,
              context: context,
              builder: (context) => _getBottomSheet(),
            ),
          ),
          StandardTextButton(
            "Get.bottomSheet",
            () => Get.bottomSheet(
              _getBottomSheet(),
              barrierColor: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Container _getBottomSheet() {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.green,
      ),
      height: 200,
      child: const Text(
        "BottomSheet",
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenutilHomeView extends StatelessWidget {
  const ScreenutilHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gAppBar('ScreenutilHomePage'),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            getDivider(bottom: 30.w),
            getDivider(bottom: 30.h),
            getDivider(bottom: 30.w),
            getDivider(bottom: 30.h),
            getDivider(bottom: 30.w),
          ],
        ),
      ),
    );
  }

  Padding getDivider({double bottom = 0.0}) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottom),
      child: const Divider(thickness: 2),
    );
  }
}

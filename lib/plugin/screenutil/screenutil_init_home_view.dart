import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenutilInitHomeView extends StatelessWidget {
  const ScreenutilInitHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(200, 600));
    return Scaffold(
      appBar: gAppBar('ScreenutilInitHomePage'),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            getDivider(top: 30.w),
            getDivider(top: 30.h),
            getDivider(top: 30.w),
            getDivider(top: 30.h),
            getDivider(top: 30.w),
          ],
        ),
      ),
    );
  }

  Padding getDivider({double top = 0.0}) {
    return Padding(
      padding: EdgeInsets.only(top: top),
      child: const Divider(thickness: 2),
    );
  }
}

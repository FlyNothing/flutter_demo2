import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/common/util/text_style.dart';
import 'package:flutter_demo2/plugin/flutterblueplus/flutter_blue_plus_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FlutterBluePlusView extends StatelessWidget {
  const FlutterBluePlusView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'FlutterBluePlus测试'),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return GetBuilder<FlutterBluePlusController>(
      init: FlutterBluePlusController(),
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getTitle(controller.devs.isEmpty ? "搜索设备中···" : "设备列表："),
          _getScanResult(controller),
        ],
      ),
    );
  }

  Widget _getTitle(String text) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, top: 20.h),
      child: Text(text, style: size18W500()),
    );
  }

  Widget _getScanResult(FlutterBluePlusController controller) {
    return SizedBox(
      height: 0.8.sh,
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 每行个数
          mainAxisSpacing: 20.h, // 主轴方向间距
          crossAxisSpacing: 20.w, // 辅轴方向间距
          childAspectRatio: 1.8, // 纵轴缩放比例
        ),
        itemCount: controller.devs.length,
        itemBuilder: (context, index) => GestureDetector(
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.w),
              color: Colors.grey.shade200,
            ),
            child: Text(controller.devs[index].advName, overflow: TextOverflow.ellipsis, maxLines: 1, style: size16W500()),
          ),
          onTap: () {
            BluetoothDevice sd = controller.devs.firstWhere((dev) => dev.advName == controller.devs[index].advName);
            controller.bleConnectDev(sd);
          },
        ),
      ),
    );
  }
}

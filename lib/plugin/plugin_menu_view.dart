import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/global/global_theme_config.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/common/util/text_style.dart';
import 'package:flutter_demo2/plugin/plugin_menu_config.dart';
import 'package:flutter_demo2/plugin/plugin_menu_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PluginMenuView extends StatelessWidget {
  const PluginMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PluginMenuController>(
      init: PluginMenuController(),
      builder: (controller) => Scaffold(
        appBar: _getBar((index) => controller.switchOrder(index)),
        body: _getBody(),
      ),
    );
  }

  PreferredSizeWidget _getBar(Function(int) onTap) {
    return gAppBar(
      'appBarTitlePlugin'.tr,
      actions: List.generate(
        pluginMenuSortList.length,
        (index) => GestureDetector(
          onTap: () => onTap.call(index),
          child: Container(
            padding: EdgeInsets.only(right: 10.w),
            child: Row(
              children: [
                Text(pluginMenuSortList[index].name, style: pluginMenuSortList[index].selected ? size14W600(color: gColorWhite) : size14W400(color: gColorWhite)),
                if (pluginMenuSortList[index].selected) Icon(pluginMenuSortList[index].asc ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, color: gColorWhite),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getBody() {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Text("${pluginMenuList[index].code}\n${pluginMenuList[index].name}"),
        trailing: gIconButton(
          Icons.navigate_next,
          () => Get.to(pluginMenuList[index].page, binding: pluginMenuList[index].binding, preventDuplicates: false),
        ),
      ),
      itemCount: pluginMenuList.length,
    );
  }
}

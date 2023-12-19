import 'package:flutter_demo2/plugin/plugin_menu_config.dart';
import 'package:get/get.dart';

class PluginMenuController extends GetxController {
  switchOrder(int index) {
    for (int i = 0; i < pluginMenuSortList.length; i++) {
      if (index == i) {
        if (pluginMenuSortList[i].selected) {
          pluginMenuSortList[i].asc = !pluginMenuSortList[i].asc;
        } else {
          pluginMenuSortList[i].selected = true;
          pluginMenuSortList[i].asc = true;
        }
        pluginMenuSortList[i].sortFun(pluginMenuSortList[i].asc ? 1 : -1);
      } else {
        pluginMenuSortList[i].selected = false;
      }
    }
    update();
  }
}

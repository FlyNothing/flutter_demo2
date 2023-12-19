import 'package:get/get.dart';

class NavigationBarHiddenController extends GetxController {
  var visible = true.obs;
  var index = 0.obs;

  switchVisible() {
    visible.value = !visible.value;
  }

  setIndex(int value) {
    index.value = value;
  }
}

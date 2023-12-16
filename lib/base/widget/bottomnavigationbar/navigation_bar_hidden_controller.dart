import 'package:get/get.dart';

class NavigationBarHiddenController extends GetxController {
  bool visible = true;
  int index = 0;

  switchVisible() {
    visible = !visible;
    update();
  }

  setIndex(int value) {
    index = value;
    update();
  }
}

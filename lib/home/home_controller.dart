import 'package:get/get.dart';

class HomeController extends GetxController {
  int barIndex = 0;

  setIndex(int index) {
    barIndex = index;
    update();
  }
}

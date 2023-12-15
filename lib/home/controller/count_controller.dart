import 'package:get/get.dart';

class CountController extends GetxController {
  RxInt cnt = 0.obs;
  increment() => cnt++;
  decrement() => cnt--;
}

class Count1Controller extends GetxController {
  int cnt = 0;
  List<String> his = List.empty(growable: true);
  increment() {
    cnt++;
    his.add("increment: $cnt");
    update();
  }

  decrement() {
    cnt--;
    his.add("decrement: $cnt");
    update();
  }
}

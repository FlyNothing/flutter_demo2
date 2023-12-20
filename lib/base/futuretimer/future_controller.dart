import 'package:flutter_demo2/common/util/get_api.dart';
import 'package:get/get.dart';

class FutureController extends GetxController {
  var getApi = Get.put(GetApi());

  getRaw(String url) {
    return getApi.getRaw(url);
  }
}

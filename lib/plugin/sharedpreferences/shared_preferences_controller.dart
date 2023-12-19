import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var intValue = -1.obs;

  @override
  void onInit() {
    super.onInit();
    _initValue();
  }

  _initValue() {
    _prefs.then((value) => intValue = value.getInt("int") ?? 0);
  }

  increment() {
    _prefs.then((value) => value.setInt("int", ++intValue));
  }

  decrement() {
    _prefs.then((value) => value.setInt("int", --intValue));
  }
}

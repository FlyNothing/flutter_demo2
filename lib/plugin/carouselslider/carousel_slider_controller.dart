import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class CarouselSliderController extends GetxController {
  late CarouselController controller;
  var isAutoPlay = true.obs;

  @override
  void onInit() {
    super.onInit();
    controller = CarouselController();
  }

  switchAutoPlay() {
    isAutoPlay.isTrue ? controller.stopAutoPlay() : controller.startAutoPlay();
    isAutoPlay.value = !isAutoPlay.value;
  }
}

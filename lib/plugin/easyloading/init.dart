import 'package:flutter_demo2/common/global/global_theme_config.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void initEasyLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    // loadingStyle: light, dark, custom
    ..loadingStyle = EasyLoadingStyle.dark
    // maskType: none, clear, black, custom
    ..maskType = EasyLoadingMaskType.none
    // toastPosition: top, center, bottom,
    ..toastPosition = EasyLoadingToastPosition.center
    // animationStyle: opacity, offset, scale, custom
    ..animationStyle = EasyLoadingAnimationStyle.opacity
    // indicatorType:
    // fadingCircle, circle, threeBounce, chasingDots, wave, wanderingCubes, rotatingPlain, doubleBounce, fadingFour, fadingCube, pulse,
    // cubeGrid, rotatingCircle, foldingCube, pumpingHeart, dualRing, hourGlass, pouringHourGlass, fadingGrid, ring, ripple, spinningCircle, squareCircle
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..userInteractions = true
    ..dismissOnTap = false

    /* 仅对 EasyLoadingStyle.custom 有效 */
    ..indicatorColor = gColorYellow
    ..progressColor = gColorYellow
    ..backgroundColor = gColorGreen
    ..textColor = gColorYellow

    /* 仅对 EasyLoadingMaskType.custom 有效 */
    ..maskColor = gColorLightPrimary.withOpacity(0.5);
}

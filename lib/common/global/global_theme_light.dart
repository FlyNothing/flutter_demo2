import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/global/global_theme_config.dart';

var lightTheme = ThemeData.light().copyWith(
  dialogBackgroundColor: gColorWhite,
  appBarTheme: _lightAppBarTheme(),
  // Button
  iconButtonTheme: _lightIconButtonThemeData(),
  textButtonTheme: _lightTextButtonThemeData(),
  elevatedButtonTheme: _lightElevatedButtonThemeData(),
  outlinedButtonTheme: _lightOutlinedButtonThemeData(),
  floatingActionButtonTheme: _lightFloatingActionButtonThemeData(),
  iconTheme: _lightIconThemeData(),
  inputDecorationTheme: _lightInputDecorationTheme(),
  bottomSheetTheme: _lightBottomSheetThemeData(),
  progressIndicatorTheme: _lightProgressIndicatorThemeData(),
  bottomNavigationBarTheme: _lightBottomNavigationBarThemeData(),
);

_lightAppBarTheme() => const AppBarTheme(
      centerTitle: true,
      color: gColorLightPrimary,
      elevation: 0,
      foregroundColor: gColorWhite,
    );

_lightIconButtonThemeData() => const IconButtonThemeData(style: ButtonStyle());

_lightTextButtonThemeData() => TextButtonThemeData(style: _lightButtonStyle());

_lightElevatedButtonThemeData() => ElevatedButtonThemeData(style: _lightButtonStyle());

_lightOutlinedButtonThemeData() => OutlinedButtonThemeData(style: _lightButtonStyle());

_lightFloatingActionButtonThemeData() => const FloatingActionButtonThemeData(
      backgroundColor: gColorLightPrimary,
      foregroundColor: gColorWhite,
    );

_lightIconThemeData() => const IconThemeData(
      color: gColorBlack38,
    );

_lightInputDecorationTheme() => const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      border: OutlineInputBorder(
        borderSide: BorderSide(width: 1),
        gapPadding: 0,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: gColorBlack),
        gapPadding: 0,
      ),
    );

_lightButtonStyle() => ButtonStyle(
      backgroundColor: MaterialStateProperty.all(gColorLightPrimary),
      foregroundColor: MaterialStateProperty.all(gColorWhite),
      padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
      overlayColor: MaterialStateProperty.all(gColorLightPrimary300),
      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: gFontSize16, fontWeight: gFontWeight400)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

_lightBottomSheetThemeData() => const BottomSheetThemeData(
      modalBarrierColor: gColorBlack54,
    );

_lightProgressIndicatorThemeData() => ProgressIndicatorThemeData(
      color: gColorLightPrimary,
      refreshBackgroundColor: gColorGrey400,
    );

_lightBottomNavigationBarThemeData() => const BottomNavigationBarThemeData(
      selectedItemColor: gColorLightPrimary,
    );

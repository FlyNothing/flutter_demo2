import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/global/global_theme_config.dart';

var darkTheme = ThemeData.dark().copyWith(
  dialogBackgroundColor: gColorWhite,
  appBarTheme: _darkAppBarTheme(),
  // Button
  iconButtonTheme: _darkIconButtonThemeData(),
  textButtonTheme: _darkTextButtonThemeData(),
  elevatedButtonTheme: _darkElevatedButtonThemeData(),
  outlinedButtonTheme: _darkOutlinedButtonThemeData(),
  floatingActionButtonTheme: _darkFloatingActionButtonThemeData(),
  iconTheme: _darkIconThemeData(),
  inputDecorationTheme: _darkInputDecorationTheme(),
  bottomSheetTheme: _darkBottomSheetThemeData(),
  progressIndicatorTheme: _darkProgressIndicatorThemeData(),
  bottomNavigationBarTheme: _darkBottomNavigationBarThemeData(),
);

_darkAppBarTheme() => AppBarTheme(
      centerTitle: true,
      color: gColorGrey800,
      elevation: 0,
      foregroundColor: gColorWhite,
    );

_darkIconButtonThemeData() => const IconButtonThemeData(style: ButtonStyle());

_darkTextButtonThemeData() => TextButtonThemeData(style: _darkButtonStyle());

_darkElevatedButtonThemeData() => ElevatedButtonThemeData(style: _darkButtonStyle());

_darkOutlinedButtonThemeData() => OutlinedButtonThemeData(style: _darkButtonStyle());

_darkFloatingActionButtonThemeData() => const FloatingActionButtonThemeData(
      backgroundColor: gColorDarkPrimary,
      foregroundColor: gColorWhite,
    );

_darkIconThemeData() => const IconThemeData(
      color: gColorDarkPrimary,
    );

_darkInputDecorationTheme() => const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      border: OutlineInputBorder(
        borderSide: BorderSide(width: 1),
        gapPadding: 0,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: gColorWhite),
        gapPadding: 0,
      ),
    );

_darkButtonStyle() => ButtonStyle(
      backgroundColor: MaterialStateProperty.all(gColorDarkPrimary),
      foregroundColor: MaterialStateProperty.all(gColorWhite),
      padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
      overlayColor: MaterialStateProperty.all(gColorDarkPrimary300),
      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: gFontSize16, fontWeight: gFontWeight400)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

_darkBottomSheetThemeData() => const BottomSheetThemeData(
      modalBarrierColor: gColorBlack54,
    );

_darkProgressIndicatorThemeData() => ProgressIndicatorThemeData(
      color: gColorDarkPrimary,
      refreshBackgroundColor: gColorGrey400,
    );

_darkBottomNavigationBarThemeData() => const BottomNavigationBarThemeData(
      selectedItemColor: gColorDarkPrimary,
    );

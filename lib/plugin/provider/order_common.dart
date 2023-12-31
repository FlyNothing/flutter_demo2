import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/global/global_theme_config.dart';
import 'package:flutter_demo2/plugin/provider/entity/order_type_enum.dart';

String getPriceString(double price) {
  String sPrice = price.toString();
  if ((sPrice.length - sPrice.lastIndexOf(".") - 1) < 2) {
    return price.toStringAsFixed(2);
  } else {
    return sPrice.substring(0, sPrice.lastIndexOf(".") + 2 + 1);
  }
}

Map<int, String> orderTypeTextMap = {OrderTypeEnum.income.index: "收入", OrderTypeEnum.expenditure.index: "支出"};
Map<int, Color> orderTypeColorMap = {OrderTypeEnum.income.index: gColorGreen, OrderTypeEnum.expenditure.index: gColorRed};

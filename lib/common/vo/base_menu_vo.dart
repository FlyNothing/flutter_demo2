import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BaseMenuVO {
  BaseMenuVO(this.name, this.page, {this.binding});

  final String name;
  final Widget page;
  final Bindings? binding;
}

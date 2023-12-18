import 'package:flutter/widgets.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

/// 插件列表显示菜单VO对象
class PluginMenuVO {
  PluginMenuVO(this.code, this.name, this.page, {this.binding});

  /// 插件完整名称
  final String code;

  /// 插件中文说明
  final String name;

  /// 插件对应跳转页面
  final Widget page;

  final Bindings? binding;
}

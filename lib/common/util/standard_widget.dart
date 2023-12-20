import 'package:flutter/material.dart';

/// 标准APP BAR
AppBar gAppBar(String title, {Color? backgroundColor, List<Widget>? actions}) => AppBar(
      backgroundColor: backgroundColor,
      title: Text(title, textAlign: TextAlign.center),
      actions: actions,
    );

/// 标准文本按钮
///
/// text: 文本内容[必须]
///
/// onPressed: 按钮执行函数[必须]
TextButton gTextButton(String text, Function() onPressed) => TextButton(onPressed: onPressed, child: Text(text));

/// 标准图标按钮
///
/// icon: 图标[必须]
///
/// onPressed: 按钮执行函数[必须]
IconButton gIconButton(IconData icon, Function() onPressed, {Color? color}) => IconButton(onPressed: onPressed, icon: Icon(icon));

/// 标准文本框
///
/// controller: 控制器[必须]
///
/// hintText: 默认文本[可选]
///
/// keyboardType: 键盘方式[可选]
TextField gTextField(TextEditingController controller, {String? hintText, TextInputType? keyboardType}) => TextField(
      keyboardType: keyboardType,
      // 文本垂直居中
      textAlignVertical: TextAlignVertical.center,
      // 文本水平居中
      textAlign: TextAlign.center,
      controller: controller,
    );

/// 标准下拉框
///
/// valueMap: 下拉框数据及显示值链表[必须]
///
/// onChanged: 数据变化时执行的函数[必须]
DropdownButtonFormField gDropdownButtonFormField(Map<int, String> valueMap, void Function(dynamic) onChanged) {
  List<MapEntry<int, String>> entryList = List.from(valueMap.entries);
  return DropdownButtonFormField(
    isExpanded: true,
    alignment: Alignment.center,
    value: entryList[0].key,
    items: List.generate(
      entryList.length,
      (index) => DropdownMenuItem(
        alignment: AlignmentDirectional.center,
        value: entryList[index].key,
        child: Text(entryList[index].value),
      ),
    ),
    onChanged: onChanged,
  );
}

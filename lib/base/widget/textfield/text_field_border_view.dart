import 'package:flutter/material.dart';
import 'package:flutter_demo2/base/widget/textfield/text_field_border_controller.dart';
import 'package:flutter_demo2/common/util/global_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TextFieldBorderView extends GetView<TextFieldBorderController> {
  const TextFieldBorderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: "TextField边框"),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return Column(
      children: [
        getSizedBox(
          "Border",
          TextField(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(0.0),
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1),
                gapPadding: 0,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.yellow),
                gapPadding: 0,
              ),
              hintText: "hintText",
            ),
            style: const TextStyle(fontSize: 15),
            controller: controller.controller1,
          ),
        ),
        getSizedBox(
          "enabledBorder",
          TextField(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(0.0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.purple),
                gapPadding: 0,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.yellow),
                gapPadding: 0,
              ),
              hintText: "hintText",
            ),
            style: const TextStyle(fontSize: 15),
            controller: controller.controller2,
          ),
        ),
        getSizedBox(
          "errorBorder",
          TextField(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(0.0),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.red),
                gapPadding: 0,
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.blue),
                gapPadding: 0,
              ),
              errorText: "errorText",
            ),
            style: const TextStyle(fontSize: 15),
            controller: controller.controller3,
          ),
          height: 50.h,
        ),
        getSizedBox(
          "disabledBorder",
          TextField(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(0.0),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.green),
                gapPadding: 0,
              ),
            ),
            enabled: false,
            style: const TextStyle(fontSize: 15),
            controller: controller.controller4,
          ),
        ),
      ],
    );
  }

  Row getSizedBox(String desc, TextField textField, {double? height}) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: 0.1.sw, right: 0.05.sw),
          height: height ?? 30.h,
          width: 0.25.sw,
          child: Text(desc),
        ),
        Container(
          margin: EdgeInsets.only(top: 0.1.sw, right: 0.05.sw),
          height: height ?? 30.h,
          width: 0.6.sw,
          child: textField,
        )
      ],
    );
  }
}

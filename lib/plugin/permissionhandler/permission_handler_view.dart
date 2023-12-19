import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_demo2/common/util/standard_widget.dart';
import 'package:flutter_demo2/plugin/permissionhandler/permission_view.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandlerView extends StatelessWidget {
  const PermissionHandlerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStandard(title: 'PermissionHandler测试'),
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Center(
      child: ListView(
        children: Permission.values
            .where((permission) {
              if (Platform.isIOS) {
                return permission != Permission.unknown &&
                    permission != Permission.sms &&
                    permission != Permission.storage &&
                    permission != Permission.ignoreBatteryOptimizations &&
                    permission != Permission.accessMediaLocation &&
                    permission != Permission.activityRecognition &&
                    permission != Permission.manageExternalStorage &&
                    permission != Permission.systemAlertWindow &&
                    permission != Permission.requestInstallPackages &&
                    permission != Permission.accessNotificationPolicy &&
                    permission != Permission.bluetoothScan &&
                    permission != Permission.bluetoothAdvertise &&
                    permission != Permission.bluetoothConnect;
              } else {
                return permission != Permission.unknown &&
                    permission != Permission.mediaLibrary &&
                    permission != Permission.photos &&
                    permission != Permission.photosAddOnly &&
                    permission != Permission.reminders &&
                    permission != Permission.appTrackingTransparency &&
                    permission != Permission.criticalAlerts;
              }
            })
            .map((permission) => PermissionWidget(permission))
            .toList(),
      ),
    );
  }
}

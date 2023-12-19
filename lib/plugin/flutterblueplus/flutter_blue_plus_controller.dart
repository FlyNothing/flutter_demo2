import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';

class FlutterBluePlusController extends GetxController {
  final List<BluetoothDevice> devs = List.empty(growable: true);
  StreamSubscription<List<ScanResult>>? _scanStream;
  StreamSubscription<BluetoothConnectionState>? _stateStream;
  StreamSubscription<List<int>>? _readStream;
  BluetoothCharacteristic? _writeCs;

  @override
  void onInit() {
    super.onInit();
    bleScanDev();
  }

  @override
  void onClose() {
    _readStream?.cancel();
    _stateStream?.cancel();
    _scanStream?.cancel();
    FlutterBluePlus.stopScan();
    super.onClose();
  }

  /// 扫描设备
  Future bleScanDev() async {
    FlutterBluePlus.startScan(
      timeout: const Duration(seconds: 30),
      withKeywords: ["FD"], //  ["C01", "E01"],
    );
    _scanStream?.cancel();
    _scanStream = FlutterBluePlus.onScanResults.listen((srs) {
      // ScanResult{
      //    device: BluetoothDevice{remoteId: AC:E3:42:87:25:CA, platformName: HONOR MagicWatch 2-5CA, services: null},
      //    advertisementData: AdvertisementData{
      //                                  advName: HONOR MagicWatch 2-5CA,
      //                                  txPowerLevel: 0,
      //                                  connectable: true,
      //                                  manufacturerData: {637: [1, 3, 3, 255, 255]},
      //                                  serviceData: {fdee: [1, 1, 0, 15, 1]},
      //                                  serviceUuids: []
      //                                  },
      //    rssi: -98,
      //    timeStamp: 2023-12-13 14:51:24.447898
      //    }
      int newDevCnt = 0;
      for (ScanResult sr in srs) {
        String advName = sr.device.advName;
        if (devs.indexWhere((dev) => dev.advName == sr.device.advName) < 0) {
          debugPrint("ScanResult filter: advName = $advName");
          newDevCnt++;
          devs.add(sr.device);
        }
      }
      if (newDevCnt > 0) {
        update();
      }
    });
  }

  /// 连接设备
  void bleConnectDev(BluetoothDevice sd) {
    _stateStream?.cancel();
    _stateStream = sd.connectionState.listen((state) {
      debugPrint("BluetoothConnectionState: name = ${state.name}");
      if (state == BluetoothConnectionState.connected) {
        // 连接
        bleDiscoverServices(sd);
      } else if (state == BluetoothConnectionState.disconnected) {
        // 断连 - 重连
        Future.delayed(const Duration(milliseconds: 500), () => bleConnectDev(sd));
      }
    });
    sd.connect();
  }

  /// 发现服务
  Future<void> bleDiscoverServices(BluetoothDevice sd) async {
    List<BluetoothService> services = await sd.discoverServices(timeout: 5);
    for (BluetoothService service in services) {
      for (BluetoothCharacteristic cs in service.characteristics) {
        if (cs.properties.read) {
          _readStream?.cancel();
          _readStream = cs.onValueReceived.listen((data) {
            debugPrint("ValueReceived: data = $data");
          });
        } else if (cs.properties.write) {
          _writeCs = cs;
        }
      }
    }
  }

  /// 写入数据
  void bleWrite(String content) {
    _writeCs?.write(content.codeUnits);
  }
}

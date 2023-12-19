import 'package:flutter/material.dart';
import 'package:flutter_demo2/plugin/sqlite/sqflite/dao/user_dao.dart';
import 'package:flutter_demo2/plugin/sqlite/sqflite/entity/user.dart';
import 'package:get/get.dart';

class SqfliteController extends GetxController {
  var userList = [].obs;
  late TextEditingController nameController;
  late TextEditingController ageController;
  late TextEditingController addrController;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    ageController = TextEditingController();
    addrController = TextEditingController();
    Future future = UserDao().open();
    future.then((value) async {
      userList.value = await UserDao().getAll();
      update();
    });
  }

  @override
  void onClose() {
    nameController.dispose();
    ageController.dispose();
    addrController.dispose();
    super.onClose();
  }

  delete(int index) async {
    await UserDao().deleteById(userList[index].id);
    userList.removeAt(index);
    update();
  }

  insert() async {
    await UserDao().insertRaw(User(id: 0, name: nameController.text, age: int.parse(ageController.text), addr: addrController.text));
    userList.value = await UserDao().getAll();
    update();
  }
}

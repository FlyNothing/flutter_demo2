import 'package:flutter/material.dart';
import 'package:flutter_demo2/plugin/sqlite/floor/dao/customer_dao.dart';
import 'package:flutter_demo2/plugin/sqlite/floor/dao/customer_db.dart';
import 'package:flutter_demo2/plugin/sqlite/floor/entity/customer.dart';
import 'package:flutter_demo2/plugin/sqlite/sqflite/const/common_const.dart';
import 'package:get/get.dart';

class FloorController extends GetxController {
  var userList = [].obs;
  late TextEditingController nameController;
  late TextEditingController ageController;
  late TextEditingController addrController;
  late CustomerDao _customerDao;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    ageController = TextEditingController();
    addrController = TextEditingController();
    Future<CustomerDatabase> future = $FloorCustomerDatabase.databaseBuilder(dbCustomer).build();
    future.then((value) async {
      _customerDao = value.customerDao;
      userList.value = await _customerDao.queryAll();
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
    await _customerDao.deletePerson(userList[index]);
    userList.removeAt(index);
  }

  insert() async {
    await _customerDao.insertCustomer(Customer(name: nameController.text, age: int.parse(ageController.text), addr: addrController.text));
    userList.value = await _customerDao.queryAll();
  }
}

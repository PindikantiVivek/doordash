import 'package:doordash/utils/hive_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpiPinController extends GetxController {
  late int restaurantIndex;
  late int amount;

  @override
  void onInit() {
    super.onInit();
    restaurantIndex = Get.arguments["restaurantIndex"];
    amount = Get.arguments["amount"];
  }

  onSubmit(String value) {
    if (value.length == 4) {
      Map orders = HiveStorage.instance.hive.get("orders");
      orders.remove(restaurantIndex);
      HiveStorage.instance.hive.put("orders", orders);
      Get.until((route) => route.settings.name == "/home");
      Get.showSnackbar(
        const GetSnackBar(
          snackStyle: SnackStyle.FLOATING,
          backgroundColor: Colors.green,
          messageText: Text(
            'Order Placed Successfully!',
            style: TextStyle(color: Colors.white),
          ),
          duration: Duration(seconds: 5),
        ),
      );
    } else {
      Get.showSnackbar(
        const GetSnackBar(
          messageText: Text(
            'Invalid UPI Pin',
            style: TextStyle(color: Colors.red),
          ),
          duration: Duration(seconds: 5),
        ),
      );
    }
  }
}

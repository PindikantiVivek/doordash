import 'package:get/get.dart';

class UpiPayController extends GetxController {

  late int restaurantIndex;
  late int amount;
  int? selected;
  final verified = false.obs;

  @override
  void onInit() {
    super.onInit();
    restaurantIndex = Get.arguments["restaurantIndex"];
    amount = Get.arguments["amount"];
  }

  selectUpi(int value) {
    selected = value;
    update(["UpiPay"]);
  }

  validateUpi(String value) {
    if(RegExp(r"^[a-zA-Z0-9\\.]{4,20}@[a-zA-Z]{3,20}$").hasMatch(value)) {
      verified.value = true;
    } else {
      verified.value = false;
    }
  }

  onPay() {
    Get.toNamed("/upi-pin", arguments: {
      "restaurantIndex": restaurantIndex,
      "amount": amount,
    });
  }

}
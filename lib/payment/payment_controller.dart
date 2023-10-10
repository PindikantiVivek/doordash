import 'package:get/get.dart';

class PaymentController extends GetxController {
  late int restaurantIndex;
  late int amount;

  @override
  void onInit() {
    super.onInit();
    restaurantIndex = Get.arguments["restaurantIndex"];
    amount = Get.arguments["amount"];
  }

  void onUpiPay() {
    Get.toNamed("/upi-pay", arguments: {
      "restaurantIndex": restaurantIndex,
      "amount": amount,
    });
  }
}

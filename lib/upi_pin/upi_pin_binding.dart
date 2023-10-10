import 'package:doordash/upi_pin/upi_pin_controller.dart';
import 'package:get/get.dart';

class UpiPinBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UpiPinController());
  }

}
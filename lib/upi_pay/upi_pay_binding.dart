import 'package:doordash/upi_pay/upi_pay_controller.dart';
import 'package:get/get.dart';

class UpiPayBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UpiPayController());
  }

}
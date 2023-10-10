import 'package:doordash/restaurant_menu/restaurant_menu_controller.dart';
import 'package:get/get.dart';

class RestaurantMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RestaurantMenuController());
  }
}
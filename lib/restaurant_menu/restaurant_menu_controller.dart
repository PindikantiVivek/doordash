import 'package:doordash/utils/data.dart';
import 'package:doordash/utils/hive_storage.dart';
import 'package:get/get.dart';

class RestaurantMenuController extends GetxController {
  late int restaurantIndex;
  List filteredMenu = [];
  Map orders = {};
  int orderCount = 0;
  int orderTotal = 0;

  @override
  void onInit() {
    super.onInit();
    restaurantIndex = Get.arguments["restaurantIndex"];
    filteredMenu = restaurants[restaurantIndex]["menu"];
    orders = HiveStorage.instance.hive.get("orders") ?? {};
    if (orders[restaurantIndex] == null) {
      orders[restaurantIndex] = {};
    }
    HiveStorage.instance.hive.put("orders", orders);
    orders[restaurantIndex].forEach((key, value) {
      orderCount += value as int;
      orderTotal += (restaurants[restaurantIndex]["menu"][key]["price"] as int) * value;
    });
  }

  void onSearch(String value) {
    if (value.isNotEmpty) {
      filteredMenu = [];
      for (Map menu in restaurants[restaurantIndex]["menu"]) {
        if (menu["name"].toString().toLowerCase().contains(value.toLowerCase())) {
          filteredMenu.add(menu);
        }
      }
    } else {
      filteredMenu = restaurants[restaurantIndex]["menu"];
    }
    update(["RestaurantMenu", "CartPage"]);
  }

  void onItemAdd(Map item) {
    orders[restaurantIndex][restaurants[restaurantIndex]["menu"].indexOf(item)] =
        1 + ((orders[restaurantIndex][restaurants[restaurantIndex]["menu"].indexOf(item)]) ?? 0);
    orderCount++;
    orderTotal += item["price"] as int;
    update(["RestaurantMenu", "CartPage"]);
    HiveStorage.instance.hive.put("orders", orders);
  }

  void onItemRemove(Map item) {
    if (orders[restaurantIndex][restaurants[restaurantIndex]["menu"].indexOf(item)] != null &&
        orders[restaurantIndex][restaurants[restaurantIndex]["menu"].indexOf(item)] > 0) {
      orders[restaurantIndex][restaurants[restaurantIndex]["menu"].indexOf(item)]--;
      if (orders[restaurantIndex][restaurants[restaurantIndex]["menu"].indexOf(item)] == 0) {
        orders[restaurantIndex].remove(restaurants[restaurantIndex]["menu"].indexOf(item));
      }
      orderCount--;
      orderTotal -= item["price"] as int;
    }
    update(["RestaurantMenu", "CartPage"]);
    HiveStorage.instance.hive.put("orders", orders);
  }

  void onCartClick() {
    Get.toNamed("/cart");
  }

  void onPay() {
    Get.toNamed("/payment", arguments: {
      "restaurantIndex": restaurantIndex,
      "amount": orderTotal + 100 + (orderTotal * 0.18).round(),
    });
  }
}

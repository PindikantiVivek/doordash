import 'package:doordash/utils/data.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List filteredRestaurants = [];

  @override
  void onInit() {
    super.onInit();
    filteredRestaurants = List.from(restaurants);
  }

  onSearch(String value) {
    if (value.isNotEmpty) {
      filteredRestaurants = [];
      for (Map restaurant in restaurants) {
        if (restaurant["name"].toString().toLowerCase().contains(value.toLowerCase())) {
          filteredRestaurants.add(restaurant);
        } else {
          for (Map menu in restaurant["menu"]) {
            if (menu["name"].toString().toLowerCase().contains(value.toLowerCase())) {
              filteredRestaurants.add(restaurant);
              break;
            }
          }
        }
      }
    } else {
      filteredRestaurants = restaurants;
    }
    update(["HomePage"]);
  }

  onRestaurantTap(Map restaurant) {
    Get.toNamed("/restaurant-menu", arguments: {"restaurantIndex": restaurants.indexOf(restaurant)});
  }
}

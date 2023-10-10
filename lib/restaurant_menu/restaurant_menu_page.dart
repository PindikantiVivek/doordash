import 'package:doordash/restaurant_menu/restaurant_menu_controller.dart';
import 'package:doordash/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestaurantMenuPage extends StatelessWidget {
  const RestaurantMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestaurantMenuController>(
      id: "RestaurantMenu",
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Image.asset(
                        restaurants[controller.restaurantIndex]["asset"],
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ).paddingSymmetric(horizontal: 16),
                  Row(
                    children: [
                      Text(
                        restaurants[controller.restaurantIndex]["name"],
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                      const Expanded(child: SizedBox()),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.orangeAccent, size: 25),
                              const SizedBox(width: 4),
                              Text(
                                restaurants[controller.restaurantIndex]["rating"],
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          Text(
                            restaurants[controller.restaurantIndex]["type"],
                            style: const TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                        ],
                      ),
                    ],
                  ).paddingAll(16),
                  const Text(
                    "Menu",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ).paddingSymmetric(horizontal: 16),
                  TextField(
                    onChanged: controller.onSearch,
                    decoration: InputDecoration(
                      hintText: "Search Dishes",
                      suffixIcon: const Icon(Icons.search, size: 25),
                      isDense: true,
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ).paddingAll(16),
                  ListView.builder(
                    itemCount: controller.filteredMenu.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(blurRadius: 10, color: Colors.black26),
                          ],
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.fastfood,
                              size: 50,
                              color: Colors.orangeAccent,
                            ).paddingSymmetric(horizontal: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.filteredMenu[index]["name"],
                                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "₹ ",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.orangeAccent,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "${controller.filteredMenu[index]["price"]}",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const TextSpan(
                                          text: ".00",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ).paddingSymmetric(vertical: 4),
                                  Text(
                                    controller.filteredMenu[index]["description"],
                                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                                  ),
                                ],
                              ).paddingAll(12),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () => controller.onItemRemove(controller.filteredMenu[index]),
                                  icon: const Icon(
                                    Icons.remove_circle,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                ),
                                Text(
                                  "${controller.orders[controller.restaurantIndex][restaurants[controller.restaurantIndex]["menu"].indexOf(controller.filteredMenu[index])] ?? "0"}",
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                ),
                                IconButton(
                                  onPressed: () => controller.onItemAdd(controller.filteredMenu[index]),
                                  icon: const Icon(
                                    Icons.add_circle,
                                    color: Colors.green,
                                    size: 20,
                                  ),
                                  splashRadius: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ).paddingOnly(bottom: 16);
                    },
                  ).paddingSymmetric(horizontal: 16),
                  const SizedBox(height: 36),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: controller.onCartClick,
            label: Row(
              children: [
                RichText(
                  text: TextSpan(
                    text: "₹ ",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.orangeAccent,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: "${controller.orderTotal}",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const TextSpan(
                        text: ".00",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ).paddingSymmetric(vertical: 4),
                const SizedBox(width: 12),
                Stack(
                  children: [
                    const Icon(Icons.shopping_cart, size: 30).paddingOnly(top: 12, bottom: 12, right: 12),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.orangeAccent,
                        ),
                        child: Text(
                          "${controller.orderCount}",
                          style: const TextStyle(fontSize: 14),
                        ).paddingSymmetric(horizontal: 6, vertical: 4),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

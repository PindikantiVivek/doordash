import 'package:doordash/restaurant_menu/restaurant_menu_controller.dart';
import 'package:doordash/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestaurantMenuController>(
      id: "CartPage",
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.grey.shade200,
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () => Get.back(),
                              icon: const Icon(Icons.arrow_back),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              restaurants[controller.restaurantIndex]["name"],
                              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                            boxShadow: const [BoxShadow(blurRadius: 5, color: Colors.black12)],
                          ),
                          child: ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: controller.orders[controller.restaurantIndex].entries.map<Widget>((e) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: Text(
                                          restaurants[controller.restaurantIndex]["menu"][e.key]["name"],
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Row(
                                          children: [
                                            IconButton(
                                              onPressed: () => controller
                                                  .onItemRemove(restaurants[controller.restaurantIndex]["menu"][e.key]),
                                              icon: const Icon(
                                                Icons.remove_circle,
                                                color: Colors.red,
                                                size: 20,
                                              ),
                                            ),
                                            Text(
                                              "${e.value}",
                                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                            ),
                                            IconButton(
                                              onPressed: () => controller
                                                  .onItemAdd(restaurants[controller.restaurantIndex]["menu"][e.key]),
                                              icon: const Icon(
                                                Icons.add_circle,
                                                color: Colors.green,
                                                size: 20,
                                              ),
                                              splashRadius: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: RichText(
                                            text: TextSpan(
                                              text: "₹ ",
                                              style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.orangeAccent,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text:
                                                      "${restaurants[controller.restaurantIndex]["menu"][e.key]["price"] * e.value}",
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
                                        ),
                                      ),
                                    ],
                                  ).paddingAll(12),
                                  const Divider(height: 1, thickness: 1, indent: 16, endIndent: 16),
                                ],
                              );
                            }).toList(),
                          ),
                        ).paddingAll(16),
                        const Text(
                          "Offers & Benefits",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        ).paddingSymmetric(horizontal: 16),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                            boxShadow: const [BoxShadow(blurRadius: 5, color: Colors.black12)],
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Apply Coupon",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              Icon(Icons.keyboard_arrow_right, size: 25),
                            ],
                          ).paddingAll(16),
                        ).paddingAll(16),
                        const Text(
                          "Bill Details",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        ).paddingSymmetric(horizontal: 16),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                            boxShadow: const [BoxShadow(blurRadius: 5, color: Colors.black12)],
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Item Total",
                                    style: TextStyle(fontSize: 14, color: Colors.black54),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "₹ ",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.orangeAccent,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "${controller.orderTotal}",
                                          style: const TextStyle(
                                            fontSize: 16,
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
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Delivery Fee",
                                    style: TextStyle(fontSize: 14, color: Colors.black54),
                                  ),
                                  RichText(
                                    text: const TextSpan(
                                      text: "₹ ",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.orangeAccent,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "100",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ".00",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ).paddingSymmetric(vertical: 4),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "GST and Restaurant Charges",
                                    style: TextStyle(fontSize: 14, color: Colors.black54),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "₹ ",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.orangeAccent,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "${(controller.orderTotal * 0.18).round()}",
                                          style: const TextStyle(
                                            fontSize: 16,
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
                                ],
                              ),
                              const Divider(
                                height: 32,
                                thickness: 1,
                                color: Colors.black12,
                                indent: 12,
                                endIndent: 12,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "GST and Restaurant Charges",
                                    style: TextStyle(fontSize: 14, color: Colors.black54),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "₹ ",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.orangeAccent,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      children: [
                                        TextSpan(
                                          text:
                                              "${(controller.orderTotal * 0.18).round() + controller.orderTotal + 100}",
                                          style: const TextStyle(
                                            fontSize: 16,
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
                                ],
                              ),
                            ],
                          ).paddingAll(16),
                        ).paddingAll(16),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                    color: Colors.white,
                    boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black12)],
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                  text: "${(controller.orderTotal * 0.18).round() + controller.orderTotal + 100}",
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
                            "View Detailed Bill",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.green.shade500,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 36),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: controller.onPay,
                          child: const Text(
                            "Proceed to Pay",
                            style: TextStyle(fontSize: 18),
                          ).paddingAll(12),
                        ),
                      )
                    ],
                  ).paddingAll(16),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

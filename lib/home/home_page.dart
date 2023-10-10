import 'package:doordash/home/home_controller.dart';
import 'package:doordash/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: "HomePage",
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.maps_home_work,
                                color: Colors.orangeAccent,
                                size: 20,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Home",
                                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                              ),
                              Icon(Icons.keyboard_arrow_down, size: 20),
                            ],
                          ),
                          Text(
                            "A-15, 5th Avenue, Near The Plaza, S.F, CA",
                            style: TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                      const Expanded(child: SizedBox()),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 25,
                        ).paddingAll(4),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    onChanged: controller.onSearch,
                    decoration: InputDecoration(
                      hintText: "Search Restaurant/Dishes",
                      suffixIcon: const Icon(Icons.search, size: 25),
                      isDense: true,
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const Text(
                    "What's on your mind?",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ).paddingSymmetric(vertical: 16),
                  SizedBox(
                    height: 250,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      itemCount: foodCategory.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(foodCategory[index]["asset"], height: 80, width: 80),
                            Text(foodCategory[index]["name"]),
                          ],
                        );
                      },
                    ),
                  ),
                  const Text(
                    "6 restaurants to explore",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ).paddingSymmetric(vertical: 16),
                  ListView.builder(
                    itemCount: controller.filteredRestaurants.length,
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
                        clipBehavior: Clip.antiAlias,
                        child: Material(
                          child: InkWell(
                            onTap: () => controller.onRestaurantTap(controller.filteredRestaurants[index]),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  controller.filteredRestaurants[index]["asset"],
                                  height: 100,
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.filteredRestaurants[index]["name"],
                                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.star, color: Colors.orangeAccent, size: 20),
                                        const SizedBox(width: 4),
                                        Text(
                                          controller.filteredRestaurants[index]["rating"],
                                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      controller.filteredRestaurants[index]["type"],
                                      style: const TextStyle(fontSize: 14, color: Colors.black54),
                                    ),
                                  ],
                                ).paddingAll(12),
                              ],
                            ),
                          ),
                        ),
                      ).paddingOnly(bottom: 16);
                    },
                  ),
                ],
              ).paddingAll(16),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black12,
            elevation: 20,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.fastfood),
                label: 'Food',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.dining),
                label: 'Dineout',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_grocery_store),
                label: 'Instamart',
              ),
            ],
            currentIndex: 0,
          ),
        );
      },
    );
  }
}

import 'package:doordash/upi_pay/upi_pay_controller.dart';
import 'package:doordash/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpiPayPage extends StatelessWidget {
  const UpiPayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpiPayController>(
      id: "UpiPay",
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.grey.shade200,
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () => Get.back(),
                              icon: const Icon(Icons.arrow_back),
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "UPI Payment Options",
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                ),
                                IntrinsicHeight(
                                  child: Row(
                                    children: [
                                      Text(
                                        restaurants[controller.restaurantIndex]["name"],
                                        style: const TextStyle(fontSize: 14, color: Colors.black87),
                                      ),
                                      const VerticalDivider(
                                        color: Colors.black26,
                                        thickness: 1,
                                        width: 16,
                                        indent: 4,
                                        endIndent: 4,
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
                                              text: "${controller.amount}",
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
                                ),
                              ],
                            ).paddingOnly(top: 10),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [BoxShadow(blurRadius: 5, color: Colors.black12)],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "UPI",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Expanded(
                                    child: Material(
                                      borderRadius: BorderRadius.circular(16),
                                      elevation: controller.selected == 0 ? 5 : 0,
                                      color: controller.selected == 0 ? Colors.white : const Color(0xffedf2f8),
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(16),
                                        onTap: () => controller.selectUpi(0),
                                        child: Stack(
                                          children: [
                                            Center(
                                              child: Column(
                                                children: [
                                                  Image.asset("assets/paytm.png", height: 30),
                                                  const SizedBox(height: 6),
                                                  const Text(
                                                    "Paytm",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black87,
                                                    ),
                                                  ),
                                                ],
                                              ).paddingAll(10),
                                            ),
                                            if (controller.selected == 0) ...[
                                              const Positioned(
                                                top: 6,
                                                left: 6,
                                                child: Icon(
                                                  Icons.check_circle,
                                                  size: 20,
                                                  color: Colors.blueAccent,
                                                ),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Material(
                                      borderRadius: BorderRadius.circular(16),
                                      elevation: controller.selected == 1 ? 5 : 0,
                                      color: controller.selected == 1 ? Colors.white : const Color(0xffedf2f8),
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(16),
                                        onTap: () => controller.selectUpi(1),
                                        child: Stack(
                                          children: [
                                            Center(
                                              child: Column(
                                                children: [
                                                  Image.asset("assets/gpay.png", height: 30),
                                                  const SizedBox(height: 6),
                                                  const Text(
                                                    "Google Pay",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black87,
                                                    ),
                                                  ),
                                                ],
                                              ).paddingAll(10),
                                            ),
                                            if (controller.selected == 1) ...[
                                              const Positioned(
                                                top: 6,
                                                left: 6,
                                                child: Icon(
                                                  Icons.check_circle,
                                                  size: 20,
                                                  color: Colors.blueAccent,
                                                ),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    child: Material(
                                      borderRadius: BorderRadius.circular(16),
                                      elevation: controller.selected == 2 ? 5 : 0,
                                      color: controller.selected == 2 ? Colors.white : const Color(0xffedf2f8),
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(16),
                                        onTap: () => controller.selectUpi(2),
                                        child: Stack(
                                          children: [
                                            Center(
                                              child: Column(
                                                children: [
                                                  Image.asset("assets/phonepe.png", height: 30),
                                                  const SizedBox(height: 6),
                                                  const Text(
                                                    "PhonePe",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black87,
                                                    ),
                                                  ),
                                                ],
                                              ).paddingAll(10),
                                            ),
                                            if (controller.selected == 2) ...[
                                              const Positioned(
                                                top: 6,
                                                left: 6,
                                                child: Icon(
                                                  Icons.check_circle,
                                                  size: 20,
                                                  color: Colors.blueAccent,
                                                ),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Material(
                                      borderRadius: BorderRadius.circular(16),
                                      elevation: controller.selected == 3 ? 5 : 0,
                                      color: controller.selected == 3 ? Colors.white : const Color(0xffedf2f8),
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(16),
                                        onTap: () => controller.selectUpi(3),
                                        child: Stack(
                                          children: [
                                            Center(
                                              child: const Column(
                                                children: [
                                                  Icon(
                                                    Icons.more_horiz,
                                                    size: 30,
                                                    color: Colors.black87,
                                                  ),
                                                  SizedBox(height: 6),
                                                  Text(
                                                    "Other UPI",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black87,
                                                    ),
                                                  ),
                                                ],
                                              ).paddingAll(10),
                                            ),
                                            if (controller.selected == 3) ...[
                                              const Positioned(
                                                top: 6,
                                                left: 6,
                                                child: Icon(
                                                  Icons.check_circle,
                                                  size: 20,
                                                  color: Colors.blueAccent,
                                                ),
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              const Row(
                                children: [
                                  Text(
                                    "UPI ID",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(width: 6),
                                  Icon(Icons.info_outline, size: 15, color: Colors.blueAccent),
                                ],
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                onChanged: controller.validateUpi,
                                enabled: controller.selected != null,
                                decoration: const InputDecoration(
                                  isDense: true,
                                  hintText: "Enter UPI ID (name@upiid)",
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  const Expanded(
                                    child: Divider(
                                      height: 1,
                                      thickness: 1,
                                      color: Colors.black12,
                                      indent: 10,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.black12,
                                    ),
                                    child: const Text(
                                      "OR",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black87,
                                      ),
                                    ).paddingAll(6),
                                  ).paddingAll(6),
                                  const Expanded(
                                    child: Divider(
                                      height: 1,
                                      thickness: 1,
                                      color: Colors.black12,
                                      endIndent: 10,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Material(
                                borderRadius: BorderRadius.circular(16),
                                color: const Color(0xffedf2f8),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(16),
                                  onTap: () {},
                                  child: Center(
                                    child: const Column(
                                      children: [
                                        Icon(
                                          Icons.qr_code_scanner,
                                          size: 30,
                                          color: Colors.black54,
                                        ),
                                        SizedBox(height: 6),
                                        Text(
                                          "Pay by QR Code",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ).paddingAll(10),
                                  ),
                                ),
                              ),
                            ],
                          ).paddingAll(10),
                        ).paddingAll(16),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Obx(
                    () => ElevatedButton(
                      onPressed: controller.verified.value ? controller.onPay : null,
                      child: const Text(
                        "Pay",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      ).paddingAll(16),
                    ),
                  ),
                ).paddingAll(16),
              ],
            ),
          ),
        );
      },
    );
  }
}

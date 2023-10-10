import 'package:doordash/payment/payment_controller.dart';
import 'package:doordash/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.grey.shade200,
          body: SafeArea(
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
                            "Payment Options",
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
                      ).paddingOnly(top: 6),
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
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/card.svg",
                              width: 50,
                              height: 50,
                              colorFilter: const ColorFilter.mode(Colors.orangeAccent, BlendMode.srcIn),
                            ),
                            const SizedBox(width: 16),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Credit/Debit Card",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Choose your Credit/Debit Card",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const Expanded(child: SizedBox()),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            ).paddingOnly(right: 10),
                          ],
                        ).paddingAll(10),
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.black26,
                          indent: 20,
                          endIndent: 20,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/bank.svg",
                              width: 50,
                              height: 50,
                              colorFilter: const ColorFilter.mode(Colors.orangeAccent, BlendMode.srcIn),
                            ),
                            const SizedBox(width: 16),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Net Banking",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Choose your Bank Account",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const Expanded(child: SizedBox()),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            ).paddingOnly(right: 10),
                          ],
                        ).paddingAll(10),
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.black26,
                          indent: 20,
                          endIndent: 20,
                        ),
                        Material(
                          color: Colors.white,
                          child: InkWell(
                            onTap: controller.onUpiPay,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/upi.svg",
                                  width: 50,
                                  height: 50,
                                  colorFilter: const ColorFilter.mode(Colors.orangeAccent, BlendMode.srcIn),
                                ),
                                const SizedBox(width: 16),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "UPI",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "Use your GPay, Paytm & more",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                const Expanded(child: SizedBox()),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                ).paddingOnly(right: 10),
                              ],
                            ).paddingAll(10),
                          ),
                        ),
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.black26,
                          indent: 20,
                          endIndent: 20,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/wallet.svg",
                              width: 50,
                              height: 50,
                              colorFilter: const ColorFilter.mode(Colors.orangeAccent, BlendMode.srcIn),
                            ),
                            const SizedBox(width: 16),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Wallet",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Samsung pay/Apple pay/Payit",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const Expanded(child: SizedBox()),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            ).paddingOnly(right: 10),
                          ],
                        ).paddingAll(10),
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.black26,
                          indent: 20,
                          endIndent: 20,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.repeat, size: 50, color: Colors.orangeAccent),
                            const SizedBox(width: 16),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pay Later",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "LazyPay lets you pay later",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const Expanded(child: SizedBox()),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            ).paddingOnly(right: 10),
                          ],
                        ).paddingAll(10),
                      ],
                    ),
                  ).paddingAll(16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:doordash/upi_pin/upi_pin_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class UpiPinPage extends StatelessWidget {
  const UpiPinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpiPinController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "HDFC Bank",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ).paddingOnly(left: 6),
                    Image.asset("assets/upi-full.png", height: 40),
                  ],
                ).paddingAll(10),
                Container(
                  width: double.infinity,
                  color: const Color(0xff192a69),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "XXXXXX6061",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        "₹ ${controller.amount}.00",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Icon(Icons.keyboard_arrow_down, size: 20, color: Colors.white),
                    ],
                  ).paddingSymmetric(horizontal: 10, vertical: 8),
                ),
                const SizedBox(height: 100),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "ENTER UPI PIN",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(width: 60),
                    Icon(Icons.remove_red_eye, size: 25, color: Color(0xff192a69)),
                    SizedBox(width: 8),
                    Text(
                      "SHOW",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff192a69),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Pinput(
                  onSubmitted: controller.onSubmit,
                  closeKeyboardWhenCompleted: false,
                  defaultPinTheme: const PinTheme(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(),
                      textStyle: TextStyle(
                        fontSize: 50,
                      )
                  ),
                  obscureText: true,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  pinAnimationType: PinAnimationType.slide,
                  preFilledWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 50,
                        height: 2,
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ],
                  ),
                  cursor: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 50,
                        height: 2,
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}

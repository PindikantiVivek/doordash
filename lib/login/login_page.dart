import 'package:doordash/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const Text(
                "Welcome to DoorDash",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
              ).paddingSymmetric(vertical: 50),
              const Text(
                "Enter your mobile number to get OTP",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
              TextField(
                controller: controller.mobile,
                onChanged: controller.validateMobile,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
                decoration: const InputDecoration(label: Text("Mobile Number"), prefixText: "+91"),
              ).paddingSymmetric(vertical: 16),
              RichText(
                text: const TextSpan(
                  text: "By clicking, I accept the ",
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                  children: [
                    TextSpan(
                      text: "terms of service",
                      style: TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: " and ",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    TextSpan(
                      text: "privacy policy",
                      style: TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: Obx(
                  () => ElevatedButton(
                    onPressed: controller.valid.value ? controller.onSubmit : null,
                    child: const Text(
                      "Get OTP",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ).paddingAll(16),
                  ),
                ),
              ),
            ],
          ).paddingAll(16),
        ),
      );
    });
  }
}

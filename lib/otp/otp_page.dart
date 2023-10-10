import 'package:doordash/otp/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back),
                ),
                Text(
                  "Verify with OTP sent to \n+91 ${controller.mobile}",
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500, height: 1.5),
                ).paddingSymmetric(horizontal: 16),
                Align(
                  alignment: Alignment.center,
                  child: Pinput(
                    length: 6,
                    onChanged: controller.validateOtp,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    defaultPinTheme: PinTheme(
                      width: 45,
                      height: 50,
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.orangeAccent),
                      ),
                    ),
                  ).paddingAll(16),
                ),
                Obx(() {
                  if (controller.time.value != 0) {
                    String time = controller.time.value.toString();
                    if (time.length == 1) {
                      time = "0$time";
                    }
                    return Text(
                      "Didn't receive it? Retry in 00:$time",
                      style: const TextStyle(fontSize: 14, color: Colors.black54),
                    );
                  }
                  return InkWell(
                    onTap: controller.onResend,
                    child: const Text(
                      "Resend",
                      style: TextStyle(color: Colors.orangeAccent),
                    ),
                  );
                }).paddingSymmetric(horizontal: 16),
                SizedBox(
                  width: double.infinity,
                  child: Obx(
                        () => ElevatedButton(
                      onPressed: controller.valid.value ? controller.onSubmit : null,
                      child: const Text(
                        "Continue",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      ).paddingAll(16),
                    ).paddingAll(16),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'dart:async';

import 'package:doordash/utils/hive_storage.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  late String mobile;
  final time = 20.obs;
  final valid = false.obs;

  @override
  void onInit() {
    super.onInit();
    mobile = Get.arguments["mobile"];
    Future.delayed(Duration.zero, () => startTimer());
  }

  startTimer() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        time.value--;
        if(time.value == 0) {
          timer.cancel();
        }
      },
    );
  }

  onResend() {
    time.value = 20;
    startTimer();
  }

  validateOtp(String otp) {
    if(otp.length == 6) {
      valid.value = true;
    } else {
      valid.value = false;
    }
  }

  onSubmit() {
    HiveStorage.instance.hive.put("login", true);
    Get.offAllNamed("/home");
  }
}

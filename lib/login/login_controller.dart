import 'package:doordash/utils/hive_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController mobile = TextEditingController();
  final valid = false.obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero, () async {
      await HiveStorage.instance.hiveInit();
      if (HiveStorage.instance.hive.get("login") ?? false) {
        Get.offAllNamed("/home");
      }
    });
  }

  validateMobile(String number) {
    if (RegExp(r"^[0-9]{10}$").hasMatch(number)) {
      valid.value = true;
    } else {
      valid.value = false;
    }
  }

  onSubmit() {
    Get.toNamed(
      "/otp",
      arguments: {
        "mobile": mobile.text,
      },
    );
  }
}

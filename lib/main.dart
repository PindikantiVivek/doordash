import 'package:doordash/cart/cart_binding.dart';
import 'package:doordash/cart/cart_page.dart';
import 'package:doordash/home/home_binding.dart';
import 'package:doordash/home/home_page.dart';
import 'package:doordash/login/login_binding.dart';
import 'package:doordash/login/login_page.dart';
import 'package:doordash/otp/otp_binding.dart';
import 'package:doordash/otp/otp_page.dart';
import 'package:doordash/payment/payment_binding.dart';
import 'package:doordash/payment/payment_page.dart';
import 'package:doordash/restaurant_menu/restaurant_menu_binding.dart';
import 'package:doordash/restaurant_menu/restaurant_menu_page.dart';
import 'package:doordash/upi_pay/upi_pay_binding.dart';
import 'package:doordash/upi_pay/upi_pay_page.dart';
import 'package:doordash/upi_pin/upi_pin_binding.dart';
import 'package:doordash/upi_pin/upi_pin_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'DoorDash',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(primary: Colors.orangeAccent),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: "/login", page: () => const LoginPage(), binding: LoginBinding()),
        GetPage(name: "/otp", page: () => const OtpPage(), binding: OtpBinding()),
        GetPage(name: "/home", page: () => const HomePage(), binding: HomeBinding()),
        GetPage(name: "/restaurant-menu", page: () => const RestaurantMenuPage(), binding: RestaurantMenuBinding()),
        GetPage(name: "/cart", page: () => const CartPage(), binding: CartBinding()),
        GetPage(name: "/payment", page: () => const PaymentPage(), binding: PaymentBinding()),
        GetPage(name: "/upi-pay", page: () => const UpiPayPage(), binding: UpiPayBinding()),
        GetPage(name: "/upi-pin", page: () => const UpiPinPage(), binding: UpiPinBinding()),
      ],
      initialRoute: "/login",
    );
  }
}

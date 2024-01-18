import 'dart:async';

import 'package:get/get.dart';

import '../Auth_Page/LoginPage.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    Timer(const Duration(seconds: 2), () {
      Get.off(() => const LoginScreen());
    });
  }
}

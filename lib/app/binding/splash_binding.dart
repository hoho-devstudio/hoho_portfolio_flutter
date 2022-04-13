import 'package:get/get.dart';
import 'package:hoho_portfolio_flutter/app/controller/splash_controller.dart';

class SplashBinding implements Bindings {

  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }

}
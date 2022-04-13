import 'package:get/get.dart';
import 'package:hoho_portfolio_flutter/app/controller/main_controller.dart';

class MainBinding implements Bindings {

  @override
  void dependencies() {
    Get.put<MainController>(MainController());
  }

}
import 'package:get/get.dart';
import 'package:hoho_portfolio_flutter/app/binding/main_binding.dart';

import '../dev/ground_view.dart';
import '../ui/view/main_view.dart';
import '../ui/view/splah_view.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    /// dev
    GetPage(name: Routes.initial, page: () => GroundView()),

    /// release
    GetPage(name: Routes.main, page: () => MainView(), binding: MainBinding()),
  ];
}
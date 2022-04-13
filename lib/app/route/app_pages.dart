import 'package:get/get.dart';
import 'package:hoho_portfolio_flutter/app/binding/main_binding.dart';

import '../ui/view/main_view.dart';
import '../ui/widget/kakaobank_widget.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    /// dev
    GetPage(name: Routes.ground, page: () => KakaoBankWidget(), binding: MainBinding()),

    /// release
    GetPage(name: Routes.main, page: () => MainView(), binding: MainBinding()),
  ];
}
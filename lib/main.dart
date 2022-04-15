import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/route/app_pages.dart';
import 'app/ui/theme/app_theme.dart';
import 'app/util/app_scroll_behavior.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: Routes.ground,
    debugShowCheckedModeBanner: false,
    theme: appThemeData,
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
    scrollBehavior: AppScrollBehavior(),
  ));
}



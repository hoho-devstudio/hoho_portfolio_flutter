import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/route/app_pages.dart';
import 'app/ui/theme/app_theme.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: Routes.main,
    debugShowCheckedModeBanner: false,
    theme: appThemeData,
    defaultTransition: Transition.fadeIn,
    getPages: AppPages.pages,
  ));
}



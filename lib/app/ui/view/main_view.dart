import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_portfolio_flutter/app/controller/main_controller.dart';
import 'package:hoho_portfolio_flutter/app/ui/widget/main/splah_widget.dart';
import 'package:hoho_portfolio_flutter/app/ui/widget/kakaobank/kakaobank_widget.dart';

import '../widget/main/aboutme_widget.dart';
import '../widget/main/contact_widget.dart';
import '../widget/main/home_widget.dart';
import '../widget/main/project_widget.dart';
import '../widget/main/navigation_widget.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              color: Colors.white,
              child: Obx(() {
                return ListView(
                  controller: controller.scrollerController,
                  physics: controller.scrollerIsAble? AlwaysScrollableScrollPhysics() : NeverScrollableScrollPhysics(),
                  children: [
                    HomeWidget(),
                    AboutMeWidget(),
                    ProjectWidget(),
                    KakaoBankWidget(),
                    ContactWidget(),
                  ],
                );
              })
            ),
            NavigationWidget(),
            SplashWidget()
          ],
        )
    );
  }

}

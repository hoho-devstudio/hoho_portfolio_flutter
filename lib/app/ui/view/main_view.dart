import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_portfolio_flutter/app/controller/main_controller.dart';
import 'package:hoho_portfolio_flutter/app/ui/widget/splah_widget.dart';
import 'package:hoho_portfolio_flutter/app/ui/widget/kakaobank_widget.dart';

import '../widget/aboutme_widget.dart';
import '../widget/contact_widget.dart';
import '../widget/home_widget.dart';
import '../widget/project_widget.dart';
import '../widget/navigation_widget.dart';

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
              child: ListView(
                controller: controller.scrollerController,
                children: [
                  HomeWidget(),
                  AboutMeWidget(),
                  ProjectWidget(),
                  KakaoBankWidget(),
                  ContactWidget(),
                ],
              ),
            ),
            NavigationWidget(),
            SplashWidget()
          ],
        )
    );
  }

}

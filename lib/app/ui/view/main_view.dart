import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_portfolio_flutter/app/controller/main_controller.dart';
import 'package:hoho_portfolio_flutter/app/ui/widget/main_view_kakaobank_widget.dart';

import '../widget/main_view_aboutme_widget.dart';
import '../widget/main_view_contact_widget.dart';
import '../widget/main_view_home_widget.dart';
import '../widget/main_view_project_widget.dart';
import '../widget/main_view_top_widget.dart';

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
                  MainViewHomeWidget(),
                  MainViewAboutMeWidget(),
                  MainViewProjectWidget(),
                  MainViewKakaoBankWidget(),
                  MainViewContactWidget(),
                ],
              ),
            ),
            MainViewTopWidget()
          ],
        )
    );
  }

}

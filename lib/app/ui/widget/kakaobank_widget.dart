import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_portfolio_flutter/app/controller/main_controller.dart';
import 'package:hoho_portfolio_flutter/app/ui/widget/kakaobank_user_widget.dart';

class KakaoBankWidget extends GetView<MainController> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: controller.pageHeight[3].toDouble(),
      color: const Color(0xfff9f9f9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 400,
            height: 800,
            decoration: BoxDecoration(
              color: const Color (0xff2e344d),
              border: Border.all(width: 0.1)
            ),
            child: MaterialApp(
              theme: ThemeData(
                primaryColor: const Color(0xff2e344d),
                fontFamily: 'Noto',
              ),
              home: DefaultTabController(
                length: 4,
                child: Scaffold(
                  // appBar: AppBar(
                  //   title: Text('kakao bank'),
                  //   backgroundColor: const Color(0xff2e344d),
                  // ),
                  bottomNavigationBar: TabBar(
                    controller: controller.kbTabController,
                    tabs: [
                      Tab(icon: Obx(() {
                        return controller.kbTabIndex == 0? Icon(Icons.person, color: Color(0xff1f1f1f), size: 29) : Icon(Icons.person, color: Color(0xffb2b2b2), size: 29);
                      })),
                      Tab(icon: Obx(() {
                        return controller.kbTabIndex == 1? Icon(Icons.grid_view, color: Color(0xff1f1f1f), size: 29) : Icon(Icons.grid_view, color: Color(0xffb2b2b2), size: 29);
                      })),
                      Tab(icon: Obx(() {
                        return controller.kbTabIndex == 2? Icon(Icons.notifications, color: Color(0xff1f1f1f), size: 29) : Icon(Icons.notifications, color: Color(0xffb2b2b2), size: 29);
                      })),
                      Tab(icon: Obx(() {
                        return controller.kbTabIndex == 3? Icon(Icons.more_horiz, color: Color(0xff1f1f1f), size: 29) : Icon(Icons.more_horiz, color: Color(0xffb2b2b2), size: 29);
                      })),
                    ],
                    indicatorColor: Colors.transparent,
                  ),
                  body: TabBarView(
                    controller: controller.kbTabController,
                    children: [
                      KakaoBankUserWidget(),
                      Placeholder(),
                      Placeholder(),
                      Placeholder(),
                    ],
                  ),
                ),
              ),
            )
          ),
        ],
      ),
    );
  }


}
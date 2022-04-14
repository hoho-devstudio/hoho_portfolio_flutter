import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_portfolio_flutter/app/controller/main_controller.dart';
import 'package:hoho_portfolio_flutter/app/ui/widget/kakaobank/kakaobank_item_widget.dart';
import 'package:hoho_portfolio_flutter/app/ui/widget/kakaobank/kakaobank_user_widget.dart';
import 'package:timer_builder/timer_builder.dart';

class KakaoBankWidget extends GetView<MainController> {

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();

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
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: const Color(0xff2e344d),
                fontFamily: 'Noto',
              ),
              home: Scaffold(
                body: Column(
                  children: [
                    Container(
                      height: 25,
                      padding: EdgeInsets.only(left: 12, right: 6),
                      color: const Color(0xff2e344d),
                      child: Row(
                        children: [
                          TimerBuilder.periodic(
                            const Duration(minutes: 1),
                            builder: (context) {
                              return Text('SKT ' +
                                formatDate(DateTime.now(), [h, ':', nn]),
                                style: const TextStyle(color: Colors.white),
                              );
                            },
                          ),
                          Spacer(),
                          Icon(Icons.five_g, size: 16, color: Colors.white,),
                          Icon(Icons.bluetooth, size: 16, color: Colors.white,),
                          Icon(Icons.access_alarm, size: 16, color: Colors.white,),
                          Icon(Icons.volume_off, size: 16, color: Colors.white,),
                          Icon(Icons.wifi, size: 16, color: Colors.white,),
                          Icon(Icons.signal_cellular_alt, size: 16, color: Colors.white,),
                          Icon(Icons.battery_charging_full, size: 16, color: Colors.white,),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          DefaultTabController(
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
                                  KakaoBankItemWidget(),
                                  Placeholder(),
                                  Placeholder(),
                                ],
                              ),
                            ),
                          ),
                          // KakaoBankSplashWidget()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ),
        ],
      ),
    );
  }


}
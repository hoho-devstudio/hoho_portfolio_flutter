import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_portfolio_flutter/app/controller/main_controller.dart';
import 'package:hoho_portfolio_flutter/app/ui/theme/app_colors.dart';
import 'package:hoho_portfolio_flutter/app/ui/widget/kakaobank/kakaobank_info_widget.dart';
import 'package:hoho_portfolio_flutter/app/ui/widget/kakaobank/kakaobank_item_widget.dart';
import 'package:hoho_portfolio_flutter/app/ui/widget/kakaobank/kakaobank_noti_widget.dart';
import 'package:hoho_portfolio_flutter/app/ui/widget/kakaobank/kakaobank_user_widget.dart';
import 'package:hoho_portfolio_flutter/app/util/keep_alive_wrap.dart';
import 'package:timer_builder/timer_builder.dart';

import '../../../util/app_scroll_behavior.dart';
import 'kakaobank_login_widget.dart';

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
              border: Border.all(width: 1, color: Colors.black.withOpacity(0.1)),
            ),
            child: MaterialApp(
              scrollBehavior: AppScrollBehavior(),
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: const Color(0xff2e344d),
                fontFamily: 'Noto',
              ),
              home: Scaffold(
                body: Column(
                  children: [
                    Obx(() {
                      return Container(
                        height: 26,
                        padding: EdgeInsets.only(left: 12, right: 6),
                        color: controller.loginView? colorYellow : const Color(0xff2e344d),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TimerBuilder.periodic(
                              const Duration(minutes: 1),
                              builder: (context) {
                                return Text('SKT ' +
                                    formatDate(DateTime.now(), [h, ':', nn]),
                                  style: TextStyle(color: controller.loginView? colorBlack : Colors.white),
                                );
                              },
                            ),
                            Spacer(),
                            Icon(Icons.five_g, size: 16, color: controller.loginView? colorBlack : Colors.white,),
                            Icon(Icons.bluetooth, size: 16, color: controller.loginView? colorBlack : Colors.white,),
                            Icon(Icons.access_alarm, size: 14, color: controller.loginView? colorBlack : Colors.white,),
                            SizedBox(width: 2,),
                            Icon(Icons.volume_off, size: 16, color: controller.loginView? colorBlack : Colors.white,),
                            SizedBox(width: 2,),
                            Icon(Icons.wifi, size: 16, color: controller.loginView? colorBlack : Colors.white,),
                            Icon(Icons.signal_cellular_alt, size: 16, color: controller.loginView? colorBlack : Colors.white,),
                            Icon(Icons.battery_charging_full, size: 16, color: controller.loginView? colorBlack : Colors.white,),
                            // TextButton(onPressed: () {
                            //   controller.loginView = true;
                            // }, child: Text('logout', style: TextStyle(color: controller.loginView? colorBlack : Colors.white),))
                          ],
                        ),
                      );
                    }),
                    Expanded(
                      child: Stack(
                        children: [
                          Obx(() {
                            return AnimatedPositioned(
                              duration: Duration(milliseconds: 200),
                              right: 0,
                              left: 0,
                              top: controller.loginView? 774 : 0,
                              bottom: controller.loginView? -774 : 0,
                              child: DefaultTabController(
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
                                      KeepAliveWrapper(child: KakaoBankUserWidget()),
                                      KeepAliveWrapper(child: KakaoBankItemWidget()),
                                      KeepAliveWrapper(child: KakaoBankNotiWidget()),
                                      KeepAliveWrapper(child: KakaoBankInfoWidget()),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                          KakaoBankLoginWidget()
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
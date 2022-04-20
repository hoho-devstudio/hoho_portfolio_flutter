import 'dart:ui';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_portfolio_flutter/app/controller/main_controller.dart';
import 'package:hoho_portfolio_flutter/app/util/util.dart';

import '../../theme/app_colors.dart';


class KakaoBankPushWidget extends GetView<MainController> {

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        child: AnimatedPositioned(
          curve: Curves.ease,
          duration: Duration(milliseconds: 600),
          right: 2,
          left: 2,
          top: controller.pushView? 30 : -127,
          bottom: controller.pushView? 663 : 820,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: TextButton(
              style: TextButton.styleFrom(primary: Colors.black),
              onPressed: () {
                controller.pushView = !controller.pushView;
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    color: Colors.white.withOpacity(0.7),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          child: Container(
                            child: Container(
                              padding: EdgeInsets.only(left: 2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 8),
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                              width: 28,
                                              height: 28,
                                              decoration: BoxDecoration(
                                                color: colorYellow,
                                                borderRadius: BorderRadius.circular(7)
                                              ),
                                            ),
                                            Image(
                                              width: 12,
                                              height: 12,
                                              image: AssetImage('assets/images/kakaobank_icon_m.png'),
                                            )
                                          ],
                                        ),
                                      ),
                                      Text('카카오뱅크', style: TextStyle(fontSize: 18)),
                                    ],
                                  ),
                                  SizedBox(height: 12,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2),
                                    child: Text('김*호(4567) ${formatDate(DateTime.now(), [m, '/', d, ' ', h, ':', nn])}', style: TextStyle(fontSize: 16),),
                                  ),
                                  SizedBox(height: 5,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2),
                                    child: Text('입금 ${Util.numberFormat(controller.kbUserMoneyPush)}원', style: TextStyle(fontSize: 15)),
                                  ),
                                ],
                              )
                            ),
                          ),
                        ),
                      ],
                    ),
                    ),
                ),
              ),
            ),
          ),
          ),
      );
    });

  }

}
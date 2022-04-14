import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_portfolio_flutter/app/controller/main_controller.dart';
import '../../theme/app_colors.dart';


class KakaoBankSplashWidget extends GetView<MainController> {

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return IgnorePointer(
        ignoring: controller.splashView? false : true,
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          opacity: controller.splashView? 1.0 : 0.0,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: colorYellow,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(height: 150,),
                    Image(
                        width: 50,
                        image: AssetImage('assets/images/kakaobank_icon.png')
                    ),
                    Spacer(),
                    Container(
                        width: 220,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.black26.withOpacity(0.1),

                        ),
                        child: TextButton(onPressed: () {
                          controller.loginProgress = true;
                          Future.delayed(Duration(milliseconds: 1300), () {
                            controller.loginProgress = false;
                            controller.splashView = false;
                          });
                        }, child: Text('로그인', style: TextStyle(color: Colors.black, fontFamily: 'Jua', fontSize: 18),))
                    ),
                    SizedBox(height: 100,)
                  ],
                ),
                Obx(() {
                  return controller.loginProgress? CircularProgressIndicator() : Container();
                })
              ],
            ),
          ),
        ),
      );
    });
  }

}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_portfolio_flutter/app/controller/main_controller.dart';
import '../../theme/app_colors.dart';


class KakaoBankSplashWidget extends GetView<MainController> {

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return IgnorePointer(
        ignoring: controller.loginView? false : true,
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 300),
          opacity: controller.loginView? 1.0 : 0.0,
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
                        width: 280,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.black12.withOpacity(0.1),

                        ),
                        child: TextButton(onPressed: () {
                          controller.loginProgress = true;
                          Future.delayed(Duration(milliseconds: 1300), () {
                            controller.loginProgress = false;
                            controller.loginView = false;
                          });
                        }, child: Text('로그인', style: TextStyle(color: Colors.black, fontFamily: 'Noto', fontSize: 12, fontWeight: FontWeight.bold),))
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
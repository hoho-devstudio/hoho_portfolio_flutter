import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:hoho_portfolio_flutter/app/controller/main_controller.dart';

class SplashWidget extends GetView<MainController> {

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Obx(() {
        return AnimatedOpacity(
          duration: Duration(milliseconds: 1500),
          opacity: controller.splashView? 1.0 : 0.0,
          child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 1500),
                opacity: controller.splashText? 1.0 : 0.0,
                child: Center(
                  child: SizedBox(
                    height: 50,
                    child: DefaultTextStyle(
                      style: const TextStyle(
                          fontSize: 38,
                          fontFamily: 'Nanum',
                          color: Colors.black
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText('만나서 반가워요!',
                              speed: const Duration(milliseconds: 150)),
                        ],
                        totalRepeatCount: 1,
                        onFinished: () {
                          controller.splashText = false;
                          Future.delayed(const Duration(milliseconds: 2000), () {
                            controller.splashView = false;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              )
          ),
        );
      }),
    );
  }
}

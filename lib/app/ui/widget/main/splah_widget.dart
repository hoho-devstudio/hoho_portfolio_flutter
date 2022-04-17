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
          duration: Duration(milliseconds: 300),
          opacity: controller.splashView? 1.0 : 0.0,
          child: Container(
              width: double.infinity,
              height: double.infinity,
              color: const Color(0xff2e344d),
              child: controller.splashStart? AnimatedOpacity(
                duration: Duration(milliseconds: 800),
                opacity: controller.splashText? 1.0 : 0.0,
                child: Center(
                  child: SizedBox(
                    height: 50,
                    child: DefaultTextStyle(
                      style: const TextStyle(
                          fontSize: 38,
                          fontFamily: 'Nanum',
                          color: Colors.white
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText('만나서 반가워요!',
                              speed: const Duration(milliseconds: 150)),
                        ],
                        totalRepeatCount: 1,
                        onFinished: () {
                          controller.splashText = false;
                          Future.delayed(const Duration(milliseconds: 1500), () {
                            controller.splashView = false;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ) : Container()
          ),
        );
      }),
    );
  }
}

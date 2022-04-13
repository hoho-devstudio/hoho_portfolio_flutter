import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../../controller/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        duration: Duration(seconds: 1),
        opacity: 1.0,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Obx(() {
            return AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: controller.isFinished? 0.0 : 1.0,
              child: Center(
                child: SizedBox(
                  height: 50,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                        fontSize: 38,
                        fontFamily: 'NanumGothic',
                        color: Colors.black
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText('만나서 반가워요!',
                            speed: const Duration(milliseconds: 150)),
                      ],
                      totalRepeatCount: 1,
                      onFinished: () {
                        controller.isFinished = true;
                        Future.delayed(const Duration(milliseconds: 1500), () {
                          Get.offNamed('/main');
                        });
                      },
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      )
    );
  }
}

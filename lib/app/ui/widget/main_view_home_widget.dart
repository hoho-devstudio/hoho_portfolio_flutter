import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_portfolio_flutter/app/controller/main_controller.dart';

class MainViewHomeWidget extends GetView<MainController> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: controller.pageHeight[0].toDouble(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 80),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Obx(() {
                  return Opacity(
                      opacity: controller.offsetHoho ? 1.0 : 0.0,
                      child: const Text('hoho\'s portfolio',
                        style: const TextStyle(fontSize: 25),)
                  );
                }),
                Obx(() {
                  return !controller.splashText? AnimatedOpacity(
                      duration: const Duration(milliseconds: 500),
                      opacity: controller.offsetTop ? 1.0 : 0.0,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'Jua',
                            color: Colors.black
                        ),
                        textAlign: TextAlign.start,
                        child: AnimatedTextKit(
                          animatedTexts: [
                            WavyAnimatedText(
                                'hoho.devstudio@gmail.com'),
                          ],
                          isRepeatingAnimation: true,
                        ),
                      )
                  ) : Container();
                })
              ],
            ),
            const SizedBox(height: 250,),
            Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 5,
                      color: Colors.black
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(8.0))
              ),
              child: const Center(
                  child: const Text('hoho', style: const TextStyle(
                      fontSize: 65,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow),)
              ),
            ),
            const SizedBox(height: 20,),
            const Text('Developer KIM JIHO', style: TextStyle(fontSize: 22),),
            const SizedBox(height: 100,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text('안녕하세요 ', style: TextStyle(fontSize: 16),),
                Obx(() {
                  return AnimatedRotation(
                    turns: controller.turns,
                    duration: Duration(milliseconds: 160),
                    child: Text(
                      '👋', style: TextStyle(fontSize: 24),),
                    onEnd: controller.changeRotation,
                  );
                })
              ],
            ),
            const SizedBox(height: 8,),
            const Text(
              'Android와 iOS개발을 주로하며 flutter를 사용한 크로스플랫폼 개발도 하고 있습니다.',
              style: TextStyle(fontSize: 16),),
          ],
        ),
      ),
    );
  }

}
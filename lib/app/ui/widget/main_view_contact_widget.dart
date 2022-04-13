import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_portfolio_flutter/app/controller/main_controller.dart';

class MainViewContactWidget extends GetView<MainController> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: controller.pageHeight[4].toDouble(),
      color: const Color(0xfff9f9f9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 70),
          const Text('💌  함께 나누고 싶은 얘기가 있으시다면',
              style: const TextStyle(fontSize: 22)),
          const SizedBox(height: 60),
          const Text('hoho.devstudio@gmail.com',
              style: const TextStyle(fontSize: 62)),
          const SizedBox(height: 20),
          const Text('어떤 내용이여도 좋아요! 메일을 보내주시면 답장을 드릴게요.',
              style: const TextStyle(
                  fontSize: 16, color: Colors.black26)),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 30, right: 40),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Text('© 2022 hoho studio',
                  style: const TextStyle(color: Colors.grey),),
                Container(
                    alignment: Alignment.centerRight,
                    child: const Text('Made By hoho with 💛💛💛')),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_portfolio_flutter/app/controller/main_controller.dart';

class ContactWidget extends GetView<MainController> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: controller.pageHeight[4].toDouble(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 70),
          const Text('π  ν¨κ» λλκ³  μΆμ μκΈ°κ° μμΌμλ€λ©΄',
              style: const TextStyle(fontSize: 22)),
          const SizedBox(height: 60),
          const Text('hoho.devstudio@gmail.com',
              style: const TextStyle(fontSize: 62)),
          const SizedBox(height: 20),
          const Text('μ΄λ€ λ΄μ©μ΄μ¬λ μ’μμ! λ©μΌμ λ³΄λ΄μ£Όμλ©΄ λ΅μ₯μ λλ¦΄κ²μ.',
              style: const TextStyle(
                  fontSize: 16, color: Colors.black26)),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 30, right: 40),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Text('Β© 2022 hoho studio',
                  style: const TextStyle(color: Colors.grey),),
                Container(
                    alignment: Alignment.centerRight,
                    child: const Text('Made By hoho with πππ')),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
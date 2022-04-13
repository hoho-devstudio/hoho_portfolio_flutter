import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_portfolio_flutter/app/controller/main_controller.dart';

class MainViewKakaoBankWidget extends GetView<MainController> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: controller.pageHeight[3].toDouble(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 100),
          Text('test', style: TextStyle(fontSize: 22)),
          SizedBox(height: 60),
        ],
      ),
    );
  }

}
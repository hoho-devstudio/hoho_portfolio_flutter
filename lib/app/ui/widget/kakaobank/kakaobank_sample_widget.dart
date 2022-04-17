import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_portfolio_flutter/app/controller/main_controller.dart';
import '../../theme/app_colors.dart';


class KakaoBankSampleWidget extends GetView<MainController> {

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnimatedPositioned(
        curve: Curves.ease,
        duration: Duration(milliseconds: 300),
        right: 0,
        left: 0,
        top: controller.sampleView? 0 : 774,
        bottom: controller.sampleView? 0 : -774,
        child: Container(
          // color: const Color(0xff2e344d),
          color: Colors.white,
          child: Stack(
            children: [
              Container(
                height: 80,
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Container(
                  child: Container(
                    child: Row(
                      children: [
                        IconButton(onPressed: () {
                          controller.sampleView = false;
                        }, icon: Icon(Icons.arrow_back, size: 22,)),
                        Text(controller.sampleText, style: TextStyle(fontSize: 26, fontFamily: 'Day')),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  // color: Colors.white,
                  height: double.infinity,
                  // child: Text('empty', style: TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'Jua'),),
                  child: Image(
                    image: AssetImage('assets/images/kb_sample.gif'),
                    height: 120,
                  ),
                ),
              )
            ],
          ),
          ),
        );
    });

  }

}
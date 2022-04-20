import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_portfolio_flutter/app/controller/main_controller.dart';


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
          child: Column(
            children: [
              Container(
                height: 80,
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Container(
                  child: Container(
                    child: Row(
                      children: [
                        // IconButton(onPressed: () {
                        //   controller.sampleView = false;
                        // }, icon: Icon(Icons.arrow_back, size: 22,)),
                        Container(
                          width: 60,
                          child: RawMaterialButton(
                            onPressed: () {
                              controller.sampleView = false;
                            },
                            shape: CircleBorder(),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Icon(Icons.arrow_back),
                            ),
                          ),
                        ),
                        SizedBox(width: 2,),
                        Text(controller.sampleText, style: TextStyle(fontSize: 26, fontFamily: 'Day')),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(bottom: 140),
                  alignment: Alignment.center,
                  // child: Text('empty', style: TextStyle(fontSize: 16, fontFamily: 'Jua'),),
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
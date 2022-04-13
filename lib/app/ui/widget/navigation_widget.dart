import 'package:flutter/material.dart';
import 'package:hoho_portfolio_flutter/app/controller/main_controller.dart';
import 'package:get/get.dart';

class NavigationWidget extends GetView<MainController> {

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Opacity(
        opacity: controller.offsetTop? 0.0 : 1.0,
        child: Container(
          width: double.infinity,
          height: 50,
          // color: Color(0x55ffffff),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Opacity(
                  opacity: controller.offsetHoho? 0.0 : 1.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 80),
                    child: const Text('hoho\'s portfolio', style: TextStyle(fontSize: 25),),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: TextButton(onPressed: () {
                  controller.scrollerController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.ease);
                }, child: Text('HOME', style: TextStyle(fontSize: 18, color: controller.page==0? Colors.black: Colors.black26),)),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: TextButton(onPressed: () {
                  controller.scrollerController.animateTo(controller.pageHeight[0].toDouble(), duration: const Duration(seconds: 1), curve: Curves.ease);
                }, child: Text('ABOUT ME', style: TextStyle(fontSize: 18, color: controller.page==1? Colors.black: Colors.black26),)),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: TextButton(onPressed: () {
                  controller.scrollerController.animateTo((controller.pageHeight[0]+controller.pageHeight[1].toDouble()), duration: const Duration(seconds: 1), curve: Curves.ease);
                }, child: Text('PROJECT', style: TextStyle(fontSize: 18, color: controller.page==2? Colors.black: Colors.black26),)),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: TextButton(onPressed: () {
                  controller.scrollerController.animateTo((controller.pageHeight[0]+controller.pageHeight[1]+controller.pageHeight[2].toDouble()), duration: const Duration(seconds: 1), curve: Curves.ease);
                }, child: Text('KAKAO BANK', style: TextStyle(fontSize: 18, color: controller.page==3? Colors.black: Colors.black26),)),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 80),
                child: TextButton(onPressed: () {
                  controller.scrollerController.animateTo((controller.pageHeight[0]+controller.pageHeight[1]+controller.pageHeight[2]+controller.pageHeight[3].toDouble()), duration: const Duration(seconds: 1), curve: Curves.ease);
                }, child: Text('CONTACT', style: TextStyle(fontSize: 18, color: controller.page==4? Colors.black: Colors.black26),)),
              ),
            ],
          ),
        ),
      );
    });
  }

}
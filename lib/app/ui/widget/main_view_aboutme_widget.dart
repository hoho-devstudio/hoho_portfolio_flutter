import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_portfolio_flutter/app/controller/main_controller.dart';

class MainViewAboutMeWidget extends GetView<MainController> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60),
      height: controller.pageHeight[1].toDouble(),
      color: const Color(0x10000000),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 230,
                height: 230,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white
                ),
              ),
              Container(
                width: 230,
                height: 230,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: const AssetImage('assets/images/jiho.jpg'
                        )
                    )
                ),
              ),
            ],
          ),
          const SizedBox(width: 40,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
              const Text('9년차 모바일 개발자 🧑💻', style: const TextStyle(fontSize: 20),),
              const SizedBox(height: 10,),
              const Text('김지호', style: TextStyle(fontSize: 20),),
              const SizedBox(height: 10,),
              Container(
                width: 250,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: const Color(0x11000000)
                    )
                ),
              )
            ],
          ),
          const SizedBox(width: 30,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 44,),
              const Text('이력', style: const TextStyle(fontSize: 20),),
              const SizedBox(height: 10,),
              Container(
                width: 350,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: const Color(0x11000000)
                    )
                ),
              ),
              const SizedBox(height: 20,),
              const Text('현) NICE비즈니스플랫폼 - Android, iOS 개발자',
                style: const TextStyle(fontSize: 15,
                    fontFamily: 'NanumGothic'),),
              const SizedBox(height: 10,),
              const Text(
                '전) NICE평가정보(파견) - Android 개발자', style: const TextStyle(
                  fontSize: 15, fontFamily: 'NanumGothic'),),
              const SizedBox(height: 10,),
              const Text(
                '전) 와이즈인프라코어 - Android 리드 개발자', style: const TextStyle(
                  fontSize: 15, fontFamily: 'NanumGothic'),),
              const SizedBox(height: 10,),
              const Text('전) 브레닉스 - Android 리드 개발자', style: const TextStyle(
                  fontSize: 15, fontFamily: 'NanumGothic'),),
              const SizedBox(height: 10,),
              const Text('전) 팬텍(파견) - 모바일 FW개발 연구원', style: const TextStyle(
                  fontSize: 15, fontFamily: 'NanumGothic'),),
            ],
          )
        ],
      ),
    );
  }

}
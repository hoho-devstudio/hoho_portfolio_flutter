import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/main_controller.dart';

class KakaoBankNotiWidget extends GetView<MainController> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Obx(() {
            return Container(
              height: controller.kbNotiTopHeight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              child: Text('알림', style: TextStyle(fontSize: controller.kbNotiTopTextSize, fontFamily: 'Day', fontWeight: FontWeight.bold))
            );
          }),
          Expanded(
            child: Stack(
              children: [
                ListView(
                  controller: controller.kbNotiScrollController,
                  children: [
                    SizedBox(height: 10,),
                    itemFirstWidget('오늘'),
                    itemWidget('kb_item_9.png', '김지호의 통장(4567)', '입금 100,000원', '1시간 전', true),
                    itemWidget('kb_item_9.png', '김지호의 통장(4567)', '출금 200,000원', '2시간 전', true),
                    SizedBox(height: 20,),
                    itemFirstWidget('이번 주'),
                    itemWidget('kb_item_10.png', '자동이체 등록 완료', '출금계좌(4567)에 오픈뱅킹 자동이체가 등록되었습니다.\n(신청기관명: 국민은행)', '4월 11일', false),
                    itemWidget('kb_item_10.png', '자동이체 등록 완료', '출금계좌(4567)에 펌뱅킹 자동이체가 등록되었습니다.\n(신청기관명: 국민은행)', '4월 11일', false),
                    itemWidget('kb_item_10.png', '체크카드(4567) 캐시백 입금', '03월 카드 결제금액에 대한 캐시백 10,000원이 입금되었습니다.\n· 기본캐시백 5,000원\n· 프로모션 캐시백 5,000원', '4월 11일', false),
                    SizedBox(height: 20,),
                    itemFirstWidget('이전 알림'),
                    itemWidget('kb_item_10.png', '간편이체 완료', '김*호님이 100,000원을 받으셨습니다.', '3월 24일', false),
                    itemWidget('kb_item_10.png', '체크카드(4567) 캐시백 입금', '02월 카드 결제금액에 대한 캐시백 10,000원이 입금되었습니다.\n· 기본캐시백 5,000원\n· 프로모션 캐시백 5,000원', '3월 10일', false),
                    itemWidget('kb_item_10.png', '체크카드(4567) 캐시백 입금', '01월 카드 결제금액에 대한 캐시백 10,000원이 입금되었습니다.\n· 기본캐시백 5,000원\n· 프로모션 캐시백 5,000원', '2월 10일', false),
                    SizedBox(height: 40,),
                    Center(child: Text('받은 알림은 90일동안 보관됩니다.', style: TextStyle(fontSize: 12, color: Colors.grey),)),
                    SizedBox(height: 60,),
                  ],
                ),
                Obx(() {
                  return controller.kbNotiTopHeight < 80? Container(
                    height: 0.2,
                    color: Colors.black.withOpacity(0.3),
                  ) : Container();
                })
              ],
            )
          ),
        ],
      ),
    );
  }

  Widget itemLine() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 0.3,
      color: Colors.black.withOpacity(0.3),
    );
  }

  Widget itemWidget(String image, String title, String content, String time, bool type) {
    return TextButton(
        style: TextButton.styleFrom(primary: Colors.black),
        onPressed: () {
          controller.sampleView = true;
          controller.sampleText = title;
        },
        child: Container(
          padding: EdgeInsets.only(top: 15, bottom: 18, left: 12, right: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: AssetImage('assets/images/$image'), width: 24),
              SizedBox(width: 12,),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                          SizedBox(height: 6,),
                          Text(content, style: TextStyle(fontSize: 14),),
                          SizedBox(height: 5,),
                          Text(time, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey),),
                          type? SizedBox(height: 16,) : Container(),
                          type? Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.black12.withOpacity(0.07),
                              ),
                              child: TextButton(
                                  style: TextButton.styleFrom(primary: Colors.black),
                                  onPressed: () { },
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 8, top: 10, bottom: 10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('더 보기', style: TextStyle(color: Colors.black, fontSize: 12),),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 1),
                                          child: Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 20,),
                                        )
                                      ],
                                    ),
                                  ))
                          ) : Container(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget itemFirstWidget(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      alignment: Alignment.centerLeft,
      child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

}
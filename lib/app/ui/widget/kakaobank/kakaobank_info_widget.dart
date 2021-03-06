import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/main_controller.dart';

class KakaoBankInfoWidget extends GetView<MainController> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Obx(() {
            return Column(
              children: [
                Container(
                  height: controller.kbInfoTopHeight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text('김지호', style: TextStyle(fontSize: controller.kbInfoTopTextSize, fontFamily: 'Day', fontWeight: FontWeight.bold)),
                      Icon(Icons.keyboard_arrow_right),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Text('앱설정', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
                      ),
                    ],
                  )
                ),
              ],
            );
          }),
          Expanded(
            child: Stack(
              children: [
                ListView(
                  controller: controller.kbInfoScrollController,
                  children: [
                    SizedBox(height: 10,),
                    itemLastWidget(true, 0xff1b3fab, false, '', '주택담보대출 최신 가전 이벤트', 'kb_item_11.png', 55),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          itemButtonWidget('kb_item_12.png', '고객센터', 30),
                          itemButtonWidget('kb_item_13.png', '인증/보안', 30),
                          itemButtonWidget('kb_item_14.png', '공지사항', 30),
                          itemButtonWidget('kb_item_15.png', '이벤트', 30),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    itemLine(),
                    SizedBox(height: 20,),
                    itemWidget('내 계좌'),
                    itemWidget('내 신용정보'),
                    itemWidget('휴면예금/보험금 찾기'),
                    SizedBox(height: 20,),
                    itemLine(),
                    SizedBox(height: 20,),
                    itemFirstWidget('이야기'),
                    itemWidget('돈이 되는 뉴스', titleType: 'UP'),
                    itemWidget('전문가가 말하는 주택 거래팁'),
                    itemWidget('내 집 마련 가이드'),
                    SizedBox(height: 20,),
                    itemLine(),
                    SizedBox(height: 20,),
                    itemFirstWidget('이체/출금'),
                    itemWidget('이체'),
                    itemWidget('다건이체'),
                    itemWidget('자동이체'),
                    itemWidget('이체내역 조회'),
                    itemWidget('ATM 스마트출금'),
                    SizedBox(height: 20,),
                    itemLine(),
                    SizedBox(height: 20,),
                    itemFirstWidget('해외송금'),
                    itemWidget('해외송금 보내기'),
                    itemWidget('해외송금 받기'),
                    itemWidget('해외송금 내역조회'),
                    itemWidget('거래외국환은행 지정'),
                    SizedBox(height: 20,),
                    itemLine(),
                    SizedBox(height: 20,),
                    itemFirstWidget('카드'),
                    itemWidget('내 카드'),
                    itemWidget('카드 이용내역'),
                    itemWidget('카드 혜택안내'),
                    SizedBox(height: 20,),
                    itemLine(),
                    SizedBox(height: 20,),
                    itemFirstWidget('제휴서비스'),
                    Obx(() {
                      return itemWidget('해외주식 투자', isGuide: true);
                    }),
                    itemWidget('증권사 주식계좌', titleType: 'UP'),
                    itemWidget('제휴 신용카드'),
                    SizedBox(height: 20,),
                    itemLine(),
                    SizedBox(height: 20,),
                    itemFirstWidget('mini'),
                    itemWidget('카카오뱅크 mini'),
                    itemWidget('내 mini카드'),
                    itemWidget('mini 이용가이드'),
                    itemWidget('mini 26일 저금'),
                    SizedBox(height: 20,),
                    itemLine(false),
                    Container(
                      color: Colors.grey.withOpacity(0.15),
                      child: Column(
                        children: [
                          SizedBox(height: 20,),
                          itemFirstWidget('상품가입'),
                          itemWidget('입출금통장'),
                          itemWidget('모임통장'),
                          itemWidget('세이프박스'),
                          itemWidget('저금통'),
                          itemWidget('정기예금'),
                          itemWidget('자유적금'),
                          itemWidget('26주적금'),
                          itemWidget('프렌즈 체크카드'),
                          SizedBox(height: 20,),
                          itemLine(),
                          SizedBox(height: 20,),
                          itemFirstWidget('대출신청'),
                          itemWidget('비상금대출'),
                          itemWidget('마이너스 통장대출'),
                          itemWidget('신용대출/중신용대출'),
                          itemWidget('개인사업자 대출'),
                          itemWidget('전월세보증금 대출'),
                          itemWidget('주택담보대출', titleType: 'NEW'),
                          SizedBox(height: 20,),
                          itemLastWidget(false, 0xff56b39e, false, '오픈뱅킹', '증권사 계좌 잔액도 한번에', 'kb_item_18.png', 75),
                          SizedBox(height: 40,),
                        ],
                      ),
                    ),
                  ],
                ),
                Obx(() {
                  return controller.kbInfoTopHeight < 80? Container(
                    height: 0.2,
                    color: Colors.black.withOpacity(0.3),
                  ) : Container();
                })
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget itemButtonWidget(String image, String title, double imageWidth) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(primary: Colors.black),
        onPressed: () {
          controller.sampleText = title;
          controller.sampleView = true;
        }, child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image(image: AssetImage('assets/images/$image'), width: imageWidth,),
            SizedBox(height: 10,),
            Text(title, style: TextStyle(fontSize: 12),)
          ],
        ),
      )),
    );
  }

  Widget itemLine([bool marginType = true]) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: marginType? 20 : 0),
      height: 0.3,
      color: Colors.black.withOpacity(0.3),
    );
  }

  Widget itemWidget(String title, {String? titleType, bool isGuide = false}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 900),
      color: isGuide? controller.itemFocus? Colors.grey.withOpacity(0.02) : Colors.white : Colors.transparent,
      child: TextButton(
        style: TextButton.styleFrom(primary: Colors.black),
        onPressed: () {
          controller.sampleView = true;
          controller.sampleText = title;
        },
        child: Container(
          padding: EdgeInsets.only(left: 12, right: 6, top: 15, bottom: 15),
          child: Row(
            children: [
              Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              titleType != null? Container(
                margin: EdgeInsets.only(left: 4,top: 5),
                padding: EdgeInsets.only(left: 8, right: 7, top: 2, bottom: 2) ,
                decoration: BoxDecoration(
                    color: Color(0xfffa5249),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Text(titleType, style: TextStyle(fontSize: 8, color: Colors.white, fontWeight: FontWeight.bold),),
              ) : Container(),
              Spacer(),
              Icon(Icons.keyboard_arrow_right, color: Colors.grey,)
            ],
          ),
        )
      ),
    );
  }

  Widget itemFirstWidget(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      alignment: Alignment.centerLeft,
      child: Text(title, style: TextStyle(fontSize: 12, color: Colors.grey )),
    );
  }

  Widget itemLastWidget(bool type, int color, bool fontColor, String title, String content, String imageName, double imageWidth) {
    if (type) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.only(left: 15, right: 10, top: 5),
        decoration: BoxDecoration(
            color: Color(color),
            borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          children: [
            Image(image: AssetImage('assets/images/$imageName'), width: imageWidth,),
            SizedBox(width: 12,),
            Text(content, style: TextStyle(fontSize: 12, color: fontColor? Colors.black : Colors.white),),
            Spacer(),
            Icon(Icons.keyboard_arrow_right, color: Colors.white,)
          ],
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        decoration: BoxDecoration(
            color: Color(color),
            borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 10, color: fontColor? Colors.black : Colors.white),),
                SizedBox(height: 5,),
                Text(content, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: fontColor? Colors.black : Colors.white),),
              ],
            ),
            Spacer(),
            Image(image: AssetImage('assets/images/$imageName'), width: imageWidth,)
          ],
        ),
      );
    }
  }

}
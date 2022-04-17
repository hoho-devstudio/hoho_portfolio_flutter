import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/main_controller.dart';

class KakaoBankUserWidget extends GetView<MainController> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff2e344d),
      child: Column(
        children: [
          Obx(() {
            return Container(
              height: controller.kbUserTopHeight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    SizedBox(width: 6,),
                    Text('김지호', style: TextStyle(fontSize: controller.kbUserTopTextSize, color: Colors.white, fontFamily: 'Day')),
                    SizedBox(width: 6,),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xff252a3e),
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Text('내  계좌', style: TextStyle(fontSize: 8, color: Colors.white, fontWeight: FontWeight.bold),),
                    ),
                    Spacer(),
                    Container(
                      width: controller.kbUserImageSize,
                      height: controller.kbUserImageSize,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: const AssetImage('assets/images/jiho.jpg'
                              )
                          )
                      ),
                    ),
                    SizedBox(width: 6,),
                  ],
                ),
              ),
            );
          }),
          Expanded(
            child: Stack(
              children: [
                ListView(
                  controller: controller.kbUserScrollController,
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  children: [
                    SizedBox(height: 10,),
                    Obx(() {
                      return itemWidget(context, 0xffd9e6ec, '김지호의 통장 ⭐️️', controller.kbUserMoney1, 1);
                    }),
                    SizedBox(height: 12,),
                    itemBoxWidget(true),
                    SizedBox(height: 12,),
                    itemBoxWidget(false),
                    SizedBox(height: 12,),
                    Obx(() {
                      return itemWidget(context, 0xfffbb9c0, '가족통장 👨‍👩‍👧‍👦', controller.kbUserMoney2, 2);
                    }),
                    SizedBox(height: 12,),
                    Obx(() {
                      return itemWidget(context, 0xffffe300, '데이트통장 💕️️', controller.kbUserMoney3, 3);
                    }),
                    SizedBox(height: 12,),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Icon(Icons.add, color: Colors.grey.withOpacity(0.8), size: 28),
                    ),
                    SizedBox(height: 35,),
                    Container(
                      alignment: Alignment.center,
                      child: Text('화면 편집', style: TextStyle(color: Colors.grey, fontSize: 12),),
                    ),
                    SizedBox(height: 60,),
                    itemLastWidget('대출까지 평균 60초', '최대 300만원까지 대출 가능한 비상금대출', 'kb_item_20.png', 45),
                    SizedBox(height: 40,),
                  ],
                ),
                Obx(() {
                  return controller.kbUserTopHeight < 80? Container(
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

  Widget itemWidget(BuildContext context, int color, String title, int money, int type) {
    var f = NumberFormat('###,###,###,###');
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 18),
      decoration: BoxDecoration(
          color: Color(color),
          borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                    Text('3333-01-1234567', style: TextStyle(fontSize: 10, color: Colors.grey.withOpacity(0.8)),),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 12, right: 2),
                child: IconButton(onPressed: () {  }, icon: Icon(Icons.more_vert, color: Colors.grey, size: 18,)),
              )
            ],
          ),
          SizedBox(height: type != 1? 6 : 26,),
          Column(
            children: [
              Text('${f.format(money)}원', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
              type != 1? Container(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    itemPhotoWidget('jiho.jpg', 0, 0),
                    itemPhotoWidget(type == 2? 'kb_user_1.jpg' : 'kb_user_2.jpg', 25, 0),
                    type == 2? itemPhotoWidget('kb_user_3.jpg', 50, 0) : Wrap(),
                    type == 2? itemPhotoWidget('kb_user_4.jpg', 75, 0) : Wrap(),
                  ],
                ),
              ) : Container()
            ],
          ),
          SizedBox(height: type != 1? 25 : 40,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  alignment: Alignment.center,
                    width: 140,
                    child: Wrap(
                      children: [
                        TextButton(
                            style: TextButton.styleFrom(primary: Colors.black),
                            onPressed: () {
                              sendPopup(context, type);
                            }, child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text('이체', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                            )),
                      ],
                    )),
                Container(
                  width: 0.3,
                  height: 20,
                  color: Colors.grey,
                ),
                Container(
                    width: 140,
                    child: TextButton(
                        style: TextButton.styleFrom(primary: Colors.black),
                        onPressed: () {
                        }, child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text('카드이용내역', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                        ))),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget itemLastWidget(String title, String content, String imageName, double imageWidth) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 16, color: Colors.white),),
              SizedBox(height: 5,),
              Text(content, style: TextStyle(fontSize: 12, color: Colors.grey),),
            ],
          ),
          Spacer(),
          Image(image: AssetImage('assets/images/$imageName'), width: imageWidth,)
        ],
      ),
    );
  }

  Widget itemBoxWidget(bool boxType) {
    return boxType? Container(
      decoration: BoxDecoration(
          color: Color(0xffd9e6ec),
          borderRadius: BorderRadius.circular(12)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 14, bottom: 8),
        child: Column(
          children: [
            Row(
              children: [
                Text('세이프박스', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                Spacer(),
                Text('0원', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),)
              ],
            ),
            Container(
                margin: EdgeInsets.only(top: 16, bottom: 4),
                width: double.infinity,
                height: 0.1,
                color: Colors.black54
            ),
            Row(
              children: [
                Text('저금통', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Image(
                    width: 36,
                    height: 36,
                    image: AssetImage('assets/images/dog_icon.png'),),
                )
              ],
            ),
          ],
        ),
      ),
    ) : Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 2),
              child: Row(
                children: [
                  Text('다른 금융계좌', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                  Spacer(),
                  IconButton(onPressed: () {  }, icon: Icon(Icons.more_vert, color: Colors.grey, size: 18,),)
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                            image: const AssetImage('assets/images/kb_icon.jpg'
                            )
                        )
                    ),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('KB Star*t통장', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: Colors.grey)),
                      Text('0원', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                    ],
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Text('이체', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              height: 0.1,
              color: Colors.black54,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                            image: const AssetImage('assets/images/nh_icon.jpg'
                            )
                        )
                    ),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('NH20해봄통장(비대면)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: Colors.grey)),
                      Text('0원', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                    ],
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Text('이체', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
          ],
        ),
      ),
    );
  }

  Widget itemPhotoWidget(String image, double left, double right) {
    return Container(
        margin: EdgeInsets.only(top: 12, left: left, right: right),
        width: 28,
        height: 28,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/$image')))
    );
  }

  void sendPopup(BuildContext context, int sendType) {
    var sendName = '';
    switch (sendType) {
      case 1: sendName = '김지호의 통장'; break;
      case 2: sendName = '가족통장'; break;
      case 3: sendName = '데이트통장'; break;
    }

    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              sendType != 1? itemSendWidget(context, '$sendName -> 김지호의 통장으로 1,000,000원 이체', sendType, 1, 1000000) : Container(),
              sendType != 2? itemSendWidget(context, '$sendName -> 가족통장으로 1,000,000원 이체', sendType, 2, 1000000) : Container(),
              sendType != 3? itemSendWidget(context, '$sendName -> 데이트통장으로 1,000,000원 이체', sendType, 3, 1000000) : Container(),
            ],
          );
        });
  }

  Widget itemSendWidget(BuildContext context, String title, int sendType, int receiveType, int money) {
    return TextButton(
        style: TextButton.styleFrom(primary: Colors.black),
        onPressed: () {
          var sendMoney = 0;
          switch (sendType) {
            case 1: sendMoney = controller.kbUserMoney1; break;
            case 2: sendMoney = controller.kbUserMoney2; break;
            case 3: sendMoney = controller.kbUserMoney3; break;
          }

          if (sendMoney < money) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text('이체 금액이 부족합니다.', style: TextStyle(fontFamily: 'Noto'),)
              )
            );
            Navigator.pop(context);
            return;
          }

          switch (sendType) {
            case 1: controller.kbUserMoney1 -= money; break;
            case 2: controller.kbUserMoney2 -= money; break;
            case 3: controller.kbUserMoney3 -= money; break;
          }

          var receiveName = '';
          switch (receiveType) {
            case 1: controller.kbUserMoney1 += money; receiveName = '김지호의 통장'; break;
            case 2: controller.kbUserMoney2 += money; receiveName = '가족통장'; break;
            case 3: controller.kbUserMoney3 += money; receiveName = '데이트통장'; break;
          }

          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text('$receiveName으로 1,000,000원을 이체하였습니다.', style: TextStyle(fontFamily: 'Noto'),)
              )
          );
          Navigator.pop(context);
        },
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: Text(title, style: TextStyle(fontSize: 16)),
        )
    );
  }

}
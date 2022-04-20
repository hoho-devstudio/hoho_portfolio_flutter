import 'dart:async';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_portfolio_flutter/app/ui/theme/app_colors.dart';
import 'package:intl/intl.dart';

import '../../../controller/main_controller.dart';
import '../../../util/util.dart';

class KakaoBankUserWidget extends GetView<MainController> {
  KakaoBankUserWidget(this._scaffoldKey);
  GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if (controller.test) {
        controller.test = false;
        // sendPopup(context, 1, 2);
        // confirmPopup(context, '김지호의 통장', 1000000);
      }
    });
    // return Container();
    return Container(
      color: const Color(0xff2e344d),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
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
          Obx(() {
            return controller.userProgress? CircularProgressIndicator() : Container();
          }),
        ],
      ),
    );
  }

  Widget itemWidget(BuildContext context, int color, String title, int money, int type) {
    return Container(
      height: 220,
      child: Stack(
        children: [
          Container(
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
                    Text('${Util.numberFormat(money)}원', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
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
                SizedBox(height: type != 1? 33 : 53,),
                Container(
                  width: 0.3,
                  height: 20,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            transform: Matrix4.translationValues(-10.0, 62.0, 0.0),
            child: RawMaterialButton(
              onPressed: () {
                selectPopup(context, type);
              },
              shape: CircleBorder(),
              child: Padding(
                padding: const EdgeInsets.all(90.0),
                child: Text('이체', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            transform: Matrix4.translationValues(35.0, 62.0, 0.0),
            child: RawMaterialButton(
              onPressed: () {
                controller.sampleText = '카드이용내역';
                controller.sampleView = true;
              },
              shape: CircleBorder(),
              child: Padding(
                padding: const EdgeInsets.all(90.0),
                child: Text('카드이용내역', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),),
              ),
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

  void selectPopup(BuildContext context, int sendType) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30))
      ),
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 7),
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12)
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 25, left: 24),
              alignment: Alignment.centerLeft,
              child: Text('받는계좌 선택', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
            ),
            sendType != 1? itemSendWidget(context, '[김지호의 통장 ⭐️️] 김지호', '3333-01-1234567', sendType, 1) : Container(),
            sendType != 2? itemSendWidget(context, '[가족통장 👨‍👩‍👧‍👦] 김지호', '3333-02-1234567', sendType, 2) : Container(),
            sendType != 3? itemSendWidget(context, '[데이트통장 💕️️] 김지호', '3333-03-1234567', sendType, 3) : Container(),
            SizedBox(height: 25,)
          ],
        );
      });
  }

  Widget itemSendWidget(BuildContext context, String title, String account, int sendType, int receiveType) {
    return TextButton(
        style: TextButton.styleFrom(primary: Colors.black),
        onPressed: () {
          Navigator.pop(context);
          sendPopup(context, sendType, receiveType);
        },
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: const BoxDecoration(
                            color: colorYellow,
                            shape: BoxShape.circle,
                        ),
                      ),
                      Image(
                        width: 20,
                        height: 20,
                        image: AssetImage('assets/images/kakaobank_icon_m.png'),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: TextStyle(fontSize: 14)),
                      SizedBox(height: 2,),
                      Text('카카오뱅크 $account', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        )
    );
  }

  void sendPopup(BuildContext context, int sendType, int receiveType) {
    var currentMoney;
    switch (sendType) {
      case 1: currentMoney = controller.kbUserMoney1; break;
      case 2: currentMoney = controller.kbUserMoney2; break;
      case 3: currentMoney = controller.kbUserMoney3; break;
    }

    controller.kbUserMoneySend = 0;
    controller.isMoneySend = false;
    controller.isMoneyOver = false;
    controller.moneyText = false;

    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))
        ),
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.9,
            child: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 35,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 22,
                              height: 22,
                              decoration: const BoxDecoration(
                                color: colorYellow,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Image(
                              width: 12,
                              height: 12,
                              image: AssetImage('assets/images/kakaobank_icon_m.png'),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 8,),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text('김지호 3333-0$receiveType-1234567', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                      ),
                      SizedBox(width: 4,),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text('계좌로', style: TextStyle(fontSize: 16),),
                      ),
                    ],
                  ),
                  SizedBox(height: 40,),
                  Obx(() {
                    return Container(
                      height: 125,
                      child: Column(
                        children: [
                          controller.moneyText? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AnimatedSwitcher(
                                duration: const Duration(milliseconds: 500),
                                transitionBuilder: (Widget child, Animation<double> animation) {
                                  return ScaleTransition(child: child, scale: animation);
                                },
                                child:
                                // Text(
                                //   '$_count',
                                //   key: ValueKey<int>(_count),
                                //   style: Theme.of(context).textTheme.display1,
                                // ),
                                Text(
                                  '${Util.numberFormat(controller.kbUserMoneySend)}',
                                  key: ValueKey<String>(Util.numberFormat(controller.kbUserMoneySend)),
                                  // style: Theme.of(context).textTheme.display1,
                                   style: TextStyle(fontSize: 28, color: controller.isMoneyOver? Colors.red : Colors.black),),
                              ),
                              Text('${Util.numberFormat(controller.kbUserMoneySend)}', style: TextStyle(fontSize: 28, color: controller.isMoneyOver? Colors.red : Colors.black),),
                              Text('원', style: TextStyle(fontSize: 28, color: Colors.black),),
                            ],
                          ) : Text('보낼 금액', style: TextStyle(color: Colors.grey, fontSize: 28),),
                          SizedBox(height: 20,),
                          controller.moneyText? Text(controller.isMoneyOver? '출금계좌 잔액을 초과하였습니다.' : moneyTransKo(), style: TextStyle(color: Colors.grey, fontSize: 12),) : Container(
                            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: 22,
                                        height: 22,
                                        decoration: const BoxDecoration(
                                          color: colorYellow,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      Image(
                                        width: 12,
                                        height: 12,
                                        image: AssetImage('assets/images/kakaobank_icon_m.png'),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(width: 5,),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 2),
                                  child: Text('출금가능금액 : ', style: TextStyle(fontSize: 12, color: Colors.grey),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 2),
                                  child: Text('${Util.numberFormat(currentMoney)}원', style: TextStyle(fontSize: 12, decoration: TextDecoration.underline, fontWeight: FontWeight.bold),),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Container(
                            alignment: Alignment.topCenter,
                            child: Container(
                              height: 250,
                              child: Stack(
                                children: [
                                  itemSendMoney(Alignment.topLeft, '1', currentMoney),
                                  itemSendMoney(Alignment.topCenter, '2', currentMoney),
                                  itemSendMoney(Alignment.topRight, '3', currentMoney),
                                  itemSendMoney(Alignment.bottomLeft, '4', currentMoney),
                                  itemSendMoney(Alignment.bottomCenter, '5', currentMoney),
                                  itemSendMoney(Alignment.bottomRight, '6', currentMoney),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 250,
                              child: Stack(
                                children: [
                                  itemSendMoney(Alignment.topLeft, '7', currentMoney),
                                  itemSendMoney(Alignment.topCenter, '8', currentMoney),
                                  itemSendMoney(Alignment.topRight, '9', currentMoney),
                                  Container(
                                    transform: Matrix4.translationValues(0.0, -9.0, 0.0),
                                    child: itemSendMoney(Alignment.bottomLeft, '00', currentMoney, padding: 58)
                                  ),
                                  itemSendMoney(Alignment.bottomCenter, '0', currentMoney),
                                  itemSendMoney(Alignment.bottomRight, '←', currentMoney),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ),
                  Obx(() {
                    return Container(
                      width: double.infinity,
                      height: 60,
                      color: controller.isMoneySend? colorYellow : Colors.grey.withOpacity(0.2),
                      child: TextButton(
                        style: TextButton.styleFrom(primary: Colors.black),
                        child: Text('다음', style: TextStyle(color: controller.isMoneySend? Colors.black : Colors.grey, fontSize: 16),),
                        onPressed: () {
                          if (!controller.isMoneySend) return;

                          var sendMoney = controller.kbUserMoneySend;

                          switch (sendType) {
                            case 1: controller.kbUserMoney1 -= sendMoney; break;
                            case 2: controller.kbUserMoney2 -= sendMoney; break;
                            case 3: controller.kbUserMoney3 -= sendMoney; break;
                          }

                          var receiveName = '';
                          switch (receiveType) {
                            case 1: controller.kbUserMoney1 += sendMoney; receiveName = '김지호의 통장'; break;
                            case 2: controller.kbUserMoney2 += sendMoney; receiveName = '가족통장'; break;
                            case 3: controller.kbUserMoney3 += sendMoney; receiveName = '데이트통장'; break;
                          }

                          Navigator.pop(context);

                          controller.userProgress = true;
                          Future.delayed(Duration(milliseconds: 1200), () {
                            controller.userProgress = false;
                            confirmPopup(receiveName, sendMoney);

                            ScaffoldMessenger.of(_scaffoldKey.currentContext!).hideCurrentSnackBar();
                            ScaffoldMessenger.of(_scaffoldKey.currentContext!).showSnackBar(
                                SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  content: Text('$receiveName으로 ${Util.numberFormat(sendMoney)}원을 이체하였습니다.', style: TextStyle(fontFamily: 'Noto'),),
                                )
                            );
                          });

                        },
                      ),
                    );
                  })
                ],
              ),
            ),
          );
        }
      );
  }

  void confirmPopup(String receiveName, int sendMoney) {
    showDialog(
      useRootNavigator: false,
      context: _scaffoldKey.currentContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
          ),
          contentPadding: EdgeInsets.only(bottom: 0),
          content: Container(
            height: 250,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 25,),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: colorYellow,
                    shape: BoxShape.circle
                  ),
                  child: Icon(Icons.check, size: 28,),
                ),
                SizedBox(height: 20,),
                Text('이체 완료', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                SizedBox(height: 15,),
                Text('$receiveName으로', style: TextStyle(fontSize: 14),),
                Text('${Util.numberFormat(sendMoney)}원을 이체했습니다.', style: TextStyle(fontSize: 14),),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: colorYellow,
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(12))
                  ),
                  height: 50,
                  width: double.infinity,
                  child: TextButton(
                      style: TextButton.styleFrom(primary: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      }, child: Text('확인')),
                )
              ],
            ),
          ),
        );
      }
    );
  }

  Widget itemSendMoney(Alignment alignment, String text, int currentMoney, {double padding = 65}) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: alignment,
      child: RawMaterialButton(
        onPressed: () {
          switch (text) {
            case '1': { add(1); break; }
            case '2': { add(2); break; }
            case '3': { add(3); break; }
            case '4': { add(4); break; }
            case '5': { add(5); break; }
            case '6': { add(6); break; }
            case '7': { add(7); break; }
            case '8': { add(8); break; }
            case '9': { add(9); break; }
            case '00': { multiply(2); break; }
            case '0': { multiply(1); break; }
            case '←': { remove(); break; }
          }

          var money = controller.kbUserMoneySend;
          if (currentMoney < money) {
            controller.isMoneyOver = true;
          } else {
            controller.isMoneyOver = false;
          }

          if (money != 0 && !controller.isMoneyOver) {
            controller.isMoneySend = true;
          } else {
            controller.isMoneySend = false;
          }

        },
        child: Text(text, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        padding: EdgeInsets.all(padding),
        shape: CircleBorder(),
      ),
    );
  }
  
  void add(int number) {
    controller.moneyText = true;
    var money = controller.kbUserMoneySend;
    if (money.toString().length > 14) {

    } else if (money != 0) {
      money = money * 10 + number;
    } else {
      money = money + number;
    }
    controller.kbUserMoneySend = money;
  }

  void multiply(int zero) {
    var money = controller.kbUserMoneySend;
    if (money.toString().length > 14) {

    } else if (money == 0) {
      controller.moneyText = true;
    } else if (zero == 1) {
      money = money * 10;
    } else if (zero == 2) {
      if (money.toString().length > 14) {
        money = money * 10;
      } else {
        money = money * 100;
      }
    }
    controller.kbUserMoneySend = money;
  }

  void remove() {
    var money = controller.kbUserMoneySend;
    if (money == 0) {
      controller.moneyText = false;
    } else if (money.toString().length == 1) {
      money = 0;
    } else {
      money = money ~/ 10;
    }
    controller.kbUserMoneySend = money;
  }

  String moneyTransKo() {
    var result = '';
    var money = controller.kbUserMoneySend;
    var moneyLengh = money.toString().length;
    var j;
    var e;
    var m;
    var w;
    if (moneyLengh > 12) {
      j = money.toString().substring(0, moneyLengh-12);
      e = money.toString().substring(moneyLengh-12, moneyLengh-8);
      m = money.toString().substring(moneyLengh-8, moneyLengh-4);
      w = money.toString().substring(moneyLengh-4, moneyLengh);
    } else if (moneyLengh > 8) {
      e = money.toString().substring(0, moneyLengh-8);
      m = money.toString().substring(moneyLengh-8, moneyLengh-4);
      w = money.toString().substring(moneyLengh-4, moneyLengh);
    } else if (moneyLengh > 4) {
      m = money.toString().substring(0, moneyLengh-4);
      w = money.toString().substring(moneyLengh-4, moneyLengh);
    } else {
      w = money.toString().substring(0, moneyLengh);
    }

    if (j != null) {
      result += Util.numberFormat(j) + '조';
    }
    if (e != null && e != '0000') {
      if (result.isNotEmpty) result += ' ';
      result += Util.numberFormat(e) + '억';
    }
    if (m != null && m != '0000') {
      if (result.isNotEmpty) result += ' ';
      result += Util.numberFormat(m) + '만';
    }
    if (w != null && w != '0000') {
      if (result.isNotEmpty) result += ' ';
      result += Util.numberFormat(w);
    }
    result += '원';

    return result;
  }

  String moneyFormat(dynamic number) {
    var result = '';
    var f = NumberFormat('###,###,###,###');
    if (number is String) {
      return f.format(int.parse(number));
    } else if (number is int) {
      return f.format(number);
    }
    return result;
  }



}
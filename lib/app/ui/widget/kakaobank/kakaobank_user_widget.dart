import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                  crossAxisAlignment: CrossAxisAlignment.center,
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
            child: ListView(
              controller: controller.kbUserScrollController,
              padding: EdgeInsets.symmetric(horizontal: 14),
              children: [
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 18),
                  decoration: BoxDecoration(
                    color: Color(0xffd9e6ec),
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
                                Text('김지호의 통장 ⭐️️', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                                Text('3333-01-1234567', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: Colors.grey),),
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
                      SizedBox(height: 26,),
                      Text('1,000,000원', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                      SizedBox(height: 45,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 100,
                                child: TextButton(onPressed: () {
                                  test(context);
                                }, child: Text('이체', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),))),
                            Container(
                              width: 1,
                              height: 15,
                              color: Colors.grey,
                            ),
                            Container(
                              width: 100,
                                child: TextButton(onPressed: () {}, child: Text('카드이용내역', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),))),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
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
                            Text('1,000,000원', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),)
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
                ),
                SizedBox(height: 10,),
                Container(
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
                                  Text('1,000,000원', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
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
                                  Text('1,000,000원', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
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
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 18),
                  decoration: BoxDecoration(
                      color: Colors.yellow,
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
                                Text('데이트통장 💕', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                                Text('3333-01-1234567', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: Colors.grey),),
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
                      SizedBox(height: 26,),
                      Text('1,000,000원', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                      SizedBox(height: 45,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                width: 100,
                                child: TextButton(onPressed: () {}, child: Text('이체', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),))),
                            Container(
                              width: 1,
                              height: 15,
                              color: Colors.grey,
                            ),
                            Container(
                                width: 100,
                                child: TextButton(onPressed: () {}, child: Text('카드이용내역', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),))),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void test(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: new Icon(Icons.photo),
                title: new Text('Photo'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.music_note),
                title: new Text('Music'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.videocam),
                title: new Text('Video'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.share),
                title: new Text('Share'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

}
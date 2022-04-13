import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/main_controller.dart';

class KakaoBankUserWidget extends GetView<MainController> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      color: const Color(0xff2e344d),
      child: ListView(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 6,),
              Text('김지호', style: TextStyle(fontSize: 26, color: Colors.white, fontFamily: 'Day')),
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
                width: 46,
                height: 46,
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
          SizedBox(height: 24,),
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
                        children: [
                          Text('김지호의 통장', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                          Text('3333-01-1234567', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: Colors.grey),),
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12, right: 4),
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
                      TextButton(onPressed: () {}, child: Text('이체', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)),
                      Container(
                        width: 1,
                        height: 15,
                        color: Colors.grey,
                      ),
                      TextButton(onPressed: () {}, child: Text('카드이용내역', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

}
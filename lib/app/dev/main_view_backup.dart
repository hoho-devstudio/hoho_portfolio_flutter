import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyAppPage();
  }
}

class MyAppPage extends StatefulWidget {
  const MyAppPage({Key? key}) : super(key: key);

  @override
  _MyAppPageState createState() => _MyAppPageState();
}

class _MyAppPageState extends State<MyAppPage> with TickerProviderStateMixin {

  late ScrollController controller;
  late TabController tabController;
  var splashView = false;
  var textView = true;
  var page = 0;
  var offset = 0;
  var offsetTop = true;
  var offsetHoho = true;
  var turns = 0.0;

  var pageHeight = [900, 420, 1100, 500];

  var count = 0;
  void _changeRotation() {
    if (count > 3) {
      count = 0;
      Future.delayed(Duration(seconds: 2), () {
        _changeRotation();
      });
      return;
    }
    count++;

    if (turns == 0.045) {
      setState(() {
        turns = 0.0;
      });
    } else {
      setState(() {
        turns = 0.045;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    controller = ScrollController(
      // initialScrollOffset: (pageHeight[0] + pageHeight[1] + pageHeight[2]).toDouble()
    );
    tabController = TabController(
        length: 7, vsync: this, initialIndex: 0
    );

    controller.addListener(() {
      offset = controller.offset.toInt();

      if (offset == 0) {
        setState(() {
          offsetTop = true;
        });
      } else {
        if (offsetTop == true) {
          setState(() {
            offsetTop = false;
          });
        }
      }

      if (offset < 30 && !offsetHoho) {
        setState(() {
          offsetHoho = true;
        });
      } else if (offset > 30 && offsetHoho) {
        setState(() {
          offsetHoho = false;
        });
      }

      if (offset < pageHeight[0]) {
        if (page != 0) {
          setState(() {
            page = 0;
          });
        }
      } else if (offset < pageHeight[0] + pageHeight[1]) {
        if (page != 1) {
          setState(() {
            page = 1;
          });
        }
      } else if (offset < pageHeight[0] + pageHeight[1] + pageHeight[2]) {
        if (page != 2) {
          setState(() {
            page = 2;
          });
        }
      } else if (offset < pageHeight[0] + pageHeight[1] + pageHeight[2] + pageHeight[3]) {
        if (page != 3) {
          setState(() {
            page = 3;
          });
        }
      }
    });

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Future.delayed(Duration(milliseconds: 5000), () {
        setState(() {
          splashView = false;
          _changeRotation();
        });
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              color: Colors.white,
              child: ListView(
                controller: controller,
                children: [
                  Container(
                    height: pageHeight[0].toDouble(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 80),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Opacity(
                                  opacity: offsetHoho? 1.0 : 0.0,
                                  child: Text('hoho\'s portfolio', style: TextStyle(fontSize: 25),)
                              ),
                              splashView? Container() : AnimatedOpacity(
                                  duration: Duration(milliseconds: 500),
                                  opacity: offsetTop? 1.0 : 0.0,
                                  child: DefaultTextStyle(
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Jua',
                                        color: Colors.black
                                    ),
                                    textAlign: TextAlign.start,
                                    child: AnimatedTextKit(
                                      animatedTexts: [
                                        WavyAnimatedText('hoho.devstudio@gmail.com'),
                                      ],
                                      isRepeatingAnimation: true,
                                    ),
                                  )
                              ),
                            ],
                          ),
                          SizedBox(height: 250,),
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 5,
                                    color: Colors.black
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(8.0))
                            ),
                            child: Center(
                                child: Text('hoho', style: TextStyle(fontSize: 65,fontWeight: FontWeight.bold, color: Colors.yellow),)
                            ),
                          ),
                          SizedBox(height: 20,),
                          // AnimatedTextKit(
                          //   animatedTexts: [
                          //     ColorizeAnimatedText(
                          //       'Developer KIM JIHO',
                          //       textStyle: TextStyle(
                          //         fontSize: 22.0,
                          //         fontFamily: 'Jua',
                          //       ),
                          //       colors: [
                          //         Colors.black,
                          //         Colors.purple,
                          //         Colors.blue,
                          //         Colors.yellow,
                          //         Colors.red,
                          //       ],
                          //     ),
                          //   ],
                          //   isRepeatingAnimation: true,
                          // ),
                          Text('Developer KIM JIHO', style: TextStyle(fontSize: 22),),
                          SizedBox(height: 100,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('??????????????? ', style: TextStyle(fontSize: 16),),
                              AnimatedRotation(
                                turns: turns,
                                duration: Duration(milliseconds: 160),
                                child: Text('????', style: TextStyle(fontSize: 24),),
                                onEnd: _changeRotation,
                              ),
                            ],
                          ),
                          SizedBox(height: 8,),
                          Text('Android??? iOS????????? ???????????? flutter??? ????????? ?????????????????? ????????? ?????? ????????????.', style: TextStyle(fontSize: 16),),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 60),
                    height: pageHeight[1].toDouble(),
                    color: Color(0x10000000),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 230,
                              height: 230,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white
                              ),
                            ),
                            Container(
                              width: 230,
                              height: 230,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.fitWidth,
                                      image: AssetImage(
                                          'assets/images/jiho.jpg'
                                      )
                                  )
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 40,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Text('9?????? ????????? ????????? ????????', style: TextStyle(fontSize: 20),),
                            SizedBox(height: 10,),
                            Text('?????????', style: TextStyle(fontSize: 20),),
                            SizedBox(height: 10,),
                            Container(
                              width: 250,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: Color(0x11000000)
                                  )
                              ),
                            )
                          ],
                        ),
                        SizedBox(width: 30,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 44,),
                            Text('??????', style: TextStyle(fontSize: 20),),
                            SizedBox(height: 10,),
                            Container(
                              width: 350,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: Color(0x11000000)
                                  )
                              ),
                            ),
                            SizedBox(height: 20,),
                            Text('???) NICE????????????????????? - Android, iOS ?????????', style: TextStyle(fontSize: 15, fontFamily: 'Nanum'),),
                            SizedBox(height: 10,),
                            Text('???) NICE????????????(??????) - Android ?????????', style: TextStyle(fontSize: 15, fontFamily: 'Nanum'),),
                            SizedBox(height: 10,),
                            Text('???) ???????????????????????? - Android ?????? ?????????', style: TextStyle(fontSize: 15, fontFamily: 'Nanum'),),
                            SizedBox(height: 10,),
                            Text('???) ???????????? - Android ?????? ?????????', style: TextStyle(fontSize: 15, fontFamily: 'Nanum'),),
                            SizedBox(height: 10,),
                            Text('???) ??????(??????) - ????????? FW?????? ?????????', style: TextStyle(fontSize: 15, fontFamily: 'Nanum'),),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 60),
                    height: pageHeight[2].toDouble(),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 140*7,
                          child: TabBar(tabs: [
                            Tab(child: Text('NICEabc', style: TextStyle(color: Colors.black, fontSize: 18),),),
                            Tab(child: Text('??????????????????', style: TextStyle(color: Colors.black, fontSize: 18),),),
                            Tab(child: Text('??????????????????', style: TextStyle(color: Colors.black, fontSize: 18),),),
                            Tab(child: Text('?????????????????????', style: TextStyle(color: Colors.black, fontSize: 18),),),
                            Tab(child: Text('MESA', style: TextStyle(color: Colors.black, fontSize: 18),),),
                            Tab(child: Text('WINDMAT', style: TextStyle(color: Colors.black, fontSize: 18),),),
                            Tab(child: Text('MAXPO', style: TextStyle(color: Colors.black, fontSize: 18),),),
                          ],
                            controller: tabController,
                            indicatorColor: Colors.yellow,
                            indicatorWeight: 3,
                            indicatorPadding: EdgeInsets.symmetric(horizontal: 15),),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          width: 960,
                          height: 780,
                          // decoration: BoxDecoration(
                          //   border: Border.all(
                          //     width: 1
                          //   )
                          // ),
                          child: TabBarView(children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 0.1
                                            ),
                                            borderRadius: BorderRadius.circular(20),
                                            image: DecorationImage(
                                              fit: BoxFit.fitHeight,
                                              image: NetworkImage('https://is2-ssl.mzstatic.com/image/thumb/Purple116/v4/5a/0a/08/5a0a080b-e4de-b5f8-02bf-7b912671e28f/AppIcon-0-0-1x_U007emarketing-0-0-0-10-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/230x0w.png'),
                                            )
                                        ),
                                      ),
                                      SizedBox(width: 30,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text('????  NICEabc ???????????????(kotlin) ??????  -', style: TextStyle(fontSize: 16),),
                                              TextButton(onPressed: () async {
                                                await launch('https://play.google.com/store/apps/details?id=com.nicebp.niceabc.fincent');
                                              }, child: Text('Google Play ??????'),),
                                            ],
                                          ),
                                          SizedBox(height: 5,),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 28),
                                            child: Text('P2P ??????/?????? ??????????????? ????????? ??????, ???????????????, ?????????/?????????, ????????????, ??????????????? ?????? ?????? ?????? ??? ?????? ??????', style: TextStyle(fontFamily: 'Nanum'),),
                                          ),
                                          SizedBox(height: 20,),
                                          Row(
                                            children: [
                                              Text('????  NICEabc ?????????(swift) ??????  -', style: TextStyle(fontSize: 16),),
                                              TextButton(onPressed: () async {
                                                await launch('https://apps.apple.com/kr/app/id1475039785');
                                              }, child: Text('App Store ??????'),),
                                            ],
                                          ),
                                          SizedBox(height: 5,),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 28),
                                            child: Text('P2P ??????/?????? ??????????????? ????????? ???????????????, ?????????/?????????, ????????????, ??????????????? ?????? ?????? ?????? ??? ?????? ??????', style: TextStyle(fontFamily: 'Nanum'),),
                                          ),
                                          SizedBox(height: 20,),
                                          Text('????  NICEabc ??????(Spring Framework) ??????', style: TextStyle(fontSize: 16),),
                                          SizedBox(height: 5,),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 28),
                                            child: Text('Oracle DB?????? ????????? API ??????', style: TextStyle(fontFamily: 'Nanum'),),
                                          ),
                                          SizedBox(height: 20,),
                                          Text('????  NICEabc ?????? ???????????? ??????', style: TextStyle(fontSize: 16),),
                                          SizedBox(height: 5,),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 28),
                                            child: Text('FCM ???????????? ??????', style: TextStyle(fontFamily: 'Nanum'),),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Image.network('https://is5-ssl.mzstatic.com/image/thumb/Purple123/v4/9c/b2/04/9cb2040d-6e06-f118-3218-e6b4ec129a10/pr_source.jpg/460x0w.jpg', width: 230,),
                                      SizedBox(width: 10,),
                                      Image.network('https://is3-ssl.mzstatic.com/image/thumb/Purple123/v4/73/05/30/7305303b-2aa4-c58c-62b8-5b3f676f9bee/pr_source.jpg/460x0w.jpg', width: 230),
                                      SizedBox(width: 10,),
                                      Image.network('https://is3-ssl.mzstatic.com/image/thumb/Purple123/v4/7b/02/2c/7b022cd1-4c2c-b290-bf77-5005c425da4d/pr_source.jpg/460x0w.jpg', width: 230)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 0.1
                                            ),
                                            borderRadius: BorderRadius.circular(20),
                                            image: DecorationImage(
                                              fit: BoxFit.fitHeight,
                                              image: NetworkImage('https://is5-ssl.mzstatic.com/image/thumb/Purple116/v4/da/69/ff/da69ffa2-faf7-aba7-da02-13b58cfc52de/AppIcon-0-0-1x_U007emarketing-0-0-0-5-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/230x0w.png'),
                                            )
                                        ),
                                      ),
                                      SizedBox(width: 30,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text('????  ?????????????????? ??????????????? ??????  -', style: TextStyle(fontSize: 16),),
                                              TextButton(onPressed: () async {
                                                await launch('https://play.google.com/store/apps/details?id=com.mobilestudio.mycreditmanager');
                                              }, child: Text('Google Play ??????'),),
                                            ],
                                          ),
                                          SizedBox(height: 5,),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 28),
                                            child: Text('?????? ?????????????????? ??????????????? ????????? ??????, ???????????????, ?????????/?????????, ???????????? ????????????, ????????????, ??????????????? ?????? ?????? ??????', style: TextStyle(fontFamily: 'Nanum')),
                                          ),
                                          SizedBox(height: 5,),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 28),
                                            child: Text('??? ?????? ??????', style: TextStyle(fontFamily: 'Nanum')),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Image.network('https://is4-ssl.mzstatic.com/image/thumb/PurpleSource116/v4/a6/32/a0/a632a083-4610-49a1-7cf3-2a08c5fb0cfe/04da85e7-e675-40f9-b1fa-c5371d876594_appstore_1242x2688_01.png/460x0w.png', width: 230,),
                                      SizedBox(width: 10,),
                                      Image.network('https://is2-ssl.mzstatic.com/image/thumb/PurpleSource126/v4/6f/66/b4/6f66b406-7482-35ef-7996-679c50ad4f74/fced0117-5236-4d28-869c-c46aaad8aed4_appstore_1242x2688_02.png/460x0w.png', width: 230),
                                      SizedBox(width: 10,),
                                      Image.network('https://is4-ssl.mzstatic.com/image/thumb/PurpleSource116/v4/ea/e8/34/eae83445-812f-e947-e838-47865fda1c3a/978bf053-ebd8-4408-8259-0d293f684081_appstore_1242x2688_05.png/460x0w.png', width: 230,),
                                      SizedBox(width: 10,),
                                      Image.network('https://is3-ssl.mzstatic.com/image/thumb/PurpleSource126/v4/5e/79/72/5e7972ca-248d-1d3c-29df-4bb05a22f8e7/3eade3e1-77f5-4ab7-a0df-13c529736751_appstore_1242x2688_08.png/460x0w.png', width: 230,)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 0.1
                                            ),
                                            borderRadius: BorderRadius.circular(20),
                                            image: DecorationImage(
                                              fit: BoxFit.fitHeight,
                                              image: NetworkImage('https://is1-ssl.mzstatic.com/image/thumb/Purple115/v4/93/ec/0f/93ec0fa8-b696-af8f-af85-54eb27e265b0/AppIcon-2-1x_U007emarketing-0-2-85-220.png/230x0w.png'),
                                            )
                                        ),
                                      ),
                                      SizedBox(width: 30,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text('????  ?????????????????? ??????????????? ??????  -', style: TextStyle(fontSize: 16),),
                                              TextButton(onPressed: () async {
                                                await launch('https://play.google.com/store/apps/details?id=com.niceid.nicemypin');
                                              }, child: Text('Google Play ??????'),),
                                            ],
                                          ),
                                          SizedBox(height: 5,),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 28),
                                            child: Text('?????????????????? ?????? ?????? ???????????? ????????? ??????, ???????????????, ?????????/?????????, ?????????, ???????????? ????????????, ????????? ?????? ?????? ??????', style: TextStyle(fontFamily: 'Nanum')),
                                          ),
                                          SizedBox(height: 5,),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 28),
                                            child: Text('?????? ????????????', style: TextStyle(fontFamily: 'Nanum')),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Image.network('https://is3-ssl.mzstatic.com/image/thumb/Purple123/v4/59/95/04/59950437-8cce-7ad8-573c-a43be2bfb4a8/pr_source.jpg/460x0w.jpg', width: 230,),
                                      SizedBox(width: 10,),
                                      Image.network('https://is1-ssl.mzstatic.com/image/thumb/Purple123/v4/ed/ef/5e/edef5e29-e9c3-d541-e82e-5bf9b20236cd/pr_source.jpg/460x0w.jpg', width: 230,),
                                      SizedBox(width: 10,),
                                      Image.network('https://is2-ssl.mzstatic.com/image/thumb/Purple113/v4/d4/72/47/d4724719-c390-e2c2-dfdc-bcf54c0eb5c2/pr_source.jpg/460x0w.jpg', width: 230,),
                                      SizedBox(width: 10,),
                                      Image.network('https://is2-ssl.mzstatic.com/image/thumb/Purple113/v4/1b/d6/c2/1bd6c221-3d91-7dbb-f942-6fe938b389d0/pr_source.jpg/460x0w.jpg', width: 230,),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 0.1
                                            ),
                                            borderRadius: BorderRadius.circular(20),
                                            image: DecorationImage(
                                              fit: BoxFit.fitHeight,
                                              image: NetworkImage('https://is2-ssl.mzstatic.com/image/thumb/Purple125/v4/d2/38/15/d238151d-7d65-b8d7-3aa4-08bb63019dc6/AppIcon-1x_U007emarketing-0-5-0-85-220.png/230x0w.png'),
                                            )
                                        ),
                                      ),
                                      SizedBox(width: 30,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text('????  ????????????????????? ??????????????? ??????  -', style: TextStyle(fontSize: 16),),
                                              TextButton(onPressed: () async {
                                                await launch('https://play.google.com/store/apps/details?id=com.nice.NiceInfoBox');
                                              }, child: Text('Google Play ??????'),),
                                            ],
                                          ),
                                          SizedBox(height: 5,),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 28),
                                            child: Text('???????????? ?????? ???????????? ????????? ??????, ???????????????, ????????????, ??????????????? ?????? ?????? ?????? ????????????', style: TextStyle(fontFamily: 'Nanum')),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  Row(
                                    children: [
                                      Image.network('https://is5-ssl.mzstatic.com/image/thumb/Purple123/v4/bc/69/2a/bc692afd-950b-a655-0738-ba57ed066c53/pr_source.jpg/460x0w.jpg', width: 230,),
                                      SizedBox(width: 10,),
                                      Image.network('https://is2-ssl.mzstatic.com/image/thumb/Purple123/v4/fc/50/40/fc5040df-936e-3a55-0336-a9a7e3e5d7f9/pr_source.jpg/460x0w.jpg', width: 230,),
                                      SizedBox(width: 10,),
                                      Image.network('https://is3-ssl.mzstatic.com/image/thumb/Purple113/v4/a2/d0/23/a2d0233d-d060-4619-ca0c-e0894701495a/pr_source.jpg/460x0w.jpg', width: 230,),
                                      SizedBox(width: 10,),
                                      Image.network('https://is4-ssl.mzstatic.com/image/thumb/Purple113/v4/d8/24/5b/d8245b3f-561a-8978-9905-90c4f68aaa33/pr_source.jpg/460x0w.jpg', width: 230,),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image(image: AssetImage('assets/images/mesa_icon.png'), width: 100, height: 100,),
                                      SizedBox(width: 30,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('????  MESA ??????????????? ??????', style: TextStyle(fontSize: 16),),
                                          SizedBox(height: 5,),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 28),
                                            child: Text('????????????????????? ???????????? ????????? ?????? ??? ????????? ?????? ??????, ???????????????, ???????????? ?????? ?????? ??????', style: TextStyle(fontFamily: 'Nanum')),
                                          ),
                                          SizedBox(height: 20,),
                                          Text('????  MESA ??????(Spring Framework) ??????', style: TextStyle(fontSize: 16),),
                                          SizedBox(height: 5,),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 28),
                                            child: Text('MSSQL DB?????? ????????? API ??????', style: TextStyle(fontFamily: 'Nanum')),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  Image(image: AssetImage('assets/images/mesa_7.png'), height: 230,),
                                  SizedBox(height: 10,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Image(image: AssetImage('assets/images/mesa_2.png'), width: 230,),
                                      SizedBox(width: 10,),
                                      Image(image: AssetImage('assets/images/mesa_3.png'), width: 230,),
                                      SizedBox(width: 10,),
                                      Image(image: AssetImage('assets/images/mesa_4.png'), width: 230,),
                                      SizedBox(width: 10,),
                                      Image(image: AssetImage('assets/images/mesa_5.png'), width: 230,),
                                      // SizedBox(width: 10,),
                                      // Image(image: AssetImage('assets/images/mesa_6.png'), width: 230,),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image(image: AssetImage('assets/images/windmat_icon.png'), width: 100, height: 100,),
                                      SizedBox(width: 30,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('????  WINDMAT ??????????????? ??????', style: TextStyle(fontSize: 16),),
                                          SizedBox(height: 5,),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 28),
                                            child: Text('???????????? ???????????? ???????????? ?????????????????? ?????? ??????', style: TextStyle(fontFamily: 'Nanum')),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  Image(image: AssetImage('assets/images/windmat_4.png'), height: 230,),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(width: 0.4, color: Colors.grey)
                                          ),
                                          child: Image(image: AssetImage('assets/images/windmat_1.png'), width: 230,)
                                      ),
                                      SizedBox(width: 10,),
                                      Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(width: 0.4, color: Colors.grey)
                                          ),
                                          child: Image(image: AssetImage('assets/images/windmat_2.png'), width: 230,)
                                      ),
                                      SizedBox(width: 10,),
                                      Container(
                                          child: Image(image: AssetImage('assets/images/windmat_3.png'), width: 230,)
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image(image: AssetImage('assets/images/mexpo_icon.png'), width: 100, height: 100,),
                                      SizedBox(width: 30,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('????  MEXPO ??????????????? ??????', style: TextStyle(fontSize: 16),),
                                          SizedBox(height: 5,),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 28),
                                            child: Text('?????????????????? ???????????? ????????? ????????? ????????? ??????, ??????, ?????? ?????? ?????? ??????', style: TextStyle(fontFamily: 'Nanum')),
                                          ),
                                          SizedBox(height: 20,),
                                          Text('????  MEXPO ??????(Spring Framework) ??????', style: TextStyle(fontSize: 16),),
                                          SizedBox(height: 5,),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 28),
                                            child: Text('MSSQL DB?????? ????????? API ??????', style: TextStyle(fontFamily: 'Nanum')),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  Image(image: AssetImage('assets/images/mexpo_6.png'), height: 230,),
                                  SizedBox(height: 10,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Image(image: AssetImage('assets/images/mexpo_1.png'), width: 230,),
                                      SizedBox(width: 10,),
                                      Image(image: AssetImage('assets/images/mexpo_2.png'), width: 230,),
                                      SizedBox(width: 10,),
                                      Image(image: AssetImage('assets/images/mexpo_3.png'), width: 230,),
                                      SizedBox(width: 10,),
                                      Image(image: AssetImage('assets/images/mexpo_4.png'), width: 230,),
                                      // SizedBox(width: 10,),
                                      // Image(image: AssetImage('assets/images/mesa_6.png'), width: 230,),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                            controller: tabController,),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: pageHeight[3].toDouble(),
                    color: Color(0xfff9f9f9),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 70),
                        Text('????  ?????? ????????? ?????? ????????? ???????????????', style: TextStyle(fontSize: 22)),
                        SizedBox(height: 60),
                        Text('hoho.devstudio@gmail.com', style: TextStyle(fontSize: 62)),
                        SizedBox(height: 20),
                        Text('?????? ??????????????? ?????????! ????????? ??????????????? ????????? ????????????.', style: TextStyle(fontSize: 16, color: Colors.black26)),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30, right: 40),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Text('?? 2022 hoho studio', style: TextStyle(color: Colors.grey),),
                              Container(
                                  alignment: Alignment.centerRight,
                                  child: Text('Made By hoho with ????????????')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Opacity(
              opacity: offsetTop? 0.0 : 1.0,
              child: Container(
                width: double.infinity,
                height: 50,
                // color: Color(0x55ffffff),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Opacity(
                        opacity: offsetHoho? 0.0 : 1.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 80),
                          child: Text('hoho\'s portfolio', style: TextStyle(fontSize: 25),),
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: TextButton(onPressed: () {
                        controller.animateTo(0, duration: Duration(seconds: 1), curve: Curves.ease);
                      }, child: Text('HOME', style: TextStyle(fontSize: 18, color: page==0? Colors.black: Colors.black26),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: TextButton(onPressed: () {
                        controller.animateTo(pageHeight[0].toDouble(), duration: Duration(seconds: 1), curve: Curves.ease);
                      }, child: Text('ABOUT ME', style: TextStyle(fontSize: 18, color: page==1? Colors.black: Colors.black26),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: TextButton(onPressed: () {
                        controller.animateTo((pageHeight[0]+pageHeight[1].toDouble()), duration: Duration(seconds: 1), curve: Curves.ease);
                      }, child: Text('PROJECT', style: TextStyle(fontSize: 18, color: page==2? Colors.black: Colors.black26),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 80),
                      child: TextButton(onPressed: () {
                        controller.animateTo((pageHeight[0]+pageHeight[1]+pageHeight[2].toDouble()), duration: Duration(seconds: 1), curve: Curves.ease);
                      }, child: Text('CONTACT', style: TextStyle(fontSize: 18, color: page==3? Colors.black: Colors.black26),)),
                    ),
                  ],
                ),
              ),
            ),
            IgnorePointer(
              child: AnimatedOpacity(
                duration: Duration(seconds: 1),
                opacity: splashView? 1.0 : 0.0,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white,
                  child: AnimatedOpacity(
                    duration: Duration(seconds: 1),
                    opacity: textView? 1.0 : 0.0,
                    child: Center(
                      child: SizedBox(
                        height: 50,
                        child: DefaultTextStyle(
                          style: const TextStyle(
                              fontSize: 38,
                              fontFamily: 'Nanum',
                              color: Colors.black
                          ),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText('????????? ????????????!',
                                  speed: Duration(milliseconds: 150)),
                            ],
                            totalRepeatCount: 1,
                            onFinished: () {
                              setState(() {
                                textView = false;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        )
    );
  }
}



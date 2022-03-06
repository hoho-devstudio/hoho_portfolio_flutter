import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  var page = 0;
  var offset = 0;
  var offsetTop = true;
  var offsetHoho = true;

  var pageHeight = [1000, 370, 1600];

  @override
  void initState() {
    super.initState();
    controller = ScrollController(
      initialScrollOffset: (pageHeight[0] + pageHeight[1]).toDouble()
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
      }
    });

    tabController = TabController(length: 3, vsync: this);

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Future.delayed(Duration(milliseconds: 3000), () {
        setState(() {
          splashView = false;
        });
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // fontFamily: 'NanumGothic'
        fontFamily: 'Jua'
      ),
      home: Scaffold(
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
                                AnimatedOpacity(
                                  duration: Duration(milliseconds: 500),
                                  opacity: offsetTop? 1.0 : 0.0,
                                  child: Text('jhkkim0114@gmail.com', style: TextStyle(fontSize: 16), textAlign: TextAlign.start,)
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
                            Text('Developer KIM JIHO', style: TextStyle(fontSize: 22),),
                            SizedBox(height: 100,),
                            Text('안녕하세요 👋', style: TextStyle(fontSize: 16),),
                            SizedBox(height: 8,),
                            Text('Android와 iOS개발을 주로하며 flutter를 사용한 크로스플랫폼 개발도 하고 있습니다.', style: TextStyle(fontSize: 16),),
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
                                        fit: BoxFit.fitHeight,
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
                              Text('9년차 모바일 개발자 🧑💻', style: TextStyle(fontSize: 20),),
                              SizedBox(height: 10,),
                              Text('김지호', style: TextStyle(fontSize: 20),),
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
                              Text('이력', style: TextStyle(fontSize: 20),),
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
                              Text('현) NICE비즈니스플랫폼 - Android, iOS 개발자', style: TextStyle(fontSize: 15, fontFamily: 'NanumGothic'),),
                              SizedBox(height: 10,),
                              Text('전) NICE평가정보(파견) - Android 개발자', style: TextStyle(fontSize: 15, fontFamily: 'NanumGothic'),),
                              SizedBox(height: 10,),
                              Text('전) 와이즈인프라코어 - Android 리드 개발자', style: TextStyle(fontSize: 15, fontFamily: 'NanumGothic'),),
                              SizedBox(height: 10,),
                              Text('전) 브레닉스 - Android 리드 개발자', style: TextStyle(fontSize: 15, fontFamily: 'NanumGothic'),),
                              SizedBox(height: 10,),
                              Text('전) 팬텍(파견) - 임베디드SW개발 연구원', style: TextStyle(fontSize: 15, fontFamily: 'NanumGothic'),),
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
                            width: 380,
                            child: TabBar(tabs: [
                              Tab(child: Text('NICEabc', style: TextStyle(color: Colors.black, fontSize: 18),),),
                              Tab(child: Text('나이스지키미', style: TextStyle(color: Colors.black, fontSize: 18),),),
                              Tab(child: Text('나이스아이핀', style: TextStyle(color: Colors.black, fontSize: 18),),),
                            ],
                            controller: tabController,
                            indicatorColor: Colors.yellow,
                            indicatorWeight: 3,
                            indicatorPadding: EdgeInsets.symmetric(horizontal: 15),),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            padding: EdgeInsets.all(20),
                            width: 1000,
                            height: 850,
                            // decoration: BoxDecoration(
                            //   border: Border.all(
                            //     width: 1
                            //   )
                            // ),
                            child: TabBarView(children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('👉  NICEabc 안드로이드(kotlin) 개발', style: TextStyle(fontSize: 16),),
                                    SizedBox(height: 5,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 28),
                                      child: Text('P2P 투자/대출 하이브리드 앱으로 백신, 보안키패드, 위변조/난독화, 스크래핑, 공인인증서 기능 등에 대한 웹연동 처리', style: TextStyle(fontFamily: 'NanumGothic'),),
                                    ),
                                    SizedBox(height: 30,),

                                    Text('👉  NICEabc 아이폰(swift) 개발', style: TextStyle(fontSize: 16),),
                                    SizedBox(height: 5,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 28),
                                      child: Text('P2P 투자/대출 하이브리드 앱으로 보안키패드, 위변조/난독화, 스크래핑, 공인인증서 기능 등에 대한 웹 연동처리', style: TextStyle(fontFamily: 'NanumGothic'),),
                                    ),
                                    SizedBox(height: 30,),

                                    Text('👉  NICEabc 서버(Spring Framework) 개발', style: TextStyle(fontSize: 16),),
                                    SizedBox(height: 5,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 28),
                                      child: Text('Oracle DB연동 모바일 Api 개발', style: TextStyle(fontFamily: 'NanumGothic'),),
                                    ),
                                    SizedBox(height: 30,),

                                    Text('👉  NICEabc 푸시 배치서버 개발', style: TextStyle(fontSize: 16),),
                                    SizedBox(height: 5,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 28),
                                      child: Text('FCM 푸시발송 처리', style: TextStyle(fontFamily: 'NanumGothic'),),
                                    ),
                                    Spacer(),
                                    Row(
                                      children: [
                                        Image.network('https://is5-ssl.mzstatic.com/image/thumb/Purple123/v4/9c/b2/04/9cb2040d-6e06-f118-3218-e6b4ec129a10/pr_source.jpg/230x0w.jpg'),
                                        SizedBox(width: 10,),
                                        Image.network('https://is3-ssl.mzstatic.com/image/thumb/Purple123/v4/73/05/30/7305303b-2aa4-c58c-62b8-5b3f676f9bee/pr_source.jpg/230x0w.jpg'),
                                        SizedBox(width: 10,),
                                        Image.network('https://is3-ssl.mzstatic.com/image/thumb/Purple123/v4/7b/02/2c/7b022cd1-4c2c-b290-bf77-5005c425da4d/pr_source.jpg/230x0w.jpg')
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('👉  나이스지키미 안드로이드 개발', style: TextStyle(fontSize: 16),),
                                    SizedBox(height: 5,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 28),
                                      child: Text('개인 신용등급평가 하이브리드 앱으로 백신, 보안키패드, 위변조/난독화, 삼성패스 생체인증, 스크래핑, 공인인증서 기능 등에 대한 웹 연동 처리', style: TextStyle(fontFamily: 'NanumGothic'),),
                                    ),
                                    Spacer(),
                                    Row(
                                      children: [
                                        Image.network('https://is4-ssl.mzstatic.com/image/thumb/PurpleSource116/v4/a6/32/a0/a632a083-4610-49a1-7cf3-2a08c5fb0cfe/04da85e7-e675-40f9-b1fa-c5371d876594_appstore_1242x2688_01.png/230x0w.png'),
                                        SizedBox(width: 10,),
                                        Image.network('https://is2-ssl.mzstatic.com/image/thumb/PurpleSource126/v4/6f/66/b4/6f66b406-7482-35ef-7996-679c50ad4f74/fced0117-5236-4d28-869c-c46aaad8aed4_appstore_1242x2688_02.png/230x0w.png'),
                                        SizedBox(width: 10,),
                                        Image.network('https://is4-ssl.mzstatic.com/image/thumb/PurpleSource116/v4/ea/e8/34/eae83445-812f-e947-e838-47865fda1c3a/978bf053-ebd8-4408-8259-0d293f684081_appstore_1242x2688_05.png/230x0w.png'),
                                        SizedBox(width: 10,),
                                        Image.network('https://is3-ssl.mzstatic.com/image/thumb/PurpleSource126/v4/5e/79/72/5e7972ca-248d-1d3c-29df-4bb05a22f8e7/3eade3e1-77f5-4ab7-a0df-13c529736751_appstore_1242x2688_08.png/230x0w.png')
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('👉  나이스아이핀 안드로이드 개발', style: TextStyle(fontSize: 16),),
                                    SizedBox(height: 5,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 28),
                                      child: Text('주민등록번호 대체 인증 네이티브 앱으로 백신, 보안키패드, 위변조/난독화, 터치키, 삼성패스 생체인증, 목소리 인증 등에 대한 기능 유지보수', style: TextStyle(fontFamily: 'NanumGothic'),),
                                    ),
                                    Spacer(),
                                    Row(
                                      children: [
                                        Image.network('https://is3-ssl.mzstatic.com/image/thumb/Purple123/v4/59/95/04/59950437-8cce-7ad8-573c-a43be2bfb4a8/pr_source.jpg/230x0w.jpg'),
                                        SizedBox(width: 10,),
                                        Image.network('https://is1-ssl.mzstatic.com/image/thumb/Purple123/v4/ed/ef/5e/edef5e29-e9c3-d541-e82e-5bf9b20236cd/pr_source.jpg/230x0w.jpg'),
                                        SizedBox(width: 10,),
                                        Image.network('https://is4-ssl.mzstatic.com/image/thumb/PurpleSource116/v4/ea/e8/34/eae83445-812f-e947-e838-47865fda1c3a/978bf053-ebd8-4408-8259-0d293f684081_appstore_1242x2688_05.png/230x0w.png'),
                                        SizedBox(width: 10,),
                                        Image.network('https://is3-ssl.mzstatic.com/image/thumb/PurpleSource126/v4/5e/79/72/5e7972ca-248d-1d3c-29df-4bb05a22f8e7/3eade3e1-77f5-4ab7-a0df-13c529736751_appstore_1242x2688_08.png/230x0w.png')
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
                    )
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
                        }, child:
                        Text('HOME', style: TextStyle(fontSize: 18, color: page==0? Colors.black: Colors.black26),)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: TextButton(onPressed: () {
                          controller.animateTo(pageHeight[0].toDouble(), duration: Duration(seconds: 1), curve: Curves.ease);
                        }, child: Text('ABOUT ME', style: TextStyle(fontSize: 18, color: page==1? Colors.black: Colors.black26),)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 80),
                        child: TextButton(onPressed: () {
                          controller.animateTo((pageHeight[0]+pageHeight[1].toDouble()), duration: Duration(seconds: 1), curve: Curves.ease);
                        }, child: Text('PROJECT', style: TextStyle(fontSize: 18, color: page==2? Colors.black: Colors.black26),)),
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
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50,
                            child: DefaultTextStyle(
                              style: const TextStyle(
                                fontSize: 38,
                                fontFamily: 'NanumGothic',
                              ),
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText('만나서 반가워요!',
                                      speed: Duration(milliseconds: 150)),
                                ],
                                totalRepeatCount: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}



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

class _MyAppPageState extends State<MyAppPage> {

  late ScrollController controller;
  var splashView = false;
  var page = 0;
  var offset = 0;
  var offsetTop = true;
  var offsetHoho = true;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
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

      if (offset <= 1000) {
        if (page != 0) {
          setState(() {
            page = 0;
          });
        }
      } else if (offset <= 2000) {
        if (page != 1) {
          setState(() {
            page = 1;
          });
        }
      } else if (offset <= 3000) {
        if (page != 2) {
          setState(() {
            page = 2;
          });
        }
      }
    });

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
                child: ListView(
                  controller: controller,
                  children: [
                    Container(
                      height: 1000,
                      // decoration: BoxDecoration(
                      //     image: DecorationImage(
                      //         fit: BoxFit.cover,
                      //         image: AssetImage('assets/images/sky.jpg')
                      //     )
                      // ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 80),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                            SizedBox(height: 300,),
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
                                  child: Text('hoho', style: TextStyle(fontSize: 65,fontWeight: FontWeight.bold),)
                              ),
                            ),
                            SizedBox(height: 20,),
                            Text('Developer KIM JIHO', style: TextStyle(fontSize: 22),),
                            SizedBox(height: 100,),
                            Text('안녕하세요.', style: TextStyle(fontSize: 16),),
                            SizedBox(height: 8,),
                            Text('Android와 iOS개발을 주로하며 flutter를 사용한 크로스플랫폼 개발도 하고 있습니다.', style: TextStyle(fontSize: 16),),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 1000,
                      child: Center(
                        child: Text('About Me'),
                      ),
                    ),
                    Container(
                      height: 1000,
                      color: Colors.deepOrange,
                      child: Center(
                        child: Text('3 page'),
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
                          controller.animateTo(1000, duration: Duration(seconds: 1), curve: Curves.ease);
                        }, child: Text('ABOUT ME', style: TextStyle(fontSize: 18, color: page==1? Colors.black: Colors.black26),)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 80),
                        child: TextButton(onPressed: () {
                          controller.animateTo(2000, duration: Duration(seconds: 1), curve: Curves.ease);
                        }, child: Text('PORTFOLIO', style: TextStyle(fontSize: 18, color: page==2? Colors.black: Colors.black26),)),
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



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoho_portfolio_flutter/app/controller/main_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectWidget extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 60),
      height: controller.pageHeight[2].toDouble(),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 140 * 7,
            child: TabBar(
              tabs: [
                const Tab(
                  child: const Text(
                    'NICEabc',
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
                const Tab(
                  child: Text(
                    '나이스지키미',
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
                const Tab(
                  child: Text(
                    '나이스아이핀',
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
                const Tab(
                  child: Text(
                    '나이스안심송부',
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
                const Tab(
                  child: Text(
                    'MESA',
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
                const Tab(
                  child: Text(
                    'WINDMAT',
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
                const Tab(
                  child: Text(
                    'MAXPO',
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ],
              controller: controller.tabController,
              indicatorColor: Colors.yellow,
              indicatorWeight: 3,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 15),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            width: 960,
            height: 780,
            // decoration: BoxDecoration(
            //   border: Border.all(
            //     width: 1
            //   )
            // ),
            child: TabBarView(
              children: [
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
                                border: Border.all(width: 0.1),
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                  fit: BoxFit.fitHeight,
                                  image: const NetworkImage(
                                      'https://is2-ssl.mzstatic.com/image/thumb/Purple116/v4/5a/0a/08/5a0a080b-e4de-b5f8-02bf-7b912671e28f/AppIcon-0-0-1x_U007emarketing-0-0-0-10-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/230x0w.png'),
                                )),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    '👉  NICEabc 안드로이드(kotlin) 개발  -',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      await launch(
                                          'https://play.google.com/store/apps/details?id=com.nicebp.niceabc.fincent');
                                    },
                                    child: const Text('Google Play 이동'),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 28),
                                child: const Text(
                                  'P2P 투자/대출 하이브리드 앱으로 백신, 보안키패드, 위변조/난독화, 스크래핑, 공인인증서 기능 등에 대한 웹 연동 처리',
                                  style: const TextStyle(
                                      fontFamily: 'Nanum'),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    '👉  NICEabc 아이폰(swift) 개발  -',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      await launch(
                                          'https://apps.apple.com/kr/app/id1475039785');
                                    },
                                    child: Text('App Store 이동'),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Padding(
                                padding: const EdgeInsets.only(left: 28),
                                child: const Text(
                                  'P2P 투자/대출 하이브리드 앱으로 보안키패드, 위변조/난독화, 스크래핑, 공인인증서 기능 등에 대한 웹 연동 처리',
                                  style: const TextStyle(
                                      fontFamily: 'Nanum'),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                '👉  NICEabc 서버(Spring Framework) 개발',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Padding(
                                padding: const EdgeInsets.only(left: 28),
                                child: const Text(
                                  'Oracle DB연동 모바일 API 개발',
                                  style: const TextStyle(
                                      fontFamily: 'Nanum'),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                '👉  NICEabc 푸시 배치서버 개발',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Padding(
                                padding: const EdgeInsets.only(left: 28),
                                child: const Text(
                                  'FCM 푸시발송 처리',
                                  style: const TextStyle(
                                      fontFamily: 'Nanum'),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Image.network(
                            'https://is5-ssl.mzstatic.com/image/thumb/Purple123/v4/9c/b2/04/9cb2040d-6e06-f118-3218-e6b4ec129a10/pr_source.jpg/460x0w.jpg',
                            width: 230,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.network(
                              'https://is3-ssl.mzstatic.com/image/thumb/Purple123/v4/73/05/30/7305303b-2aa4-c58c-62b8-5b3f676f9bee/pr_source.jpg/460x0w.jpg',
                              width: 230),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.network(
                              'https://is3-ssl.mzstatic.com/image/thumb/Purple123/v4/7b/02/2c/7b022cd1-4c2c-b290-bf77-5005c425da4d/pr_source.jpg/460x0w.jpg',
                              width: 230)
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
                                border: Border.all(width: 0.1),
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                  fit: BoxFit.fitHeight,
                                  image: const NetworkImage(
                                      'https://is5-ssl.mzstatic.com/image/thumb/Purple116/v4/da/69/ff/da69ffa2-faf7-aba7-da02-13b58cfc52de/AppIcon-0-0-1x_U007emarketing-0-0-0-5-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/230x0w.png'),
                                )),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    '👉  나이스지키미 안드로이드 개발  -',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      await launch(
                                          'https://play.google.com/store/apps/details?id=com.mobilestudio.mycreditmanager');
                                    },
                                    child: const Text('Google Play 이동'),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Padding(
                                padding: const EdgeInsets.only(left: 28),
                                child: const Text(
                                    '개인 신용등급평가 하이브리드 앱으로 백신, 보안키패드, 위변조/난독화, 삼성패스 생체인증, 스크래핑, 공인인증서 기능 등에 대한',
                                    style: const TextStyle(
                                        fontFamily: 'Nanum')),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Padding(
                                padding: const EdgeInsets.only(left: 28),
                                child: const Text('웹 연동 처리',
                                    style: const TextStyle(
                                        fontFamily: 'Nanum')),
                              ),
                            ],
                          )
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Image.network(
                            'https://is4-ssl.mzstatic.com/image/thumb/PurpleSource116/v4/a6/32/a0/a632a083-4610-49a1-7cf3-2a08c5fb0cfe/04da85e7-e675-40f9-b1fa-c5371d876594_appstore_1242x2688_01.png/460x0w.png',
                            width: 230,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.network(
                              'https://is2-ssl.mzstatic.com/image/thumb/PurpleSource126/v4/6f/66/b4/6f66b406-7482-35ef-7996-679c50ad4f74/fced0117-5236-4d28-869c-c46aaad8aed4_appstore_1242x2688_02.png/460x0w.png',
                              width: 230),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.network(
                            'https://is4-ssl.mzstatic.com/image/thumb/PurpleSource116/v4/ea/e8/34/eae83445-812f-e947-e838-47865fda1c3a/978bf053-ebd8-4408-8259-0d293f684081_appstore_1242x2688_05.png/460x0w.png',
                            width: 230,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.network(
                            'https://is3-ssl.mzstatic.com/image/thumb/PurpleSource126/v4/5e/79/72/5e7972ca-248d-1d3c-29df-4bb05a22f8e7/3eade3e1-77f5-4ab7-a0df-13c529736751_appstore_1242x2688_08.png/460x0w.png',
                            width: 230,
                          )
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
                                border: Border.all(width: 0.1),
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                  fit: BoxFit.fitHeight,
                                  image: const NetworkImage(
                                      'https://is1-ssl.mzstatic.com/image/thumb/Purple115/v4/93/ec/0f/93ec0fa8-b696-af8f-af85-54eb27e265b0/AppIcon-2-1x_U007emarketing-0-2-85-220.png/230x0w.png'),
                                )),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    '👉  나이스아이핀 안드로이드 개발  -',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      await launch(
                                          'https://play.google.com/store/apps/details?id=com.niceid.nicemypin');
                                    },
                                    child: const Text('Google Play 이동'),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Padding(
                                padding: const EdgeInsets.only(left: 28),
                                child: const Text(
                                    '주민등록번호 대체 인증 네이티브 앱으로 백신, 보안키패드, 위변조/난독화, 터치키, 삼성패스 생체인증, 목소리 인증 등에 대한',
                                    style: const TextStyle(
                                        fontFamily: 'Nanum')),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Padding(
                                padding: const EdgeInsets.only(left: 28),
                                child: const Text('기능 유지보수',
                                    style: const TextStyle(
                                        fontFamily: 'Nanum')),
                              ),
                            ],
                          )
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Image.network(
                            'https://is3-ssl.mzstatic.com/image/thumb/Purple123/v4/59/95/04/59950437-8cce-7ad8-573c-a43be2bfb4a8/pr_source.jpg/460x0w.jpg',
                            width: 230,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.network(
                            'https://is1-ssl.mzstatic.com/image/thumb/Purple123/v4/ed/ef/5e/edef5e29-e9c3-d541-e82e-5bf9b20236cd/pr_source.jpg/460x0w.jpg',
                            width: 230,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.network(
                            'https://is2-ssl.mzstatic.com/image/thumb/Purple113/v4/d4/72/47/d4724719-c390-e2c2-dfdc-bcf54c0eb5c2/pr_source.jpg/460x0w.jpg',
                            width: 230,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.network(
                            'https://is2-ssl.mzstatic.com/image/thumb/Purple113/v4/1b/d6/c2/1bd6c221-3d91-7dbb-f942-6fe938b389d0/pr_source.jpg/460x0w.jpg',
                            width: 230,
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
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                border: Border.all(width: 0.1),
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                  fit: BoxFit.fitHeight,
                                  image: const NetworkImage(
                                      'https://is2-ssl.mzstatic.com/image/thumb/Purple125/v4/d2/38/15/d238151d-7d65-b8d7-3aa4-08bb63019dc6/AppIcon-1x_U007emarketing-0-5-0-85-220.png/230x0w.png'),
                                )),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    '👉  나이스안심송부 안드로이드 개발  -',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      await launch(
                                          'https://play.google.com/store/apps/details?id=com.nice.NiceInfoBox');
                                    },
                                    child: Text('Google Play 이동'),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Padding(
                                padding: const EdgeInsets.only(left: 28),
                                child: const Text(
                                    '스크래핑 연동 네이티브 앱으로 백신, 보안키패드, 스크래핑, 공인인증서 등에 대한 기능 유지보수',
                                    style: const TextStyle(
                                        fontFamily: 'Nanum')),
                              ),
                            ],
                          )
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Image.network(
                            'https://is5-ssl.mzstatic.com/image/thumb/Purple123/v4/bc/69/2a/bc692afd-950b-a655-0738-ba57ed066c53/pr_source.jpg/460x0w.jpg',
                            width: 230,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.network(
                            'https://is2-ssl.mzstatic.com/image/thumb/Purple123/v4/fc/50/40/fc5040df-936e-3a55-0336-a9a7e3e5d7f9/pr_source.jpg/460x0w.jpg',
                            width: 230,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.network(
                            'https://is3-ssl.mzstatic.com/image/thumb/Purple113/v4/a2/d0/23/a2d0233d-d060-4619-ca0c-e0894701495a/pr_source.jpg/460x0w.jpg',
                            width: 230,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.network(
                            'https://is4-ssl.mzstatic.com/image/thumb/Purple113/v4/d8/24/5b/d8245b3f-561a-8978-9905-90c4f68aaa33/pr_source.jpg/460x0w.jpg',
                            width: 230,
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
                          Image(
                            image:
                                const AssetImage('assets/images/mesa_icon.png'),
                            width: 100,
                            height: 100,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '👉  MESA 안드로이드 개발',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Padding(
                                padding: const EdgeInsets.only(left: 28),
                                child: const Text(
                                    '영어말하기대회 네이티브 앱으로 녹음 및 업로드 대회 참가, 랭킹시스템, 번역요청 등의 기능 개발',
                                    style: const TextStyle(
                                        fontFamily: 'Nanum')),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                '👉  MESA 서버(Spring Framework) 개발',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Padding(
                                padding: const EdgeInsets.only(left: 28),
                                child: const Text('MSSQL DB연동 모바일 API 개발',
                                    style: const TextStyle(
                                        fontFamily: 'Nanum')),
                              ),
                            ],
                          )
                        ],
                      ),
                      const Spacer(),
                      const Image(
                        image: const AssetImage('assets/images/mesa_7.png'),
                        height: 230,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Image(
                            image: const AssetImage('assets/images/mesa_2.png'),
                            width: 230,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Image(
                            image: const AssetImage('assets/images/mesa_3.png'),
                            width: 230,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Image(
                            image: const AssetImage('assets/images/mesa_4.png'),
                            width: 230,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Image(
                            image: const AssetImage('assets/images/mesa_5.png'),
                            width: 230,
                          ),
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
                          const Image(
                            image: const AssetImage('assets/images/windmat_icon.png'),
                            width: 100,
                            height: 100,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '👉  WINDMAT 안드로이드 개발',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Padding(
                                padding: const EdgeInsets.only(left: 28),
                                child: const Text('크로스팬 블루투스 원격제어 리모트컨트롤 기능 개발',
                                    style:
                                    const TextStyle(fontFamily: 'Nanum')),
                              ),
                            ],
                          )
                        ],
                      ),
                      const Spacer(),
                      const Image(
                        image: const AssetImage('assets/images/windmat_4.png'),
                        height: 230,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.4, color: Colors.grey)),
                              child: const Image(
                                image:
                                const AssetImage('assets/images/windmat_1.png'),
                                width: 230,
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.4, color: Colors.grey)),
                              child: const Image(
                                image:
                                const AssetImage('assets/images/windmat_2.png'),
                                width: 230,
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                              child: const Image(
                            image: const AssetImage('assets/images/windmat_3.png'),
                            width: 230,
                          )),
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
                          const Image(
                            image: const AssetImage('assets/images/mexpo_icon.png'),
                            width: 100,
                            height: 100,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '👉  MEXPO 안드로이드 개발',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Padding(
                                padding: const EdgeInsets.only(left: 28),
                                child: const Text(
                                    '모바일엑스포 네이티브 앱으로 전시회 업체의 입점, 결제, 홍보 등의 기능 개발',
                                    style:
                                    const TextStyle(fontFamily: 'Nanum')),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                '👉  MEXPO 서버(Spring Framework) 개발',
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Padding(
                                padding: const EdgeInsets.only(left: 28),
                                child: const Text('MSSQL DB연동 모바일 API 개발',
                                    style:
                                    const TextStyle(fontFamily: 'Nanum')),
                              ),
                            ],
                          )
                        ],
                      ),
                      const Spacer(),
                      const Image(
                        image: const AssetImage('assets/images/mexpo_6.png'),
                        height: 230,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Image(
                            image: const AssetImage('assets/images/mexpo_1.png'),
                            width: 230,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Image(
                            image: const AssetImage('assets/images/mexpo_2.png'),
                            width: 230,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Image(
                            image: const AssetImage('assets/images/mexpo_3.png'),
                            width: 230,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Image(
                            image: const AssetImage('assets/images/mexpo_4.png'),
                            width: 230,
                          ),
                          // SizedBox(width: 10,),
                          // Image(image: AssetImage('assets/images/mesa_6.png'), width: 230,),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
              controller: controller.tabController,
            ),
          )
        ],
      ),
    );
  }
}

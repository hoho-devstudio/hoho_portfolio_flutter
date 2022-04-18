import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

class MainController extends GetxController with GetTickerProviderStateMixin{

  late ScrollController scrollerController;
  late TabController tabController;
  late TabController kbTabController;
  late TabController kbItemTabController;
  late ScrollController kbUserScrollController;
  late ScrollController kbItemScrollController;
  late ScrollController kbNotiScrollController;
  late ScrollController kbInfoScrollController;
  late PageController kbItemPageController;

  var pageHeight = [900, 420, 1100, 1000, 500];
  var offset = 0;
  var kbPageHeight = [0, 350, 1150, 1890, 2330, 2500];
  var kbOffset = [0, 0, 0, 0];
  var kbItemPage = 0;
  var kbItemChanging = false;

  var _kbUserMoney = [100000.obs, 0.obs, 0.obs];
  get kbUserMoney1 => this._kbUserMoney[0].value;
  get kbUserMoney2 => this._kbUserMoney[1].value;
  get kbUserMoney3 => this._kbUserMoney[2].value;
  set kbUserMoney1(value) => this._kbUserMoney[0].value = value;
  set kbUserMoney2(value) => this._kbUserMoney[1].value = value;
  set kbUserMoney3(value) => this._kbUserMoney[2].value = value;

  var _kbTopHeight = [80.obs, 80.obs, 80.obs, 80.obs];
  get kbUserTopHeight => this._kbTopHeight[0].value;
  get kbItemTopHeight => this._kbTopHeight[1].value;
  get kbNotiTopHeight => this._kbTopHeight[2].value;
  get kbInfoTopHeight => this._kbTopHeight[3].value;
  set kbUserTopHeight(value) => this._kbTopHeight[0].value = value;
  set kbItemTopHeight(value) => this._kbTopHeight[1].value = value;
  set kbNotiTopHeight(value) => this._kbTopHeight[2].value = value;
  set kbInfoTopHeight(value) => this._kbTopHeight[3].value = value;

  var _kbTopTextSize = [26.0.obs, 26.0.obs, 26.0.obs, 26.0.obs];
  get kbUserTopTextSize => this._kbTopTextSize[0].value;
  get kbItemTopTextSize => this._kbTopTextSize[1].value;
  get kbNotiTopTextSize => this._kbTopTextSize[2].value;
  get kbInfoTopTextSize => this._kbTopTextSize[3].value;
  set kbUserTopTextSize(value) => this._kbTopTextSize[0].value = value;
  set kbItemTopTextSize(value) => this._kbTopTextSize[1].value = value;
  set kbNotiTopTextSize(value) => this._kbTopTextSize[2].value = value;
  set kbInfoTopTextSize(value) => this._kbTopTextSize[3].value = value;

  var _kbUserImageSize = 46.0.obs;
  get kbUserImageSize => this._kbUserImageSize.value;
  set kbUserImageSize(value) => this._kbUserImageSize.value = value;

  var _kbItemScrollMove = false.obs;
  get kbItemScrollMove => this._kbItemScrollMove.value;
  set kbItemScrollMove(value) => this._kbItemScrollMove.value = value;

  var _splashStart = false.obs;
  get splashStart => this._splashStart.value;
  set splashStart(value) => this._splashStart.value = value;

  var _splashText = true.obs;
  get splashText => this._splashText.value;
  set splashText(value) => this._splashText.value = value;

  var _splashView = true.obs;
  get splashView => this._splashView.value;
  set splashView(value) => this._splashView.value = value;

  var _page = 0.obs;
  get page => this._page.value;
  set page(value) => this._page.value = value;

  var _offsetTop = true.obs;
  get offsetTop => this._offsetTop.value;
  set offsetTop(value) => this._offsetTop.value = value;

  var _offsetHoho = true.obs;
  get offsetHoho => this._offsetHoho.value;
  set offsetHoho(value) => this._offsetHoho.value = value;

  var _turns = 0.0.obs;
  get turns => this._turns.value;
  set turns(value) => this._turns.value = value;

  var count = 0;
  void changeRotation() {
    if (count > 3) {
      count = 0;
      Future.delayed(Duration(seconds: 2), () {
        changeRotation();
      });
      return;
    }
    count++;

    if (turns == 0.045) {
      turns = 0.0;
    } else {
      turns = 0.045;
    }
  }

  // kakaobank
  var _kbTabIndex = 0.obs;
  get kbTabIndex => this._kbTabIndex.value;
  set kbTabIndex(value) => this._kbTabIndex.value = value;

  var _loginProgress = false.obs;
  get loginProgress => this._loginProgress.value;
  set loginProgress(value) => this._loginProgress.value = value;

  var _loginView = true.obs;
  get loginView => this._loginView.value;
  set loginView(value) => this._loginView.value = value;

  var _sampleView = false.obs;
  get sampleView => this._sampleView.value;
  set sampleView(value) => this._sampleView.value = value;

  var _sampleText = 'sample'.obs;
  get sampleText => this._sampleText.value;
  set sampleText(value) => this._sampleText.value = value;

  var _scrollerIsAble = true.obs;
  get scrollerIsAble => this._scrollerIsAble.value;
  set scrollerIsAble(value) => this._scrollerIsAble.value = value;

  @override
  void onInit() {
    scrollerController = ScrollController(
      // initialScrollOffset: (pageHeight[0] + pageHeight[1] + pageHeight[2]).toDouble()
    );
    kbUserScrollController = ScrollController();
    kbItemScrollController = ScrollController();
    kbNotiScrollController = ScrollController();
    kbInfoScrollController = ScrollController();

    tabController = TabController(length: 7, vsync: this, initialIndex: 0);
    kbTabController = TabController(length: 4, vsync: this, initialIndex: 0);
    kbTabController.addListener(() {
      kbTabIndex = kbTabController.index;
    });
    kbItemTabController = TabController(length: 6, vsync: this, initialIndex: 0);
    kbItemTabController.addListener(() {
      kbItemPage = kbItemTabController.index;
      kbItemChanging = kbItemTabController.indexIsChanging;
      if (kbItemChanging && !kbItemScrollMove) {
        kbItemScrollMove = true;
        if (kbItemPage == 0) {
          kbItemScrollController.animateTo(kbPageHeight[0].toDouble(), duration: const Duration(seconds: 1), curve: Curves.ease).then((value) => kbItemScrollMove = false);
        } else if (kbItemPage == 1) {
          kbItemScrollController.animateTo(kbPageHeight[1].toDouble(), duration: const Duration(seconds: 1), curve: Curves.ease).then((value) => kbItemScrollMove = false);
        } else if (kbItemPage == 2) {
          kbItemScrollController.animateTo(kbPageHeight[2].toDouble(), duration: const Duration(seconds: 1), curve: Curves.ease).then((value) => kbItemScrollMove = false);
        } else if (kbItemPage == 3) {
          kbItemScrollController.animateTo(kbPageHeight[3].toDouble(), duration: const Duration(seconds: 1), curve: Curves.ease).then((value) => kbItemScrollMove = false);
        } else if (kbItemPage == 4) {
          kbItemScrollController.animateTo(kbPageHeight[4].toDouble(), duration: const Duration(seconds: 1), curve: Curves.ease).then((value) => kbItemScrollMove = false);
        } else if (kbItemPage == 5) {
          kbItemScrollController.animateTo(kbPageHeight[5].toDouble(), duration: const Duration(seconds: 1), curve: Curves.ease).then((value) => kbItemScrollMove = false);
        }
      }

    });
    kbItemPageController = PageController(initialPage: 0);

    scrollerController.addListener(() {
      offset = scrollerController.offset.toInt();

      if (offset == 0) {
        offsetTop = true;
      } else {
        if (offsetTop == true) {
          offsetTop = false;
        }
      }

      if (offset < 30 && !offsetHoho) {
        offsetHoho = true;
      } else if (offset > 30 && offsetHoho) {
        offsetHoho = false;
      }

      if (offset < pageHeight[0]) {
        if (page != 0) {
          page = 0;
        }
      } else if (offset < pageHeight[0] + pageHeight[1]) {
        if (page != 1) {
          page = 1;
        }
      } else if (offset < pageHeight[0] + pageHeight[1] + pageHeight[2]) {
        if (page != 2) {
          page = 2;
        }
      } else if (offset < pageHeight[0] + pageHeight[1] + pageHeight[2] + pageHeight[3]) {
        if (page != 3) {
          page = 3;
        }
      } else if (offset < pageHeight[0] + pageHeight[1] + pageHeight[2] + pageHeight[3] + pageHeight[4]) {
        if (page != 4) {
          page = 4;
        }
      }
    });

    kbUserScrollController.addListener(() {
      kbOffset[0] = kbUserScrollController.offset.toInt();
      if (80 - kbOffset[0] > 60) {
        kbUserTopHeight = 80 - kbOffset[0];
      } else {
        kbUserTopHeight = 60;
      }

      if (kbUserTopHeight >= 80) {
        kbUserTopTextSize = 26;
        kbUserImageSize = 46;
      } else if (kbUserTopHeight >= 65) { // 70 ~ 79
        kbUserTopTextSize = 26 - kbOffset[0]/3;
        kbUserImageSize = 46 - kbOffset[0]/2;
      } else {
        kbUserTopTextSize = 21;
        kbUserImageSize = 38.5;
      }
    });

    kbNotiScrollController.addListener(() {
      kbOffset[2] = kbNotiScrollController.offset.toInt();
      if (80 - kbOffset[2] > 60) {
        kbNotiTopHeight = 80 - kbOffset[2];
      } else {
        kbNotiTopHeight = 60;
      }

      if (kbNotiTopHeight >= 80) {
        kbNotiTopTextSize = 26;
      } else if (kbNotiTopHeight >= 65) { // 70 ~ 79
        kbNotiTopTextSize = 26 - kbOffset[2]/3;
      } else {
        kbNotiTopTextSize = 21;
      }
    });

    kbInfoScrollController.addListener(() {
      kbOffset[3] = kbInfoScrollController.offset.toInt();
      if (80 - kbOffset[3] > 60) {
        kbInfoTopHeight = 80 - kbOffset[3];
      } else {
        kbInfoTopHeight = 60;
      }

      if (kbInfoTopHeight >= 80) {
        kbInfoTopTextSize = 26;
      } else if (kbInfoTopHeight >= 65) { // 70 ~ 79
        kbInfoTopTextSize = 26 - kbOffset[3]/3;
      } else {
        kbInfoTopTextSize = 21;
      }
    });

    kbItemScrollController.addListener(() {
      kbOffset[1] = kbItemScrollController.offset.toInt();

      if (80 - kbOffset[1] > 0) {
        kbItemTopHeight = 80 - kbOffset[1];
      } else {
        kbItemTopHeight = 0;
      }

      if (kbItemScrollMove) return;

      if (kbOffset[1] <= kbPageHeight[1]) {
        if (kbItemPage != 0) {
          kbItemTabController.index = 0;
        }
      } else if (kbOffset[1] <= kbPageHeight[2]) {
        if (kbItemPage != 1) {
          kbItemTabController.index = 1;
        }
      } else if (kbOffset[1] <= kbPageHeight[3]) {
        if (kbItemPage != 2) {
          kbItemTabController.index = 2;
        }
      } else if (kbOffset[1] <= kbPageHeight[4]) {
        if (kbItemPage != 3) {
          kbItemTabController.index = 3;
        }
      } else if (kbOffset[1] <= kbPageHeight[5]) {
        if (kbItemPage != 4) {
          kbItemTabController.index = 4;
        }
      } else if (kbOffset[1] <= kbPageHeight[5] + 500) {
        if (kbItemPage != 5) {
          kbItemTabController.index = 5;
        }
      }

    });

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Future.delayed(Duration(milliseconds: 1500), () {
        splashStart = true;
        changeRotation();
      });
    });

    kbUserMoney1 = Random().nextInt(3000000000) + 30000000000;
    super.onInit();
  }

  @override
  void onClose() {
    scrollerController.dispose();
    tabController.dispose();
    kbTabController.dispose();
    kbItemTabController.dispose();
    kbUserScrollController.dispose();
    kbItemScrollController.dispose();
    kbNotiScrollController.dispose();
    kbInfoScrollController.dispose();
    kbItemPageController.dispose();
    super.onClose();
  }

}
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController with GetTickerProviderStateMixin{

  late ScrollController scrollerController;
  late TabController tabController;
  late TabController kbTabController;
  late TabController kbItemTabController;
  late ScrollController kbItemScrollController;
  late PageController kbItemPageController;

  var pageHeight = [900, 420, 1100, 1000, 500];
  var offset = 0;
  var kbPageHeight = [0, 350, 1150, 1890, 2330, 2550];
  var kbOffset = 0;
  var kbItemPage = 0;
  var kbItemChanging = false;

  var _kbItemTopMargin = 80.obs;
  get kbItemTopMargin => this._kbItemTopMargin.value;
  set kbItemTopMargin(value) => this._kbItemTopMargin.value = value;

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

  var _loginView = false.obs;
  get loginView => this._loginView.value;
  set loginView(value) => this._loginView.value = value;

  @override
  void onInit() {
    scrollerController = ScrollController(
      // initialScrollOffset: (pageHeight[0] + pageHeight[1] + pageHeight[2]).toDouble()
    );
    kbItemScrollController = ScrollController();
    tabController = TabController(length: 7, vsync: this, initialIndex: 0);
    kbTabController = TabController(length: 4, vsync: this, initialIndex: 1);
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

    kbItemScrollController.addListener(() {
      kbOffset = kbItemScrollController.offset.toInt();

      if (kbItemTopMargin > 0 && 80 - kbOffset > 0) {
        kbItemTopMargin = 80 - kbOffset;
      } else if (kbItemTopMargin == 0 && 80 - kbOffset > 0) {
        kbItemTopMargin = 80 - kbOffset;
      } else {
        kbItemTopMargin = 0;
      }

      if (kbItemScrollMove) return;

      if (kbOffset <= kbPageHeight[1]) {
        if (kbItemPage != 0) {
          kbItemTabController.index = 0;
        }
      } else if (kbOffset <= kbPageHeight[2]) {
        if (kbItemPage != 1) {
          kbItemTabController.index = 1;
        }
      } else if (kbOffset <= kbPageHeight[3]) {
        if (kbItemPage != 2) {
          kbItemTabController.index = 2;
        }
      } else if (kbOffset <= kbPageHeight[4]) {
        if (kbItemPage != 3) {
          kbItemTabController.index = 3;
        }
      } else if (kbOffset <= kbPageHeight[5]) {
        if (kbItemPage != 4) {
          kbItemTabController.index = 4;
        }
      } else if (kbOffset <= kbPageHeight[5] + 500) {
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

    super.onInit();
  }

  @override
  void onClose() {
    scrollerController.dispose();
    tabController.dispose();
    kbTabController.dispose();
    kbItemTabController.dispose();
    kbItemScrollController.dispose();
    kbItemPageController.dispose();
    super.onClose();
  }

}
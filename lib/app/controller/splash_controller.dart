import 'package:get/get.dart';

class SplashController extends GetxController {

  var _isFinished = false.obs;
  get isFinished => this._isFinished.value;
  set isFinished(value) => this._isFinished.value = value;

}
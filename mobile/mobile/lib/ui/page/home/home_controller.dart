import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile/core/core.dart';

class HomeController extends GetxController
    with GetTickerProviderStateMixin
    implements Core {
  late Rx<PageController> pageController;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  @override
  void onReady() {
    ready();
    super.onReady();
  }

  void change() {}

  @override
  void init() {
    pageController = PageController().obs;
  }

  @override
  void ready() async {}
}

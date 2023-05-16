import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile/core/core.dart';

class HomeController extends GetxController
    with GetTickerProviderStateMixin
    implements Core {
  late Rx<PageController> pageController;

  late RxList<Map<String, dynamic>> datas;

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

    datas = <Map<String, dynamic>>[].obs;
  }

  @override
  void ready() async {
    datas.value = [
      {'nama': 'fajar'},
    ];
  }

  void onChange() {
    datas[0]['nama'] = 'doni yuli';
  }
}

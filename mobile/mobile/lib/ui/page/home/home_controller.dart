import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile/core/core.dart';

class HomeController extends GetxController
    with GetTickerProviderStateMixin
    implements Core {
  late RxString location;

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
    location = ''.obs;
  }

  @override
  void ready() async {
    location.value = 'Jl. Banjarsari RT 01/09';
  }

  void onChange() {}
}

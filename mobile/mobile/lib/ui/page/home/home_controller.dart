import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:mobile/controller.dart';

class HomeController extends GetxController
    with GetTickerProviderStateMixin
    implements Controller {
  late Rx<AnimationController> animationController;
  late Rx<Animation> animation;

  @override
  void onInit() {
    super.onInit();

    init();
  }

  @override
  void onReady() {
    super.onReady();

    ready();
  }

  @override
  FutureOr<void> init() async {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    ).obs;

    animation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, 200),
    )
        .animate(
          animationController.value,
        )
        .obs;
  }

  @override
  FutureOr<void> ready() async {
    await Future.delayed(const Duration(seconds: 2));

    animationController.value.forward();
  }
}

class ItemModel {
  String? idItem;
  int? priceItem;

  ItemModel({this.idItem, this.priceItem});

  factory ItemModel.fromJson(Map map) {
    return ItemModel(
      idItem: map['id_car'] ?? '0',
      priceItem: map['price'] ?? 0,
    );
  }
}

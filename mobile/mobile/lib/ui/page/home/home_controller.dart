import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  late RxBool onLoadModel;
  late RxList<ItemModel> itemModels;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  init() async {
    onLoadModel = true.obs;
    itemModels = <ItemModel>[].obs;
  }

  @override
  void onReady() {
    super.onReady();

    ready();
  }

  ready() async {
    await Future.delayed(const Duration(seconds: 2));
    onLoadModel.value = false;
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

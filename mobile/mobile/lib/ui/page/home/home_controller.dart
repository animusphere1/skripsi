import 'package:get/get.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  late RxBool isLoadItem;

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

  init() async {
    isLoadItem = true.obs;
  }

  ready() async {
    await Future.delayed(const Duration(seconds: 5));

    isLoadItem.value = false;
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

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile/core/cart/cart_controller.dart';

class CheckoutController extends GetxController {
  late Rx<CartModel> cartModel;

  late Rx<PageController> pageController;
  late RxInt page = 0.obs;
  late RxString pembayaranYandDipilih;

  late RxList<int> pageDone;

  @override
  void onInit() {
    super.onInit();

    cartModel = CartModel().obs;
    pageController = PageController().obs;
    pembayaranYandDipilih = ''.obs;
  }

  @override
  void onReady() {
    super.onReady();

    cartModel.value = Get.put<CartController>(CartController()).cartModel.value;
  }

  void change() {
    cartModel.value = CartModel(price: 20000);
  }

  void pilihPembayaran(String bank) {}
}

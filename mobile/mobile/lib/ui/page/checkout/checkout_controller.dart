import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/core/cart/cart_controller.dart';
import 'package:mobile/routes.dart';

class CheckoutController extends GetxController {
  late Rx<CartModel> cartModel;

  late Rx<PageController> pageController = PageController().obs;
  late RxInt page = 0.obs;
  late RxString pembayaranYandDipilih;

  late RxString tanggal;
  late RxString jam;

  late RxList<int> pageDone;

  late RxBool isLoad = false.obs;
  late RxBool isDone = false.obs;

  @override
  void onInit() {
    super.onInit();
    cartModel = CartModel().obs;
    pembayaranYandDipilih = ''.obs;
    tanggal = ''.obs;
    jam = ''.obs;
    isLoad = false.obs;
    isLoad = false.obs;
  }

  @override
  void onReady() {
    super.onReady();

    cartModel.value = Get.put<CartController>(CartController()).cartModel.value;
  }

  void pilihTanggal(String dateTime) {
    tanggal.value = dateTime;
  }

  void pilihJam(String time) {
    jam.value = time;
  }

  void change(CartModel cart) {
    cartModel.value = cart;
  }

  void pilihPembayaran(String bank) {
    pembayaranYandDipilih.value = bank;
  }

  Future<void> bayar() async {
    await Future.delayed(const Duration(seconds: 2));

    if (page.value == 2) {
      if (pembayaranYandDipilih.value != '' &&
          tanggal.value != '' &&
          jam.value != '') {
        isLoad.value = true;

        await Future.delayed(const Duration(seconds: 2));

        isDone.value = true;

        if (isDone.value) {
          Get.toNamed(RouteGenerator.routePembayaran);
        }

        await Future.delayed(const Duration(seconds: 2));
        isLoad.value = false;
      } else {}
    } else {}
  }
}

import 'package:get/get.dart';

class CartController extends GetxController {
  late Rx<CartModel> cartModel;

  @override
  void onInit() {
    super.onInit();

    cartModel = CartModel(price: 0).obs;
  }

  Future<void> onChange(int price, String nameTrip) async {
    cartModel.value = CartModel(
      price: price,
      nameTrip: nameTrip,
    );
  }
}

class CartModel {
  int? price;
  String? nameTrip;

  CartModel({this.price, this.nameTrip});
}

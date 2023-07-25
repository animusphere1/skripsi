import 'package:get/get.dart';

class LocationController extends GetxController {
  late RxString address;

  void init() {
    address = "".obs;
  }

  @override
  void onInit() {
    super.onInit();

    init();
  }

  Future<void> initAddress(String alamat) async {
    await Future.delayed(const Duration(seconds: 10));

    address.value = alamat;
  }
}

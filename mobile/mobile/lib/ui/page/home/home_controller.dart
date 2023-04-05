import 'package:get/get.dart';

class HomeController extends GetxController {
  late RxBool isLoading;

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

  init() async {
    isLoading = true.obs;
  }

  ready() async {
    await Future.delayed(const Duration(seconds: 2));

    isLoading.value = false;
  }
}

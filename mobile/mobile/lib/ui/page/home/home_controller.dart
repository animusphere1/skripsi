import 'package:get/get.dart';
import 'package:mobile/core/core.dart';

class HomeController extends GetxController implements Core {
  late RxBool isLoading;
  late RxList<String> namaSaya;

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

  void change() {
    namaSaya[0] = namaSaya[0] + 20.toString();
  }

  @override
  void init() {
    namaSaya = <String>[].obs;
  }

  @override
  void ready() async {
    namaSaya.value = [];

    if (namaSaya.isEmpty) {
      for (var i = 0; i < 10; i++) {
        await Future.delayed(const Duration(seconds: 2));
        namaSaya.add(i.toString());
      }
    }
  }
}

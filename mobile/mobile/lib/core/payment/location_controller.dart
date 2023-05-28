import 'package:get/get.dart';
import 'package:mobile/core/core.dart';

class LocationController extends GetxController implements Core {
  late RxString address;

  @override
  void init() {
    address = "".obs;
  }

  @override
  void ready() {
    // TODO: implement ready
    address.value = "Banjarsari";
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    init();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    ready();
  }
}

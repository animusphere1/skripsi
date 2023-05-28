import 'package:get/get.dart';
import 'package:mobile/core/payment/location_controller.dart';
import 'package:mobile/ui/page/home/home_controller.dart';

class Injector extends Bindings {
  static final Injector instance = Injector();

  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => LocationController(), fenix: true);
  }
}

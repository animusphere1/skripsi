import 'dart:async';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobile/core/core.dart';

class DateController extends GetxController {
  late RxString hari;

  @override
  void onInit() {
    hari = ''.obs;

    super.onInit();
  }

  @override
  void onReady() async {
    var dateNow = DateTime.now();
    var date = DateFormat('EEEE').format(dateNow);

    await Future.delayed(const Duration(seconds: 2));

    hari.value = date.toString();
    super.onReady();
  }
}

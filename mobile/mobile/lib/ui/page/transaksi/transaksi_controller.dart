import 'package:get/get.dart';
import 'package:mobile/ui/models/transaksi_model.dart';

class TransaksiController extends GetxController {
  late RxList<TransaksiModel> transaksiModels;

  @override
  void onInit() {
    super.onInit();

    transaksiModels = <TransaksiModel>[].obs;
  }

  @override
  void onReady() {
    super.onReady();

    for (var i = 0; i < 10; i++) {
      transaksiModels.add(TransaksiModel());
    }
  }

  Future<void> dapatkanLagiAtauMuatUlang() async {
    for (var i = 0; i < 10; i++) {
      transaksiModels.add(TransaksiModel());
    }
  }
}

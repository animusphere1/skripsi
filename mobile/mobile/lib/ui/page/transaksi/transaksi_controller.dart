import 'package:get/get.dart';
import 'package:mobile/ui/models/transaksi_model.dart';

class TransaksiController extends GetxController {
  late RxList<TransaksiModel> transaksiModels;

  late RxBool ngeloadData;

  @override
  void onInit() {
    super.onInit();
    ngeloadData = true.obs;
    transaksiModels = <TransaksiModel>[].obs;
  }

  @override
  void onReady() async {
    super.onReady();

    for (var i = 0; i < 10; i++) {
      transaksiModels.add(TransaksiModel());
    }

    await Future.delayed(const Duration(seconds: 2));

    ngeloadData.value = false;
  }

  Future<void> dapatkanLagiAtauMuatUlang() async {
    for (var i = 0; i < 10; i++) {
      transaksiModels.add(TransaksiModel());
    }
  }
}

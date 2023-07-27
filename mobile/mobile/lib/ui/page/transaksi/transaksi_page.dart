import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mobile/main.dart';
import 'package:mobile/ui/page/transaksi/transaksi_controller.dart';
import 'package:mobile/ui/utils/controller.dart';

import '../../../routes.dart';
import '../../utils/fonts.dart';
import '../../utils/size.dart';
import '../../models/transaksi_model.dart';
import '../../utils/extension/extension_currency.dart';

class TransaksiPage extends StatelessWidget {
  const TransaksiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<TransaksiController>(
        init: TransaksiController(),
        builder: (controller) {
          return ScrollConfiguration(
            behavior: RemoveScrollGlow(),
            child: SafeArea(
              child: Scaffold(
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _appBar(context),
                    controller.transaksiModels.isNotEmpty
                        ? Expanded(
                            child: RefreshIndicator(
                              onRefresh: () async {
                                await controller.dapatkanLagiAtauMuatUlang();
                              },
                              child: SingleChildScrollView(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 20,
                                ),
                                child: Column(
                                  children: [
                                    ...List.generate(
                                      controller.transaksiModels.length,
                                      (index) => _itemTransaksi(context),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: widthSize(context) * 0.8,
                                child: Text(
                                  'Tidak Ada Transaksi Berlangsung',
                                  textAlign: TextAlign.center,
                                  style: googleFontsNunito().copyWith(
                                    color: Colors.grey.shade400,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _itemTransaksi(BuildContext context,
      {TransaksiModel? transaksiModel}) {
    return Container(
      width: widthSize(context),
      margin: const EdgeInsets.only(
        bottom: 15,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
        border: Border.all(
          color: Colors.grey.withOpacity(0.3),
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Ionicons.car,
            color: Colors.grey.shade400,
            size: 20,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Jeep Tawangmangu',
                style: googleFontsNunito().copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Text(
                  'Sudah Dibayar',
                  style: googleFontsNunito().copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _nomerVaWidget('902991920032'),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: Colors.grey.shade200,
              thickness: 0.5,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Nama Customer',
                style: googleFontsNunito().copyWith(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              Text(
                'Fajar Bagus Widiarno',
                style: googleFontsNunito().copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Nama Trip',
                style: googleFontsNunito().copyWith(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              Text(
                'Short Trip B',
                style: googleFontsNunito().copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tanggal',
                style: googleFontsNunito().copyWith(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              Text(
                '29-09-2022',
                style: googleFontsNunito().copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tanggal',
                style: googleFontsNunito().copyWith(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              Text(
                '29-09-2022',
                style: googleFontsNunito().copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Jam',
                style: googleFontsNunito().copyWith(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              Text(
                '13.03',
                style: googleFontsNunito().copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: Colors.grey.shade200,
              thickness: 0.5,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Bayar',
                style: googleFontsNunito().copyWith(
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              Text(
                375000.toRupiah(),
                style: googleFontsNunito().copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _nomerVaWidget(String nomerVa) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Nomer VA',
          style: googleFontsNunito().copyWith(
            color: Colors.grey.shade500,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
        Row(
          children: [
            Text(
              '902991920032',
              style: googleFontsNunito().copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () async {
                await Clipboard.setData(
                  const ClipboardData(text: "902991920032"),
                );
              },
              child: Icon(
                Ionicons.copy,
                color: Colors.grey.shade300,
                size: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _appBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: heightSize(context) * 0.1,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: widthSize(context) * 0.2,
            child: GestureDetector(
              onTap: () async {
                await Get.toNamed(RouteGenerator.routeHome);
              },
              child: Text(
                'Back',
                style: googleFontsNunito().copyWith(
                  color: Colors.grey.shade600,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              'Transaksi',
              textAlign: TextAlign.center,
              style: googleFontsNunito().copyWith(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: widthSize(context) * 0.2,
          ),
        ],
      ),
    );
  }
}

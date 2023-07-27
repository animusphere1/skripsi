import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobile/routes.dart';
import 'package:mobile/ui/models/invoice_model.dart';

import '../../utils/fonts.dart';
import '../../utils/size.dart';

class KodePemabayaranPage extends StatelessWidget {
  final InvoiceModel invoiceModel;

  const KodePemabayaranPage({super.key, required this.invoiceModel});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _appBar(context),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    _kodePembayaranWidget(context),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () async {
                        await Get.toNamed(RouteGenerator.routeHome);
                      },
                      child: Container(
                        width: widthSize(context),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'OK',
                            style: googleFontsNunito().copyWith(
                              color: Theme.of(context).backgroundColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _kodePembayaranWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Kode Pembayaran :',
            style: googleFontsNunito().copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '902991920032',
                  style: googleFontsNunito().copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await Clipboard.setData(
                      const ClipboardData(text: "902991920032"),
                    );
                  },
                  child: const Icon(
                    Icons.copy,
                    size: 17,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Bayar Via Bank :',
                style: googleFontsNunito().copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade500,
                ),
              ),
              Text(
                'BCA',
                style: googleFontsNunito().copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Bayar Sebelum Tanggal :',
                style: googleFontsNunito().copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade500,
                ),
              ),
              Text(
                '21-11-2023',
                style: googleFontsNunito().copyWith(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ],
      ),
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
              'Kode Pembayaran',
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

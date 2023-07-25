import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mobile/main.dart';
import 'package:mobile/ui/page/checkout/checkout_controller.dart';
import 'package:mobile/ui/utils/fonts.dart';
import 'package:mobile/ui/utils/size.dart';
import '../../utils/extension/extensions.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> timelines = ["Detail", "Pembayaran", "Review"];

    return GetX<CheckoutController>(
      init: CheckoutController(),
      builder: (controller) {
        List<Widget> pages = [
          _pageViewDetail(context, controller),
          _pagePembayaran(context, controller),
          _pageCheckKembali(context, controller),
        ];

        return ScrollConfiguration(
          behavior: RemoveScrollGlow(),
          child: SafeArea(
            child: Scaffold(
              body: Stack(
                children: [
                  SizedBox(
                    height: heightSize(context),
                    child: PageView.builder(
                      controller: controller.pageController.value,
                      onPageChanged: (value) {
                        controller.page.value = value;
                      },
                      // physics: const NeverScrollableScrollPhysics(),
                      itemCount: pages.length,
                      itemBuilder: (context, index) {
                        return pages[index];
                      },
                    ),
                  ),
                  _appBar(context, timelines, controller),
                  _navigationTap(context, controller),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _pageViewDetail(
    BuildContext context,
    CheckoutController checkoutController,
  ) {
    return Container(
      padding: EdgeInsets.only(
        top: heightSize(context) * 0.27,
        right: 20,
        left: 20,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pilih tanggal yang kamu ingikan',
              style: googleFontsNunito().copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'Pilih tanggal dan jam sesuai dengan keinginan kamu, Sesuaikan dengan jam sengang kamu',
              style: googleFontsNunito().copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 20),
            _title('Pilih tanggal'),
            const SizedBox(height: 7),
            GestureDetector(
              onTap: () async {
                var date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(
                    const Duration(days: 3),
                  ),
                );

                var dateFormat = DateFormat("dd-MM-yyyy");
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                  border: Border.all(
                    color: Colors.grey.shade200,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Pilih tanggal',
                        style: googleFontsNunito().copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: widthSize(context) * 0.1,
                      child: Icon(
                        Ionicons.calendar,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            _title('Pilih jam'),
            const SizedBox(height: 7),
            GestureDetector(
              onTap: () async {
                await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay(
                    hour: DateTime.now().hour,
                    minute: DateTime.now().minute,
                  ),
                );
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                  border: Border.all(
                    color: Colors.grey.shade200,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Pilih jam',
                        style: googleFontsNunito().copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: widthSize(context) * 0.1,
                      child: Icon(
                        Ionicons.time,
                        color: Colors.grey.shade500,
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

  Widget _pagePembayaran(BuildContext context, CheckoutController controller) {
    return Container(
      padding: EdgeInsets.only(
        top: heightSize(context) * 0.27,
        right: 20,
        left: 20,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pilih metode pembayaran',
              style: googleFontsNunito().copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'Mohon maaf hanya tersedia ini saja',
              style: googleFontsNunito().copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 20),
            ...['BRI', 'BCA', 'BNI'].map(
              (e) => GestureDetector(
                onTap: () {
                  controller.pembayaranYandDipilih.value = e;
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(
                      color: e == controller.pembayaranYandDipilih.value
                          ? Colors.blue
                          : Colors.grey.shade300,
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        e,
                        style: googleFontsNunito().copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _pageCheckKembali(
    BuildContext context,
    CheckoutController controller,
  ) {
    return Container(
      padding: EdgeInsets.only(
        top: heightSize(context) * 0.27,
        right: 20,
        left: 20,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mohon check kembali transaksi anda',
              style: googleFontsNunito().copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'Apabila ada kendala bisa hubungin admin via halaman bantuan',
              style: googleFontsNunito().copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pembayaran via',
                        style: googleFontsNunito().copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'Edit',
                        style: googleFontsNunito().copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Bank',
                        style: googleFontsNunito().copyWith(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        controller.pembayaranYandDipilih.value,
                        style: googleFontsNunito().copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Detail Transaksi',
                        style: googleFontsNunito().copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'Edit',
                        style: googleFontsNunito().copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nama Driver',
                        style: googleFontsNunito().copyWith(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Jeep Tawangmangu',
                        style: googleFontsNunito().copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nama Trip',
                        style: googleFontsNunito().copyWith(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        controller.cartModel.value.nameTrip!,
                        style: googleFontsNunito().copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: googleFontsNunito().copyWith(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        controller.cartModel.value.price!.toRupiah(),
                        style: googleFontsNunito().copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _appBar(
    BuildContext context,
    List<String> timelines,
    CheckoutController controller,
  ) {
    return Column(
      children: [
        Container(
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
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    'Cancel',
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
                  'Checkout',
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
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: heightSize(context) * 0.12,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.withOpacity(0.3),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: timelines
                .map(
                  (e) => Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.page.value ==
                                  double.parse(
                                    timelines
                                        .indexWhere((element) => element == e)
                                        .toString(),
                                  )
                              ? Colors.green
                              : Colors.black,
                        ),
                        child: Text(
                          (timelines.indexWhere((element) => element == e) + 1)
                              .toString(),
                          style: googleFontsNunito().copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        e,
                        style: googleFontsNunito().copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _navigationTap(BuildContext context, CheckoutController controller) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: heightSize(context) * 0.15,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          border: Border(
            top: BorderSide(
              color: Colors.grey.withOpacity(0.3),
            ),
          ),
        ),
        child: GestureDetector(
          onTap: () {
            if (controller.pageController.value.page != 3) {
              controller.pageController.value.nextPage(
                duration: const Duration(seconds: 1),
                curve: Curves.ease,
              );
            }
          },
          child: Container(
            alignment: Alignment.center,
            width: widthSize(context),
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  controller.page.value != 2
                      ? 'Confirm and continue'
                      : "Submit Order",
                  style: googleFontsNunito().copyWith(
                    color: Theme.of(context).backgroundColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).backgroundColor,
                  size: 14,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _title(String caption) {
    return Text(
      caption,
      style: googleFontsNunito().copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }

  void controllerPage(PageController controller) {
    controller.nextPage(
        duration: const Duration(seconds: 1), curve: Curves.ease);
  }
}

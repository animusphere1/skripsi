import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mobile/routes.dart';
import 'package:mobile/ui/models/content_model.dart';
import 'package:mobile/ui/utils/extension/extensions.dart';

import '../../../core/cart/cart_controller.dart';
import '../../../main.dart';
import '../../utils/fonts.dart';
import '../../utils/utils.dart';

class ItemContent extends StatelessWidget {
  final ContentModel contentModel;

  const ItemContent({Key? key, required this.contentModel}) : super(key: key);

  Future<void> _bottomSheet(BuildContext context) async {
    await Get.bottomSheet(
      ScrollConfiguration(
        behavior: RemoveScrollGlow(),
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  height: 7,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                Expanded(
                  child: PageView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Short Trip',
                                    style: googleFontsNunito().copyWith(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      style: googleFontsNunito().copyWith(
                                        color: Colors.blue,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      text: 'Rp. 375.000',
                                      children: [
                                        const TextSpan(
                                          text: ' ',
                                        ),
                                        TextSpan(
                                          text: '/ Jeep',
                                          style: googleFontsNunito().copyWith(
                                            color: Colors.grey.withOpacity(0.5),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: widthSize(context),
                                child: Row(
                                  children: [
                                    _tableTrip(context, title: 'Short Trip A'),
                                    _tableTrip(context, title: 'Short Trip B'),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Divider(
                                  thickness: 1,
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: heightSize(context) * 0.1,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            _currencyWidget(context),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget _currencyWidget(BuildContext context) {
    return GetX<CartController>(
      init: CartController(),
      builder: (controller) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: heightSize(context) * 0.1,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey.withOpacity(0.3),
                  width: 1.0,
                ),
              ),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Total Biaya',
                      style: googleFontsNunito().copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      controller.cartModel.value.price!.toRupiah(),
                      style: googleFontsNunito().copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: () async {
                    if (controller.cartModel.value.price != 0) {
                      await Get.toNamed(RouteGenerator.routeCheckout);
                    }
                  },
                  child: Container(
                    width: widthSize(context) * 0.25,
                    height: heightSize(context) * 0.06,
                    decoration: BoxDecoration(
                      color: controller.cartModel.value.price != 0
                          ? Colors.blue
                          : Colors.grey,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Checkout',
                      style: googleFontsNunito().copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await _bottomSheet(context);
      },
      child: Container(
        height: heightSize(context) * 0.4,
        width: widthSize(context) * 0.65,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        margin: const EdgeInsets.only(
          right: 15,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          border: Border.all(
            color: Colors.grey.withOpacity(0.3),
            width: 1.0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://picsum.photos/id/237/200/300',
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jeep Tawangmangu',
                          style: googleFontsNunito().copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                right: 10,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    20,
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Ionicons.person,
                                    size: 10,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    '4 Orang',
                                    style: googleFontsNunito().copyWith(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    20,
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Ionicons.time,
                                    size: 10,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    '2 Jam - 8 Jam',
                                    style: googleFontsNunito().copyWith(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Ionicons.location_sharp,
                                size: 12,
                                color: Colors.blue,
                              ),
                              const SizedBox(width: 3),
                              Text(
                                'Tawangmangu, Indonesia',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: googleFontsNunito().copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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

  Widget _tableTrip(BuildContext context, {String? title}) {
    print(title);

    return GetX<CartController>(builder: (controller) {
      return Expanded(
        child: GestureDetector(
          onTap: () async {
            print(title);

            await controller.onChange(375000, (title ?? ''));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 20,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              border: Border.all(
                color:
                    (controller.cartModel.value.nameTrip ?? '').toLowerCase() ==
                            (title ?? '').toLowerCase()
                        ? Colors.blue
                        : Colors.grey,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? '',
                  style: googleFontsNunito().copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: Divider(
                    color: Colors.grey.withOpacity(0.2),
                    height: 5,
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: RichText(
                        text: TextSpan(
                          text: '-',
                          style: googleFontsNunito().copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 12,
                          ),
                          children: const [
                            TextSpan(
                              text: ' ',
                            ),
                            TextSpan(
                              text: 'Kebun Sayur',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: RichText(
                        text: TextSpan(
                          text: '-',
                          style: googleFontsNunito().copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 12,
                          ),
                          children: const [
                            TextSpan(
                              text: ' ',
                            ),
                            TextSpan(
                              text: 'Hutan Pinus',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: RichText(
                        text: TextSpan(
                          text: '-',
                          style: googleFontsNunito().copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 12,
                          ),
                          children: const [
                            TextSpan(
                              text: ' ',
                            ),
                            TextSpan(
                              text: 'Telaga Mardirda',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

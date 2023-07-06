import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mobile/core/date/date_controller.dart';
import 'package:mobile/ui/utils/fonts.dart';
import 'package:mobile/ui/utils/size.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var hari = DateFormat('EEEE').format(DateTime.now());

    if (hari.toLowerCase() == 'wednesday') {
      hari = 'Rabu';
    }

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: heightSize(context) * 0.02),
              _weatherWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _weatherWidget(BuildContext context) {
    return Container(
      height: heightSize(context) * 0.2,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor.withOpacity(0.1),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kamis',
                      maxLines: 2,
                      style: googleFontsNunito().copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '05 Febuari 2023',
                      style: googleFontsNunito().copyWith(
                        color: Colors.white.withOpacity(
                          0.3,
                        ),
                        fontWeight: FontWeight.normal,
                        letterSpacing: 0.1,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Text(
                  "18 \u2103",
                  style: googleFontsNunito().copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Container(
              alignment: Alignment.center,
              child: const Icon(
                Ionicons.partly_sunny,
                size: 60,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return Row(
      children: [],
    );
  }
}

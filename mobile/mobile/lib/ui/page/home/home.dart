import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mobile/ui/page/home/home_controller.dart';
import 'package:mobile/ui/utils/fonts.dart';
import 'package:mobile/ui/utils/size.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              _appBar(context),
              const SizedBox(height: 10),
              _carouselContent(context),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.2),
                      width: 2,
                    ),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container();
                            },
                          ).whenComplete(() {
                            Get.find<HomeController>().isLoading.value = true;
                          });
                        },
                        child: const Icon(
                          Ionicons.search,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          autocorrect: false,
                          style: googleFontsNunito().copyWith(
                            fontWeight: FontWeight.bold,
                            height: 1.4,
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: 'Cari tujuan liburan kamu hari ini',
                            hintStyle: googleFontsNunito().copyWith(
                              color: Colors.grey.withOpacity(0.5),
                              fontWeight: FontWeight.bold,
                              height: 1.4,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _carouselContent(BuildContext context) {
    return SizedBox(
      height: heightSize(context) * 0.2,
      child: PageView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: index.isEven ? Colors.green : Colors.yellow,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Ionicons.location_sharp,
                size: 25,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Yogyakarta, Indonesia',
                    style: googleFontsNunito().copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Jl. Jalanin dulu aja',
                    style: googleFontsNunito().copyWith(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Icon(Ionicons.notifications),
        ],
      ),
    );
  }
}

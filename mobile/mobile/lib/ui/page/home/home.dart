import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/main.dart';
import 'package:mobile/ui/page/home/home_controller.dart';
import 'package:mobile/ui/utils/fonts.dart';
import 'package:mobile/ui/utils/size.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final PageController pageController = PageController(
    viewportFraction: 0.8,
  );

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            body: ScrollConfiguration(
              behavior: RemoveScrollGlow(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _appBar(context),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: heightSize(context) * 0.2,
                      child: PageView.builder(
                        itemCount: controller.itemModels.length + 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: SizedBox(
                              child: Stack(
                                children: [
                                  Container(
                                    height: heightSize(context) * 0.1,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.green.shade100,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    child: Text(
                                      'Jeep Wisata  $index',
                                      style: googleFontsNunito().copyWith(
                                        fontSize: 10,
                                        color: Colors.green,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      height: heightSize(context) * 0.168,
                                      decoration: BoxDecoration(
                                        color:
                                            Theme.of(context).backgroundColor,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          _contentMiniWidget(index, context),
                                          _imageMiniWidget(context),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Chip(
                            label: Text('All'),
                          ),
                          ...List.generate(
                            10,
                            (index) => Chip(
                              label: Text('Text $index'),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _imageMiniWidget(BuildContext context) {
    return Container(
      height: heightSize(context),
      width: widthSize(context) * 0.15,
      decoration: const BoxDecoration(
        color: Colors.green,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            'https://picsum.photos/200/300',
          ),
        ),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(
            20,
          ),
          topRight: Radius.circular(
            20,
          ),
        ),
      ),
    );
  }

  Widget _contentMiniWidget(int index, BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    index.isOdd
                        ? 'Tawangmangu Jeep Adventure'
                        : 'Jeep Wisata Tawangmangu',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: googleFontsNunito().copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        size: 12,
                        color: Colors.grey.shade400,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        width: 100,
                        child: Text(
                          'Jl.Banjarsari RT01 / 09, Tawangmangu',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: googleFontsNunito().copyWith(
                            fontSize: 10,
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                width: widthSize(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Price Start From',
                      style: googleFontsNunito().copyWith(
                        fontSize: 8,
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Rp.500.000',
                      style: googleFontsNunito().copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100,
                  child: Text(
                    'Hi, Fajar Bagus Widiarno',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: googleFontsNunito().copyWith(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Mau berwisata?',
                  style: googleFontsNunito().copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.notifications,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

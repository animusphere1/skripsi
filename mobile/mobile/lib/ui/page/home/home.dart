import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mobile/main.dart';
import 'package:mobile/ui/models/content_model.dart';
import 'package:mobile/ui/page/home/home_controller.dart';
import 'package:mobile/ui/utils/fonts.dart';
import 'package:mobile/ui/utils/size.dart';
import 'widget/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: RemoveScrollGlow(),
      child: GetX<HomeController>(builder: (controller) {
        return SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).cardColor,
                            width: 2.0,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _appBar(context, controller),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Selamat Pagi",
                                  style: googleFontsNunito().copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor
                                        .withOpacity(
                                          0.5,
                                        ),
                                  ),
                                ),
                                Text(
                                  'Fajar Bagus Widiarno',
                                  style: googleFontsNunito().copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              height: heightSize(context) * 0.07,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Row(
                                children: const [
                                  Icon(Ionicons.search),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: TextField(
                                      style: TextStyle(
                                        height: 1.4,
                                      ),
                                      decoration: InputDecoration.collapsed(
                                        hintText: "Search destination",
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
                    _listCategory(context),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 15,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(height: 15),
                              title(
                                context,
                                caption: "Populer",
                                isSeeAll: true,
                              ),
                              SizedBox(
                                height: heightSize(context) * 0.4,
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: 20,
                                  itemBuilder: (context, index) {
                                    return ContentWidget(
                                      index: index,
                                      contentModel: ContentModel(
                                        title: 'Jeep Tawangmangu Adventure',
                                        caption: 'Wisata Menggunakan Jeep',
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              title<String>(
                                context,
                                caption: "Koleksi",
                                isSeeAll: true,
                                onTap: () => 'nama saya',
                              ),
                              ListView.builder(
                                itemCount: controller.contentModels.length,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  var contentModel =
                                      controller.contentModels[index];

                                  return CollectionWidget(
                                    index: index,
                                    contentModel: contentModel,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget title<T>(
    BuildContext context, {
    String? caption,
    TextStyle? textStyle,
    bool isSeeAll = false,
    T Function()? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            caption ?? 'caption',
            style: textStyle ??
                googleFontsNunito().copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  fontSize: 20,
                ),
          ),
          isSeeAll
              ? GestureDetector(
                  onTap: () {
                    onTap != null
                        ? onTap()
                        : print('function ini masih kosong $caption');
                  },
                  child: Text(
                    'See All',
                    style: googleFontsNunito().copyWith(
                      fontSize: 13,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }

  Widget _listCategory(BuildContext context) {
    return Container(
      width: widthSize(context),
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            ...List.from(
              [
                'All',
                'Petualangan',
                'Kuliner',
                'Wisata Religi',
                'Oleh-Oleh',
              ],
            ).map(
              (e) => Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: (e as String).toLowerCase() == "petualangan"
                      ? Theme.of(context).backgroundColor
                      : Theme.of(context).cardColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                margin: const EdgeInsets.only(right: 15),
                child: Text(
                  e,
                  style: googleFontsNunito().copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context, HomeController controller) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Theme.of(context).cardColor.withOpacity(0.2),
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(
                Ionicons.location,
                color: Theme.of(context).backgroundColor,
                size: 20,
              ),
              const SizedBox(width: 7),
              Text(
                controller.location.value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: googleFontsNunito().copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Ionicons.heart,
                  size: 17,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Ionicons.person,
                  size: 17,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

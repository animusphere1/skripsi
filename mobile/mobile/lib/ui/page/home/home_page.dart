import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mobile/core/cart/cart_controller.dart';
import 'package:mobile/main.dart';
import 'package:mobile/routes.dart';
import 'package:mobile/ui/models/content_model.dart';
import 'package:mobile/ui/utils/fonts.dart';
import 'package:mobile/ui/utils/size.dart';

import '../widgets/item_content_widget.dart';
import '../widgets/search_textfield_widget.dart';
import '../widgets/title_widget.dart';
import '../../utils/extension/extension_currency.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: RemoveScrollGlow(),
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: _appBar(),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: SearchTextField(),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ...List.from([
                        {
                          'title': 'Near me',
                          'icon': Icons.near_me,
                        },
                        {
                          'title': 'NgeJeep',
                          'icon': Ionicons.car_sport,
                        },
                        {
                          'title': 'NgeVilla',
                          'icon': Icons.home_sharp,
                        }
                      ]).map(
                        (e) => Container(
                          margin: const EdgeInsets.only(right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.grey.withOpacity(0.3),
                                    width: 1.0,
                                  ),
                                ),
                                child: Icon(
                                  e['icon'],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                e['title'],
                                textAlign: TextAlign.center,
                                style: googleFontsNunito().copyWith(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const TitleWidget(),
                SizedBox(
                  height: heightSize(context) * 0.4,
                  child: ListView.builder(
                    itemCount: 20,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ItemContent(
                        contentModel: ContentModel(
                          title: 'nama',
                          caption: 'test',
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'LOCATION',
              style: googleFontsNunito().copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 12,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 2),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Ionicons.location_sharp,
                  size: 18,
                  color: Colors.blue,
                ),
                const SizedBox(width: 5),
                Text(
                  'Tawangmangu, Indonesia',
                  style: googleFontsNunito().copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
        Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://picsum.photos/id/237/200/300',
              ),
            ),
          ),
        ),
      ],
    );
  }
}

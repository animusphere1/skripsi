import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mobile/main.dart';
import 'package:mobile/routes.dart';
import 'package:mobile/ui/utils/fonts.dart';
import 'package:mobile/ui/utils/size.dart';

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
                const Title(),
                SizedBox(
                  height: heightSize(context) * 0.4,
                  child: ListView.builder(
                    itemCount: 20,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return const ItemContent();
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

class ItemContent extends StatelessWidget {
  const ItemContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Get.bottomSheet(
          ScrollConfiguration(
            behavior: RemoveScrollGlow(),
            child: Stack(
              children: [
                PageView.builder(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  text: 'Rp. 375.000',
                                  children: [
                                    TextSpan(
                                      text: ' ',
                                    ),
                                    TextSpan(
                                      text: '/ Jeep',
                                      style: googleFontsNunito().copyWith(
                                        color: Colors.grey,
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
                                _tableTrip(context),
                                const SizedBox(width: 10),
                                _tableTrip(context),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: heightSize(context) * 0.1,
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: heightSize(context) * 0.1,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.grey.withOpacity(0.3),
                          width: 1.0,
                        ),
                      ),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,
        );
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
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                right: 10,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    20,
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Ionicons.person,
                                    size: 10,
                                  ),
                                  SizedBox(width: 5),
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
                                  Icon(
                                    Ionicons.time,
                                    size: 10,
                                  ),
                                  SizedBox(width: 5),
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

  Widget _tableTrip(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Short Trip B',
              style: googleFontsNunito().copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5,
              ),
              child: Divider(
                color: Colors.grey,
                height: 2,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kebun Sayur',
                  style: googleFontsNunito().copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  'Hutan Pinus',
                  style: googleFontsNunito().copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  'Telaga Mardirda',
                  style: googleFontsNunito().copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Recommended",
            style: googleFontsNunito().copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            "See all",
            style: googleFontsNunito().copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        border: Border.all(
          color: Colors.grey.withOpacity(0.3),
          width: 1.0,
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: googleFontsNunito().copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              decoration: InputDecoration.collapsed(
                hintText: 'Search Destination',
                hintStyle: googleFontsNunito().copyWith(
                  color: Colors.grey.shade300,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          const Icon(Ionicons.search),
        ],
      ),
    );
  }
}

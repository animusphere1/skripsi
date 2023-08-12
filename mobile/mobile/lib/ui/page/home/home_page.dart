import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mobile/main.dart';
import 'package:mobile/ui/utils/fonts.dart';
import 'package:mobile/ui/utils/size.dart';
import 'package:mobile/ui/utils/extension/extension_currency.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> listMenuNavigasi = [
    'Jeep Wisata',
  ];

  String menuNavigasiAktif = "All";
  int indexActive = 0;

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: RemoveScrollGlow(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Column(
            children: [
              _appBar(context),
              _filterNavigation(context),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            height: heightSize(context) * 0.2,
                            child: PageView(
                              onPageChanged: (value) {
                                setState(() {
                                  indexActive = value;
                                });
                              },
                              controller: pageController,
                              children: [
                                ...List.generate(
                                  5,
                                  (index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: index.isEven
                                            ? Colors.green
                                            : Colors.yellow,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...List.generate(
                                5,
                                (index) => Container(
                                  height: 7,
                                  width: 7,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: index == indexActive
                                        ? Colors.black
                                        : Colors.black.withOpacity(0.2),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      _judulSubMenu(
                        [
                          Text(
                            "Jeep Wisata",
                            style: googleFontsNunito().copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "See all",
                            style: googleFontsNunito().copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.4),
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            ...List.generate(
                              10,
                              (index) => _contentWidget(context),
                            ),
                          ],
                        ),
                      ),
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

  Widget _contentWidget(BuildContext context) {
    return Container(
      height: heightSize(context) * 0.5,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      child: Column(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage('https://picsum.photos/400'),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 30,
                                height: 30,
                                margin: EdgeInsets.only(
                                  right: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  'Sumiyarno'[0],
                                  style: googleFontsNunito().copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                'Sumiyarno',
                                style: googleFontsNunito().copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 20),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Ionicons.heart,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(),
          ),
          Flexible(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: widthSize(context) * 0.4,
                            child: Text(
                              'Jeep Tawangmangu',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: googleFontsNunito().copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Tersedia',
                                style: googleFontsNunito().copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Container(
                                height: 7,
                                width: 7,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Tawangmangu, Banjarsari',
                        style: googleFontsNunito().copyWith(
                          color: Colors.black.withOpacity(0.3),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  _hargaAkumulasi(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _hargaAkumulasi({List<String>? harga}) {
    return Row(
      children: [
        Text(
          450000.toRupiah(),
          style: googleFontsNunito().copyWith(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          ' - ',
          style: googleFontsNunito().copyWith(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          750000.toRupiah(),
          style: googleFontsNunito().copyWith(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          ' / Trip',
          style: googleFontsNunito().copyWith(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _judulSubMenu(List<Widget> widgets) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: widgets,
      ),
    );
  }

  Widget _filterNavigation(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                pageController.jumpToPage(0);

                setState(() {
                  menuNavigasiAktif = 'All';
                });
              },
              child: Container(
                decoration: menuNavigasiAktif != "All"
                    ? BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),
                      )
                    : const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                margin: const EdgeInsets.only(right: 5),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Text(
                  'All',
                  style: googleFontsNunito().copyWith(
                    color: menuNavigasiAktif == "All"
                        ? Colors.white
                        : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ...listMenuNavigasi.map(
              (e) => GestureDetector(
                onTap: () {
                  pageController.jumpToPage(
                    listMenuNavigasi.indexWhere((element) => element == e) + 1,
                  );

                  setState(() {
                    menuNavigasiAktif = e;
                  });
                },
                child: Container(
                  decoration: menuNavigasiAktif != e
                      ? BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          border: Border.all(
                            color: Colors.grey.shade300,
                          ),
                        )
                      : const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                  margin: const EdgeInsets.only(right: 5),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Text(
                    e,
                    style: googleFontsNunito().copyWith(
                      color:
                          menuNavigasiAktif == e ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: widthSize(context) * 0.1,
                height: heightSize(context) * 0.1,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  'Fajar Bagus Widiarno'.split(' ')[0][0].toUpperCase(),
                  style: googleFontsNunito().copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Selamat Pagi !',
                    style: googleFontsNunito().copyWith(
                      color: Colors.grey.shade300,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Fajar Bagus Widiarno',
                    style: googleFontsNunito().copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).backgroundColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

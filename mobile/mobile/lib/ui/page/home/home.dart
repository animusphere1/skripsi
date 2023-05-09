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
    return GetX<HomeController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _appBar(context),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Recommended For You',
                  style: googleFontsNunito().copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    wordSpacing: 0.5,
                    letterSpacing: -0.2,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: heightSize(context) * 0.6,
                      child: PageView.builder(
                        controller: controller.pageController.value,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return const ContentItem();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      );
    });
  }

  Widget _appBar(BuildContext context) {
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
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person,
                  size: 17,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'Hi, Fajar!',
                style: googleFontsNunito().copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
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
                  Ionicons.menu,
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

class ContentItem extends StatefulWidget {
  const ContentItem({
    Key? key,
  }) : super(key: key);

  @override
  State<ContentItem> createState() => _ContentItemState();
}

class _ContentItemState extends State<ContentItem>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();
    animation = Tween<double>(
      begin: 0.0,
      end: 20.0,
    ).animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: heightSize(context) * 0.4,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://fastly.picsum.photos/id/20/3670/2462.jpg?hmac=CmQ0ln-k5ZqkdtLvVO23LjVAEabZQx2wOaT4pyeG10I'),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: widthSize(context) * 0.5,
                    child: Text(
                      'Jeep Tawangmangu Adventure',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: googleFontsNunito().copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        wordSpacing: 0.5,
                        letterSpacing: -0.2,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Jeep Tawangmangu Adventure',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: googleFontsNunito().copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      wordSpacing: 0.5,
                      letterSpacing: -0.2,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

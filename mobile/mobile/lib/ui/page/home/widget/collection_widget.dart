import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mobile/ui/models/content_model.dart';
import 'package:mobile/ui/utils/extension/extension_string.dart';

import '../../../utils/fonts.dart';
import '../../../utils/size.dart';
import '../home_controller.dart';

class CollectionWidget extends StatefulWidget {
  final ContentModel contentModel;
  final int index;

  const CollectionWidget({
    Key? key,
    required this.index,
    required this.contentModel,
  }) : super(key: key);

  @override
  State<CollectionWidget> createState() => _CollectionWidgetState();
}

class _CollectionWidgetState extends State<CollectionWidget>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    initAnimation();
  }

  Future<void> initAnimation() async {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    animation = ColorTween(
      begin: Colors.white.withOpacity(0.5),
      end: Colors.red,
    ).animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    var title = widget.contentModel.title;

    super.build(context);
    return GestureDetector(
      onTap: () {
        Get.find<HomeController>().onTap(widget.index);
      },
      child: Container(
        height: heightSize(context) * 0.3,
        width: widthSize(context),
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
        ),
        child: Row(
          children: [
            Container(
              width: widthSize(context) * 0.35,
              decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    'https://picsum.photos/seed/picsum/200/300',
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  left: 15,
                  top: 15,
                  bottom: 15,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: widthSize(context) * 0.4,
                            child: Text(
                              title.toCamelCase(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: googleFontsNunito().copyWith(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.2,
                                height: 1.6,
                              ),
                            ),
                          ),
                          const SizedBox(height: 7),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Ionicons.location,
                                size: 17,
                                color: Theme.of(context).backgroundColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                  "Jl. Banjarsari RT 01/09 Tawangmangu, Karanganyar, Surakarta",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: googleFontsNunito().copyWith(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Wrap(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.yellow.withOpacity(0.2),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Ionicons.star,
                                        size: 10,
                                        color: Colors.yellow,
                                      ),
                                      const SizedBox(width: 7),
                                      Text(
                                        '5.0',
                                        style: googleFontsNunito().copyWith(
                                          color: Colors.yellow,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 5),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.blue.withOpacity(0.2),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Ionicons.star,
                                        size: 10,
                                        color: Colors.blue,
                                      ),
                                      const SizedBox(width: 7),
                                      Text(
                                        '109 Reviews',
                                        style: googleFontsNunito().copyWith(
                                          color: Colors.blue,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.only(right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Rp. 450.000',
                            style: googleFontsNunito().copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: AnimatedBuilder(
                              animation: animation,
                              builder: (context, child) {
                                return Icon(
                                  Ionicons.heart,
                                  color: animation.value,
                                );
                              },
                            ),
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
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

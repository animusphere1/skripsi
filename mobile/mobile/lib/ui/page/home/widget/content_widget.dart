import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mobile/ui/utils/extension/extension_currency.dart';

import '../../../models/content_model.dart';
import '../../../utils/fonts.dart';
import '../../../utils/size.dart';

class ContentWidget extends StatefulWidget {
  final ContentModel contentModel;
  final int index;

  const ContentWidget({
    Key? key,
    required this.index,
    required this.contentModel,
  }) : super(key: key);

  @override
  State<ContentWidget> createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: widthSize(context) * 0.5,
        margin: const EdgeInsets.only(right: 15),
        child: SizedBox(
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://picsum.photos/seed/picsum/200/300',
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: widthSize(context),
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 15,
                  ),
                  color: Theme.of(context).cardColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.contentModel.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: googleFontsNunito().copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
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
                              'Jl. Banjarsari RT 01/09, Tawangmangu',
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
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "${'450.000'.toRupiah()} ,-",
                              style: googleFontsNunito().copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            const Icon(
                              Ionicons.heart,
                              size: 17,
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

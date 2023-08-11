import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../utils/fonts.dart';

class SearchTextField extends StatelessWidget {
  final String? title;

  const SearchTextField({
    Key? key,
    this.title,
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
                hintText: title ?? 'Search Destination',
                hintStyle: googleFontsNunito().copyWith(
                  color: Colors.grey.shade300,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          // const Icon(Ionicons.search),
        ],
      ),
    );
  }
}

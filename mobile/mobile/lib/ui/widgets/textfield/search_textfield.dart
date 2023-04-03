import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../utils/fonts.dart';

class SearchTextfield extends StatelessWidget {
  final void Function()? onTap;
  final void Function(String)? onChange;

  const SearchTextfield({
    Key? key,
    this.onTap,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(7),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: googleFontsNunito().copyWith(
                fontWeight: FontWeight.bold,
              ),
              onChanged: (e) {
                onChange != null ? onChange! : print('kosong');
              },
              onTap: onTap != null ? onTap! : () {},
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                isCollapsed: true,
                border: InputBorder.none,
                hintText: 'Search place or location',
                hintStyle: googleFontsNunito().copyWith(
                  color: Colors.grey.shade700.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
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

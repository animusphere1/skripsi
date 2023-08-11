import 'package:flutter/material.dart';

import '../../utils/fonts.dart';

class TitleWidget extends StatelessWidget {
  final String? judul;

  const TitleWidget({
    Key? key,
    this.judul,
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
            judul ?? 'null',
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

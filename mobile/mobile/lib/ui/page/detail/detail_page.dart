import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mobile/routes.dart';
import 'package:mobile/ui/models/content_model.dart';
import 'package:mobile/ui/utils/size.dart';

class DetailPage extends StatelessWidget {
  final ContentModel contentModel;

  const DetailPage(this.contentModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: GestureDetector(
              child: Text('Tap aku mas'),
            ),
          ),
        ],
      ),
    );
  }
}

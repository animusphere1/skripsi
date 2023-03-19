import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mobile/routes.dart';
import 'package:mobile/ui/utils/size.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: GestureDetector(
              onTap: ontap,
              child: Text('Tap aku mas'),
            ),
          ),
        ],
      ),
    );
  }

  void ontap() async {
    var res = await Get.toNamed(RouteGenerator.routeHome);

    print(res);

    if (res != null) {
      print(res);
    }
  }
}

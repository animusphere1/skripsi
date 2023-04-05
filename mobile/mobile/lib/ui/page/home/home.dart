import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobile/ui/utils/size.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
              10,
              (index) => Container(
                decoration: BoxDecoration(color: Colors.green),
                margin: EdgeInsets.symmetric(vertical: 10),
                height: heightSize(context) * 0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget nama() => Text('nana');
}

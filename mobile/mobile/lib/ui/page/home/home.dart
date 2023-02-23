import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/ui/page/home/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetX<HomeController>(builder: (controller) {
        return Scaffold(
          body: Column(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                  ),
                  child: Column(
                    children: [
                      AnimatedBuilder(
                        animation: controller.animation.value,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: controller.animation.value.value,
                            child: Text(
                              (controller.animation.value.value as Offset)
                                  .dy
                                  .toString(),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

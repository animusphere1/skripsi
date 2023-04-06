import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mobile/ui/utils/fonts.dart';
import 'package:mobile/ui/utils/size.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'gotransit',
                            style: googleFontsNunito().copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Morning Wilson,',
                            style: googleFontsNunito().copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "Let's plan your trip, shall we?",
                            style: googleFontsNunito().copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        height: heightSize(context) * 0.055,
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: Container(
                                width: 8,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                style: googleFontsNunito().copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: InputDecoration.collapsed(
                                  hintText: 'Where do you wanna go?',
                                  hintStyle: googleFontsNunito().copyWith(
                                    fontSize: 15,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

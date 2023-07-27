import 'package:flutter/material.dart';
import 'package:mobile/ui/utils/fonts.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            'Error',
            style: googleFontsNunito().copyWith(color: Colors.green),
          ),
        ),
      ),
    );
  }
}

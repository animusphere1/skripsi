import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/injector.dart';
import 'package:mobile/routes.dart';

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Get.put<HomeController>(HomeController());
}

void main() {
  init().then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mobile App',
      themeMode: ThemeMode.light,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade200,
        backgroundColor: Colors.white,
      ),
      initialBinding: Injector.instance,
      onGenerateRoute: RouteGenerator.generateRoutes,
      initialRoute: RouteGenerator.routeHome,
    );
  }
}

class RemoveScrollGlow extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}

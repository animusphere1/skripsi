import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/core/services/background_services.dart';
import 'package:mobile/core/services/gps_services.dart';
import 'package:mobile/injector.dart';
import 'package:mobile/routes.dart';

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    Permission.gpsPermission(),
  ]);
}

void main() {
  init().then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundServices(
      child: GetMaterialApp(
        title: 'Jeep Tawangmangu',
        themeMode: ThemeMode.light,
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.grey.shade100,
          backgroundColor: Colors.white,
        ),
        darkTheme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black26,
          backgroundColor: Colors.black26,
        ),
        initialBinding: Injector.instance,
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: RouteGenerator.routeHome,
      ),
      status: (e) {
        print(e);
      },
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

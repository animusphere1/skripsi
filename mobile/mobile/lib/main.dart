import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/core/payment/payment_controller.dart';
import 'package:mobile/core/services/background_services.dart';
import 'package:mobile/core/services/gps_services.dart';
import 'package:mobile/injector.dart';
import 'package:mobile/routes.dart';

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  var response = await Future.wait([
    Permission.gpsPermission(),
    PaymentController.instance.init(),
  ]);

  print(response);
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
        title: 'Mobile App',
        themeMode: ThemeMode.dark,
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.grey.shade100,
          backgroundColor: Colors.orange,
          cardColor: Colors.white,
        ),
        darkTheme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.grey.shade100,
          backgroundColor: Colors.orange,
          cardColor: const Color.fromARGB(255, 27, 34, 39),
          canvasColor: const Color.fromARGB(255, 188, 233, 5),
          primaryColor: Colors.black,
        ),
        initialBinding: Injector.instance,
        onGenerateRoute: RouteGenerator.generateRoutes,
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

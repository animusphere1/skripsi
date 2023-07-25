import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mobile/ui/models/content_model.dart';
import 'package:mobile/ui/page/checkout/checkout_page.dart';
import 'package:mobile/ui/page/error/error_page.dart';
import 'package:mobile/ui/page/home/home_page.dart';

class RouteGenerator {
  static const routeHome = '/';
  static const routeCheckout = '/checkout';
  static const routeProfile = '/profile';

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    var routes = settings.name;
    var arguments = settings.arguments;

    switch (routes) {
      case routeHome:
        return GetPageRoute(
          page: () => const HomePage(),
        );
      case routeCheckout:
        if (kDebugMode) {
          return GetPageRoute(
            page: () => CheckoutPage(),
          );
        } else {
          if (arguments is ContentModel) {
            return GetPageRoute(
              page: () => CheckoutPage(),
            );
          } else {
            return GetPageRoute(
              page: () => const ErrorPage(),
            );
          }
        }

      default:
        return GetPageRoute(
          page: () => const HomePage(),
        );
    }
  }
}

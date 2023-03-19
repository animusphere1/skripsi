import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile/ui/page/detail/detail_page.dart';
import 'package:mobile/ui/page/home/home.dart';

class RouteGenerator {
  static const routeHome = '/';
  static const routeDetal = '/detail';

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    var routes = settings.name;
    var arguments = settings.arguments;

    switch (routes) {
      case routeHome:
        return GetPageRoute(
          page: () => HomePage(),
        );
      case routeDetal:
        return GetPageRoute(
          page: () => DetailPage(),
        );
      default:
        return GetPageRoute(
          page: () => HomePage(),
        );
    }
  }
}

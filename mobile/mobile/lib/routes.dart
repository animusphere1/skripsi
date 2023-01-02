import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile/ui/page/home/home.dart';

class RouteGenerator {
  static const routeHome = '/';

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    var routes = settings.name;
    var arguments = settings.arguments;

    switch (routes) {
      case routeHome:
        return GetPageRoute(
          page: () => HomePage(),
        );
      default:
        return GetPageRoute(
          page: () => HomePage(),
        );
    }
  }
}

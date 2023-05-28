import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile/ui/page/detail/detail_page.dart';
import 'package:mobile/ui/page/home/home.dart';

class RouteGenerator {
  static const routeHome = '/';
  static const routeDetail = '/detail';
  static const routeProfile = '/profile';

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    var routes = settings.name;
    var arguments = settings.arguments;

    switch (routes) {
      case routeHome:
        return GetPageRoute(
          page: () => const HomePage(),
        );
      case routeDetail:
        return GetPageRoute(
          page: () => const DetailPage(),
        );
      default:
        return GetPageRoute(
          page: () => HomePage(),
        );
    }
  }
}

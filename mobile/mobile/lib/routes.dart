import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mobile/ui/models/content_model.dart';
import 'package:mobile/ui/page/detail/detail_page.dart';
import 'package:mobile/ui/page/error/error_page.dart';
import 'package:mobile/ui/page/home/home_page.dart';

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
        if (kDebugMode) {
          return GetPageRoute(
            page: () => const DetailPage(),
          );
        } else {
          if (arguments is ContentModel) {
            return GetPageRoute(
              page: () => const DetailPage(),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mobile/ui/models/content_model.dart';
import 'package:mobile/ui/models/invoice_model.dart';
import 'package:mobile/ui/page/checkout/checkout_page.dart';
import 'package:mobile/ui/page/invoice/kodepembayaran_page.dart';
import 'package:mobile/ui/page/login/login_page.dart';
import 'package:mobile/ui/page/status/error_page.dart';
import 'package:mobile/ui/page/home/home_page.dart';
import 'package:mobile/ui/page/transaksi/transaksi_page.dart';

class RouteGenerator {
  static const routeHome = '/';
  static const routeLogin = '/login';
  static const routeCheckout = '/checkout';
  static const routeProfile = '/profile';
  static const routePembayaran = '/pembayaran';
  static const routeCheckPembayaran = '/checkPemabayaran';
  static const routeListTransaksi = '/transaksi';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var routes = settings.name;
    var arguments = settings.arguments;

    switch (routes) {
      case routeHome:
        return GetPageRoute(
          page: () => const HomePage(),
        );
      case routeLogin:
        return GetPageRoute(
          page: () => const LoginPage(),
        );
      case routeCheckout:
        if (kDebugMode) {
          return GetPageRoute(
            page: () => const CheckoutPage(),
          );
        } else {
          if (arguments is ContentModel) {
            return GetPageRoute(
              page: () => const CheckoutPage(),
            );
          } else {
            return GetPageRoute(
              page: () => const ErrorPage(),
            );
          }
        }
      case routePembayaran:
        return GetPageRoute(
          page: () => KodePemabayaranPage(
            invoiceModel: InvoiceModel(),
          ),
        );
      case routeCheckPembayaran:
        return GetPageRoute(
          page: () => KodePemabayaranPage(
            invoiceModel: InvoiceModel(),
          ),
        );
      case routeListTransaksi:
        return GetPageRoute(
          page: () => const TransaksiPage(),
        );
      default:
        return GetPageRoute(
          page: () => const HomePage(),
        );
    }
  }
}

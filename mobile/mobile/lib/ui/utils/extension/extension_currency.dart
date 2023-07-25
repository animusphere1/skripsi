import 'package:intl/intl.dart';

extension Currencty on int {
  String toRupiah() {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp.',
      decimalDigits: 0,
    );
    return currencyFormatter.format(this);
  }
}

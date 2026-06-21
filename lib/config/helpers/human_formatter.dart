import 'package:intl/intl.dart';

class HumanFormatter {
  static String number(double number, [int decimals = 0] ) {
    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: decimals,
      symbol: '',
      locale: 'en_US',
    ).format(number);
    return formatterNumber;
  }

  static String fecha() {
  final DateTime date = DateTime.now();
  final String dateFormatted = DateFormat('EEEE d/MM', 'es_MX').format(date);
  return dateFormatted[0].toUpperCase() + dateFormatted.substring(1);
}
}

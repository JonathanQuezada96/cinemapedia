import 'package:intl/intl.dart';

class HumanFormatter {
  static String number(double number) {
    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
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

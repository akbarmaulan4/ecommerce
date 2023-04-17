import 'package:intl/intl.dart';

class Utils{

  static formatCurrency(double currency) {
    var curr = currency;
    if (curr < 0) {
      curr = 0;
    }
    NumberFormat numberFormat = NumberFormat("#,##0", "en_US");
    return "Rp " + numberFormat.format(curr).replaceAll(",", ".");
  }
}
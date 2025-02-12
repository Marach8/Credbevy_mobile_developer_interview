import 'package:intl/intl.dart';


extension StringExtensions on String{

  String formatPrice() {
    final number = double.tryParse(this) ?? 0.0;
    final formatter = NumberFormat('#,##0.###');

    return formatter.format(number);
  }

}
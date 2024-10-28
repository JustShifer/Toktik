import 'package:intl/intl.dart';

class HumansFormats {
// lo creamos static para evitar crear una instancia para llamar a uno de sus metodos
  static String humanRedeableNumber(double num){
    
   final formatterNumber = NumberFormat.compactCurrency(
    decimalDigits: 0,
    symbol: "",
   ).format(num);
   
   return formatterNumber;
  }
}


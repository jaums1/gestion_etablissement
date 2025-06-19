import 'package:intl/intl.dart';


class TFormatters{
  static String formatDate(date){
    date ??= DateTime.now();
    // return DateFormat('dd-MMM-yyyy').format(date);
    return DateFormat('yyyyMMdd').format(date);
  } 

  static String formatDateFr(DateTime? date){
    date ??= DateTime.now();
    // return DateFormat('dd-MMM-yyyy').format(date);
    return DateFormat('dd/MM/yyyy').format(date);
  } 


  static DateTime formatDateAng(DateTime? date){
    date ??= DateTime.now();
    // return DateFormat('dd-MMM-yyyy').format(date);
    return DateTime.parse(DateFormat('yyyy-MM-dd').format(date));
  } 



  static String formatDateChaine(DateTime? date){
    date ??= DateTime.now();
    // return DateFormat('dd-MMM-yyyy').format(date);
    return DateFormat('yyyy-MMM-dd').format(date);
  }

  static String formatCurrency(double amount){
    return NumberFormat.currency(locale: 'en_US',symbol: '\$').format(amount);
  }

  static String formatPhoneNumber(String phoneNumber){
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0,3)}) ${phoneNumber.substring(3,6)} ${phoneNumber.substring(6)} ';
    }else if(phoneNumber.length==11){
     return '(${phoneNumber.substring(0,4)}) ${phoneNumber.substring(4,7)} ${phoneNumber.substring(7)} ';
    }
    return phoneNumber;
  }


  static String internationalFormatPhoneNumber (String phoneNumber){
    
      /// SUPPRIMER LES CHAINES DE CARACTERES
      
      var digitalOnly= phoneNumber.replaceAll(RegExp(r'\D'), '');

      /// EXTRACTION DU CODE DE PAYS 
    String countyCode= '+${phoneNumber.substring(0,2)}';
    digitalOnly=countyCode.substring(2);

    final formatterNumber=StringBuffer();
    formatterNumber.write('($countyCode)');

    int i=0;

    while (i< digitalOnly.length) {

      int groupLength=2;
      if (i==0 && countyCode=='+1') {
        groupLength=3;
      }

      int end=i+groupLength;

     formatterNumber.write(digitalOnly.substring(i,end));

     if (end< digitalOnly.length) {
       formatterNumber.write(' ');
     }
     i=end;

    }
    return phoneNumber;
  }



}
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TShowDate{



  H_RecupDate() async{

    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      firstDate: DateTime(1000),
      lastDate: DateTime.now(),
      keyboardType : TextInputType.datetime,
      initialEntryMode:DatePickerEntryMode.calendarOnly,
      helpText : "Selectionner une date",
      cancelText: "Annuler",
      confirmText: "Valider"
      // locale: const Locale('fr') 
      );
     
    return picked;
  }
 
}
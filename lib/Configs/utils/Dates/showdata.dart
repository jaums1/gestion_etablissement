import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TShowDate{



  H_RecupDate({bool? dateLointaine = false}) async{

    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      firstDate:dateLointaine==false? DateTime(1000) :DateTime.now(),
      lastDate: dateLointaine==false? DateTime.now() :DateTime(9000),
      keyboardType : TextInputType.datetime,
      // initialEntryMode:DatePickerEntryMode.calendarOnly,
      helpText : "Selectionner une date",
      cancelText: "Annuler",
      confirmText: "Valider"

      );
     
    return picked;
  }
 
}
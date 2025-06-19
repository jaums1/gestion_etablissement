
import 'package:get/get.dart';

import '../Model/decoupage_model.dart';

class TDecoupageController extends GetxController {
  static TDecoupageController get instance => Get.find();


  var selectRadio ="Trimestre".obs;
   final List<Map<String,String>> tableDecoupage=[
    {"Trimestre" :"1er Trimestre, 2e Trimestre, 3e Trimestre"},
    {"Semestre" : "Semestre 1, Semestre 2"},
   
   ];
   
   ///// LES INSTANCES
   
    final decoupageModel = TDecoupageModel();
    final repositorycontroller = Get.put(TDecoupageController());


    ///////// TRAITEMENT
   void selectGroupevalue(val){
    selectRadio.value =val;
    
   }

  
  

}
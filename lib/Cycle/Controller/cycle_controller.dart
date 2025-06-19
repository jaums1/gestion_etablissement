import 'package:ecole/Configs/utils/Implements/controller_data.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Popup/loaders.dart';
import '../Model/cycle_model.dart';
import '../Repository/cycle_repository.dart';

class TCycleController extends GetxController with TControllerData{
   static TCycleController get instance => Get.find();

  ///// DECLARATION DE VARIABLE 
   var selectRadio ="".obs;
   var dataTableCycle= <TCycleModel>[].obs;
   

   ///// LES INSTANCES
    final  id = 0.obs;
    var datacyleModel = TCycleModel();
    final repositorycontroller = Get.put(TCycleScolaireRepository());

    

   void HLitCycleScolaire(){
     datacyleModel.cycleScolaire = selectRadio.value;
   }

@override
  void onInit() {
   H_RecupeData();
    super.onInit();
  }

////// RECUPERATION
 @override
  void H_RecupeData()async {
    if (dataTableCycle.isNotEmpty) return;
    final data=await repositorycontroller.H_RecupData();
    if(data==false) return;
    if (data is List) {
      dataTableCycle.value = data.map((datas)=>TCycleModel.fromMap(datas)).toList();
      dataTableCycle.map((datas){ datas.etat ==true?  selectRadio.value=datas.cycleScolaire! :"";}).toList(); 
      onSelectRadio(selectRadio.value);
    }
  }
  
  ////// MODIFIER
  @override
  H_Modifier() async{
    try {
     HLitCycleScolaire();
     final data = await repositorycontroller.H_ModifierData(datacyleModel);
      if (data==false){ 
        TLoader.errorSnack(title: "ERREUR",message:"Veuillez bien vérifier votre connexion internet"); 
        return;}
        final index = onIndexData(datacyleModel.cycleScolaire);
       if(index==-1) return;
       dataTableCycle[index].etat=datacyleModel.etat;
    } catch (e) {
      TLoader.errorSnack(title: "ERREUR",message:"Veuillez bien vérifier votre connexion internet");
    }
  }

 ///// INITIALISATION

 //// VALIDATION CONFIGURATION
  @override
  H_ValiderConfig() {
    if (selectRadio.value.isEmpty)return false;
    H_Modifier();
      return true;
    }

 //// AUTRE PROCEDURE
void onSelectRadio(value){
  selectRadio.value =value;
   final index = onIndexData(value);
 if(index==-1) return;
 datacyleModel= dataTableCycle[index];
 
}


onIndexData(value){
  return dataTableCycle.indexWhere((e)=> e.cycleScolaire ==value );
}

}

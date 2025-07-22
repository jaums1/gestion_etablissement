import 'package:ecole/Configs/utils/Implements/controller_data.dart';
import 'package:get/get.dart';

import '../../Configs/utils/Constant/api_constants.dart';
import '../../Configs/utils/Popup/loaders.dart';
import '../../Configs/utils/dio/dio_client.dart';
import '../../Configs/utils/endpoint/endpoint.dart';
import '../Model/cycle_model.dart';

class TCycleController extends GetxController with TControllerData{
   static TCycleController get instance => Get.find();

  ///// DECLARATION DE VARIABLE 
   var selectRadio ="".obs;
   var DataTableCycle= <TCycleModel>[].obs;
   

   ///// LES INSTANCES
    final  id = 0.obs;
    var DatacyleModel = TCycleModel();
    final _client = TDioHelper(baseUrl: TApi.httpLien);


   
    

   void HLitCycleScolaire(){
     DatacyleModel.cycleScolaire = selectRadio.value;
   }

@override
  void onInit() {
   H_RecupeData();
    super.onInit();
  }

////// RECUPERATION
 @override
  H_RecupeData()async {

    try{
   ///// ENVOIE DES DONNEES
  final reponse =await _client.getList<TCycleModel>(TEndpoint.linkCycleScolaire,
                                             fromJson: (data) =>TCycleModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataTableCycle.value = reponse.data!;
      DatacyleModel = DataTableCycle.firstWhere((e)=> e.etat==true,orElse: () =>TCycleModel());
      selectRadio.value = DataTableCycle.firstWhere((e)=> e.etat==true,orElse: () =>TCycleModel()).cycleScolaire.toString();
    }
    } catch (e) {
      TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion source erreur $e");
    }
   
  }
  
  ////// MODIFIER
  @override
  H_Modifier() async{
   
   try {
     HLitCycleScolaire();
     final reponse =await _client.patch<TCycleModel>(TEndpoint.linkCycleScolaire,
     data: DatacyleModel.toMap(),fromJson: (data) =>TCycleModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DatacyleModel =reponse.data!;
      for (var element in DataTableCycle) {
         if(element.cycleScolaire==DatacyleModel.cycleScolaire) {
            element.etat =true;
         }else{ element.etat =false;}
        
      }
      
       selectRadio.value = DatacyleModel.cycleScolaire.toString();
    }
    } catch (e) {
      TLoader.errorSnack(title: "ERREUR",message:"Veuillez bien vérifier votre connexion internet $e");
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
 DatacyleModel= DataTableCycle[index];
 
}


onIndexData(value){
  return DataTableCycle.indexWhere((e)=> e.cycleScolaire ==value );
}

@override
  H_RecupeModif({int? id, String? param}) {
    int index = DataTableCycle.indexWhere((e)=>e.iDCycleScolaire==id);
    if(index==-1) return ;
    DataTableCycle[index].copyWith(data: DatacyleModel); 
  }

}

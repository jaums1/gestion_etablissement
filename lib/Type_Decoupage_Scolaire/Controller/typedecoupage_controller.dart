import 'package:get/get.dart';

import '../../Configs/utils/Implements/controller_data.dart';
import '../../Configs/utils/Popup/loaders.dart';
import '../Model/typedecoupage_model.dart';
import '../Repository/typedecoupage_repository.dart';

class TTypeDecoupageController extends GetxController with TControllerData {
  static TTypeDecoupageController get instance => Get.find();

   var selectRadio ="".obs;
   var dataTableTypeDecoupage= <TTypeDecoupageModel>[].obs;
   var dataTypeDecoupageModel = TTypeDecoupageModel();
   ///// LES INSTANCES
    final repositorycontroller = Get.put(TTypeDecoupageScolaireRepository());
    ///////// TRAITEMENT /////////////
      
   void HLitTypeDecoupage(){
    dataTypeDecoupageModel.libTypeDecoupage = selectRadio.value;
   }

@override
  void onInit() {
   H_RecupeData();
    super.onInit();
  }

////// RECUPERATION
 @override
  void H_RecupeData()async {
    H_Initialise();
    if (dataTableTypeDecoupage.isNotEmpty) return;
    final data=await repositorycontroller.H_RecupData();
    if(data==false) return;
    if (data is List) {
      dataTableTypeDecoupage.value = data.map((datas)=>TTypeDecoupageModel.fromMap(datas)).toList();
      dataTableTypeDecoupage.map((datas){ datas.etat ==true?  selectRadio.value=datas.libTypeDecoupage! :"";}).toList(); 
    }
  }
  
  ////// MODIFIER
  @override
  H_Modifier() async{
    try {
     HLitTypeDecoupage();

     final data = await repositorycontroller.H_ModifierData(dataTypeDecoupageModel);
      if (data==false){ 
        TLoader.errorSnack(title: "ERREUR",message:"Veuillez bien vérifier votre connexion internet"); 
        return;}
        final index = onIndexData(dataTypeDecoupageModel.libTypeDecoupage);
        if(index==-1) return;
         dataTableTypeDecoupage[index].etat=dataTypeDecoupageModel.etat;
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
 dataTypeDecoupageModel= dataTableTypeDecoupage[index];

}

onIndexData(value){
  return dataTableTypeDecoupage.indexWhere((e)=> e.libTypeDecoupage ==value );
}

}
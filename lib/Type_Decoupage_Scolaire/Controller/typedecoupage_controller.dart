import 'package:get/get.dart';

import '../../Configs/utils/Constant/api_constants.dart';
import '../../Configs/utils/Implements/controller_data.dart';
import '../../Configs/utils/Popup/loaders.dart';
import '../../Configs/utils/dio/dio_client.dart';
import '../../Configs/utils/endpoint/endpoint.dart';
import '../Model/typedecoupage_model.dart';

class TTypeDecoupageController extends GetxController with TControllerData {
  static TTypeDecoupageController get instance => Get.find();
  final  isLoading = false.obs;
   var selectRadio ="".obs;
   var DataTableTypeDecoupage= <TTypeDecoupageModel>[].obs;
   var DataTypeDecoupageModel = TTypeDecoupageModel();
   ///// LES INSTANCES
    final _client = TDioHelper(baseUrl: TApi.httpLien);

    ///////// TRAITEMENT /////////////
      
   void HLitTypeDecoupage(){
    DataTypeDecoupageModel.libTypeDecoupage = selectRadio.value;
   }

@override
  void onInit() {
    super.onInit();
    H_RecupeData();
  }

////// RECUPERATION
 @override
  H_RecupeData()async {
       try {
        isLoading.value =false;
  ///// ENVOIE DES DONNEES
  final reponse =await _client.getList<TTypeDecoupageModel>(TEndpoint.linkTypeDecoupageScolaire,
                                             fromJson: (data) =>TTypeDecoupageModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      
      DataTableTypeDecoupage.value = reponse.data!;
      DataTypeDecoupageModel = DataTableTypeDecoupage.firstWhere((e)=> e.etat==true,orElse: () =>TTypeDecoupageModel() ,);
      selectRadio.value = DataTableTypeDecoupage.firstWhere((e)=> e.etat==true
      ,orElse: () =>TTypeDecoupageModel()).libTypeDecoupage.toString();
         isLoading.value =true;
    }
    } catch (e) {
      isLoading.value =true;
      TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion source erreur $e");
    }
  }
  
  ////// MODIFIER
  @override
  H_Modifier() async{
    try {
     HLitTypeDecoupage();
    
     final reponse =await _client.patch<TTypeDecoupageModel>(TEndpoint.linkTypeDecoupageScolaire,
  data: DataTypeDecoupageModel.toMap(),fromJson: (data) =>TTypeDecoupageModel.fromMap(data));
    ////// VERIFICATION 
    if(reponse.success){
      DataTypeDecoupageModel =reponse.data!;
      H_RecupeModif(id:DataTypeDecoupageModel.iDTypeDecoupage);
    }else{
      TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion internet");
    }
    } catch (e) {
      TLoader.errorSnack(title: "ERREUR",message:"Veuillez bien vérifier votre connexion internet");
    }
  }

 ///// INITIALISATION


 //// VALIDATION CONFIGURATION
  @override
  H_ValiderConfig() async{
    if (selectRadio.value.isEmpty || selectRadio.value=="null" )return false;
  await  H_Modifier();
      return true;
    }

 //// AUTRE PROCEDURE
void onSelectRadio(value){
  selectRadio.value =value;
 final index = onIndexData(value);
 if(index==-1) return;
 DataTypeDecoupageModel= DataTableTypeDecoupage[index];

}

onIndexData(value){
  return DataTableTypeDecoupage.indexWhere((e)=> e.libTypeDecoupage ==value );
}

@override
  H_RecupeModif({int? id, String? param}) {
    int index = DataTableTypeDecoupage.indexWhere((e)=>e.iDTypeDecoupage==id);
    if(index==-1) return ;
    DataTableTypeDecoupage[index].copyWith(Data: DataTypeDecoupageModel); 
  }

}
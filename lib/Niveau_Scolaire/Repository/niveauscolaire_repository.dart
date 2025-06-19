import 'package:get/get.dart';

import '../../Configs/utils/Implements/repository_data.dart';
import '../../Configs/utils/endpoint/endpoint.dart';
import '../../Configs/utils/http/http_client.dart';
import '../Model/niveauscolaire_model.dart';

class TNiveauScolaireRepository extends GetxController with TRepositoryData<TNiveauModel> {
  static TNiveauScolaireRepository get instance =>Get.find();

  
 ///// ENREGISTRER
@override
  H_EnregistrerData(TNiveauModel Model) async{
   
    try {
      final data = await THttpHelper.post(TEndpoint.linkNiveauScolaire, Model.toMap());
      return data;
    } catch (e) {
      return false;
    }
  }

/////MODIFIER
@override
H_ModifierData(TNiveauModel Model)async{
     try {
      final data = await THttpHelper.patch(TEndpoint.linkNiveauScolaire, Model.toMap());
      return data;
    } catch (e) {
      return false;
    }
  }

//// SUPPRIMER
@override
  H_SupprimerData(int? Id) async{
   try {
       await THttpHelper.delete("${TEndpoint.linkNiveauScolaire}/$Id");
      return true;
    } catch (e) {
      return false;
    }
  }

////RECUPERATION
@override
  H_RecupData({String? param=""}) async{
    try {
      final data = await THttpHelper.get("${TEndpoint.linkNiveauScolaire}/$param");
      return data;
    } catch (e) {
      return false;
    }
  }



}
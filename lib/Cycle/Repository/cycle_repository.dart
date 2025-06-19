import 'package:get/get.dart';

import '../../Configs/utils/Implements/repository_data.dart';
import '../../Configs/utils/endpoint/endpoint.dart';
import '../../Configs/utils/http/http_client.dart';
import '../Model/cycle_model.dart';

class TCycleScolaireRepository extends GetxController with TRepositoryData<TCycleModel>{
  static TCycleScolaireRepository get instance =>Get.find();
 


 ///// ENREGISTRER
@override
  H_EnregistrerData(TCycleModel Model) async{
    try {
      final data = await THttpHelper.post(TEndpoint.linkCycleScolaire, Model.toMap());
      return data;
    } catch (e) {
      return false;
    }
  }

/////MODIFIER
@override
H_ModifierData(TCycleModel Model)async{
     try {
      final data = await THttpHelper.patch(TEndpoint.linkCycleScolaire, Model.toMap());
      return data;
    } catch (e) {
      return false;
    }
  }

//// SUPPRIMER
@override
  H_SupprimerData(int? Id) async{
   try {
       await THttpHelper.delete("${TEndpoint.linkCycleScolaire}/$Id");
      return true;
    } catch (e) {
      return false;
    }
  }

////RECUPERATION
@override
  H_RecupData({String? param=""}) async{
    try {
      final data = await THttpHelper.get(TEndpoint.linkCycleScolaire);
      return data;
    } catch (e) {
      return false;
    }
  }


}
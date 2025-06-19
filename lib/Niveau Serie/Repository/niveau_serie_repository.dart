import 'package:ecole/Configs/utils/Implements/repository_data.dart';
import 'package:get/get.dart';

import '../../Configs/utils/endpoint/endpoint.dart';
import '../../Configs/utils/http/http_client.dart';
import '../Model/niveau_serie_model.dart';

class TSerieNiveauRepository extends GetxController with TRepositoryData<TNiveauSerieModel>  {
  static TSerieNiveauRepository get instance =>Get.find();

   
 ///// ENREGISTRER
@override
  H_EnregistrerData(TNiveauSerieModel Model) async{
   
    try {
      final data = await THttpHelper.post(TEndpoint.linkNiveauSerie, Model.toMap());
      return data;
    } catch (e) {
      return false;
    }
  }

/////MODIFIER
@override
H_ModifierData(TNiveauSerieModel Model)async{
     try {
      final data = await THttpHelper.patch(TEndpoint.linkNiveauSerie, Model.toMap());
      return data;
    } catch (e) {
      return false;
    }
  }

//// SUPPRIMER
@override
  H_SupprimerData(int? Id) async{
   try {
       await THttpHelper.delete("${TEndpoint.linkNiveauSerie}/$Id");
      return true;
    } catch (e) {
      return false;
    }
  }

////RECUPERATION
@override
  H_RecupData({String? param=""}) async{
    try {
      if (param!.isEmpty) {
      final data= await THttpHelper.get(TEndpoint.linkNiveauSerie);
       return data;
     }else{
     final data= await THttpHelper.get("${TEndpoint.linkNiveauSerie}/$param");
       return data;
     }
    } catch (e) {
      return false;
    }
  }


}
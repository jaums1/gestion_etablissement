import 'package:ecole/Configs/utils/Implements/repository_data.dart';
import 'package:ecole/Serie/Model/serie_model.dart';
import 'package:get/get.dart';

import '../../Configs/utils/endpoint/endpoint.dart';
import '../../Configs/utils/http/http_client.dart';

class TSerieRepository extends GetxController with TRepositoryData<TSerieModel>  {
  static TSerieRepository get instance =>Get.find();

   
 ///// ENREGISTRER
@override
  H_EnregistrerData(TSerieModel Model) async{
   
    try {
      final data = await THttpHelper.post(TEndpoint.linkSerie, Model.toMap());
      return data;
    } catch (e) {
      return false;
    }
  }

/////MODIFIER
@override
H_ModifierData(TSerieModel Model)async{
     try {
      final data = await THttpHelper.patch(TEndpoint.linkSerie, Model.toMap());
      return data;
    } catch (e) {
      return false;
    }
  }

//// SUPPRIMER
@override
  H_SupprimerData(int? Id) async{
   try {
       await THttpHelper.delete("${TEndpoint.linkSerie}/$Id");
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
      final data= await THttpHelper.get(TEndpoint.linkSerie);
       return data;
     }else{
     final data= await THttpHelper.get("${TEndpoint.linkSerie}/$param");
       return data;
     }
    } catch (e) {
      return false;
    }
  }


}
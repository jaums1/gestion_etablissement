import 'package:ecole/Configs/utils/Implements/repository_data.dart';
import 'package:get/get.dart';
import '../../Configs/utils/endpoint/endpoint.dart';
import '../../Configs/utils/http/http_client.dart';
import '../Model/etablissement_model.dart';

class TEtablissementRepository extends GetxController with TRepositoryData<TEtablissementModel> {
  static TEtablissementRepository get instance =>Get.find();
  
 ///// ENREGISTRER
@override
   H_EnregistrerData(TEtablissementModel Model) async{
    try {
      final data = await THttpHelper.post(TEndpoint.linkEtablissement, Model.toMap());
      return data;
    } catch (e) {
      return false;
    }
  }

/////MODIFIER
@override
H_ModifierData(TEtablissementModel Model)async{
     try {
      final data = await THttpHelper.patch(TEndpoint.linkEtablissement, Model.toMap());
      return data;
    } catch (e) {
      return false;
    }
  }

//// SUPPRIMER
@override
  H_SupprimerData(int? Id) async{
   try {
       await THttpHelper.delete("${TEndpoint.linkEtablissement}/$Id");
      return true;
    } catch (e) {
      return false;
    }
  }

////RECUPERATION
@override
  H_RecupData({String? param=""}) async{
    try {
      final data = await THttpHelper.get(TEndpoint.linkEtablissement);
      return data;
    } catch (e) {
      return false;
    }
  }


}
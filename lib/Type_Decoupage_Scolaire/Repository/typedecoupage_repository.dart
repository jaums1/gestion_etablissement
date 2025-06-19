import 'package:get/get.dart';

import '../../Configs/utils/Implements/repository_data.dart';
import '../../Configs/utils/endpoint/endpoint.dart';
import '../../Configs/utils/http/http_client.dart';
import '../Model/typedecoupage_model.dart';

class TTypeDecoupageScolaireRepository extends GetxController with TRepositoryData<TTypeDecoupageModel> {
  static TTypeDecoupageScolaireRepository get instance =>Get.find();



 ///// ENREGISTRER
@override
  H_EnregistrerData(TTypeDecoupageModel Model) async{
    try {
      final data = await THttpHelper.post(TEndpoint.linkTypeDecoupageScolaire, Model.toMap());
      return data;
    } catch (e) {
      return false;
    }
  }

/////MODIFIER
@override
H_ModifierData(TTypeDecoupageModel Model)async{
     try {
      final data = await THttpHelper.patch(TEndpoint.linkTypeDecoupageScolaire, Model.toMap());
      return data;
    } catch (e) {
      return false;
    }
  }

//// SUPPRIMER
@override
  H_SupprimerData(int? Id) async{
   try {
       await THttpHelper.delete("${TEndpoint.linkTypeDecoupageScolaire}/$Id");
      return true;
    } catch (e) {
      return false;
    }
  }

////RECUPERATION
@override
  H_RecupData({String? param=""}) async{
    try {
      final data = await THttpHelper.get(TEndpoint.linkTypeDecoupageScolaire);
      return data;
    } catch (e) {
      return false;
    }
  }

}
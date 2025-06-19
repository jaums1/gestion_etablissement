import 'package:get/get.dart';
import '../../Configs/utils/Implements/repository_data.dart';
import '../../Configs/utils/endpoint/endpoint.dart';
import '../../Configs/utils/http/http_client.dart';
import '../Model/inscription_model.dart';

class TInscriptionRepository extends GetxController with TRepositoryData<TInscriptionModel> {
  static TInscriptionRepository get instance => Get.find();

  ///// ENREGISTRER
  @override
  Future<bool?> H_EnregistrerData(TInscriptionModel Model) async {
    try {
      await THttpHelper.post(TEndpoint.linkInscription, Model.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  ///// MODIFIER
  @override
  Future<bool?> H_ModifierData(TInscriptionModel Model) async {
    try {
      await THttpHelper.patch(TEndpoint.linkInscription, Model.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  /////RECUPERATION DES DATAS
  @override
  Future<bool?> H_SupprimerData(int? Id) async {
    try {
      await THttpHelper.delete("${TEndpoint.linkInscription}/$Id");
      return true;
    } catch (e) {
      return false;
    }
  }

  /////RECUPERATION DES DATAS
  @override
  Future H_RecupData({String? param}) async {
    try {
      final data = await THttpHelper.get(TEndpoint.linkInscription);
      return data;
    } catch (e) {
      return null;
    }
  }
} 
import 'package:get/get.dart';
import '../../Configs/utils/Implements/repository_data.dart';
import '../../Configs/utils/endpoint/endpoint.dart';
import '../../Configs/utils/http/http_client.dart';
import '../Model/versement_model.dart';

class TVersementRepository extends GetxController with TRepositoryData<TVersementModel> {
  static TVersementRepository get instance => Get.find();

  ///// ENREGISTRER
  @override
  Future<bool?> H_EnregistrerData(TVersementModel Model) async {
    try {
      await THttpHelper.post(TEndpoint.linkVersement, Model.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  ///// MODIFIER
  @override
  Future<bool?> H_ModifierData(TVersementModel Model) async {
    try {
      await THttpHelper.patch(TEndpoint.linkVersement, Model.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  /////RECUPERATION DES DATAS
  @override
  Future<bool?> H_SupprimerData(int? Id) async {
    try {
      await THttpHelper.delete("${TEndpoint.linkVersement}/$Id");
      return true;
    } catch (e) {
      return false;
    }
  }

  /////RECUPERATION DES DATAS
  @override
  Future H_RecupData({String? param}) async {
    try {
      final data = await THttpHelper.get(TEndpoint.linkVersement);
      return data;
    } catch (e) {
      return null;
    }
  }
} 
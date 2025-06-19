import 'package:get/get.dart';
import '../../Configs/utils/Implements/repository_data.dart';
import '../../Configs/utils/endpoint/endpoint.dart';
import '../../Configs/utils/http/http_client.dart';
import '../Model/modalite_paiement_model.dart';


class TModalitePaiementRepository extends GetxController with TRepositoryData<TModalitePaiementModel>{
  static TModalitePaiementRepository get instance =>Get.find();

 ///// ENREGISTRER
 @override
  Future<bool?> H_EnregistrerData(TModalitePaiementModel Model) async{
    try {
    await THttpHelper.post(TEndpoint.linkModalitePaiement, Model.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

///// MODIFIER
@override
  Future<bool?> H_ModifierData(TModalitePaiementModel Model) async{
     try {
      await THttpHelper.patch(TEndpoint.linkModalitePaiement, Model.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

/////RECUPERATION DES DATAS
@override
  Future<bool?> H_SupprimerData(int? Id)async {
     try {
      await THttpHelper.delete("${TEndpoint.linkModalitePaiement}/$Id");
      return true;
    } catch (e) {
      return false;
    }
  }


/////RECUPERATION DES DATAS
@override
 Future H_RecupData({String? param})async {
  
     try {
      final data = await THttpHelper.get(TEndpoint.linkModalitePaiement);
      return data;
    } catch (e) {
     
      return null;
    }
  }




}
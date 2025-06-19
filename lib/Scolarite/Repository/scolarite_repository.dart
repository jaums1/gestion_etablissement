import 'package:get/get.dart';
import '../../Configs/utils/Implements/repository_data.dart';
import '../../Configs/utils/endpoint/endpoint.dart';
import '../../Configs/utils/http/http_client.dart';
import '../Model/scolarite_model.dart';


class TScolariteRepository extends GetxController with TRepositoryData<TScolariteModel>{
  static TScolariteRepository get instance =>Get.find();

 ///// ENREGISTRER
 @override
  Future<bool?> H_EnregistrerData(TScolariteModel Model) async{
    try {
   await THttpHelper.post(TEndpoint.linkScolarite, Model.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

///// MODIFIER
@override
  Future<bool?> H_ModifierData(TScolariteModel Model) async{
     try {
      await THttpHelper.patch(TEndpoint.linkScolarite, Model.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

/////RECUPERATION DES DATAS
@override
  Future<bool?> H_SupprimerData(int? Id)async {
     try {
      await THttpHelper.delete("${TEndpoint.linkScolarite}/$Id");
      return true;
    } catch (e) {
      return false;
    }
  }


/////RECUPERATION DES DATAS
@override
 Future H_RecupData({String? param})async {
  
     try {
      final data = await THttpHelper.get(TEndpoint.linkScolarite);
      return data;
    } catch (e) {
     
      return null;
    }
  }




}
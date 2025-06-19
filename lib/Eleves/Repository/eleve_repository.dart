import 'package:ecole/Eleves/Model/eleve_model.dart';
import 'package:get/get.dart';
import '../../Configs/utils/Implements/repository_data.dart';
import '../../Configs/utils/endpoint/endpoint.dart';
import '../../Configs/utils/http/http_client.dart';


class TRepositoryEleve extends GetxController with TRepositoryData<TModelEleve>{
  static TRepositoryEleve get instance =>Get.find();

 ///// ENREGISTRER
 @override
  Future<bool?> H_EnregistrerData(TModelEleve Model) async{
    try {
    await THttpHelper.post(TEndpoint.linkEleve, Model.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

///// MODIFIER
@override
  Future<bool?> H_ModifierData(TModelEleve Model) async{
     try {
      await THttpHelper.patch(TEndpoint.linkEleve, Model.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

/////RECUPERATION DES DATAS
@override
  Future<bool?> H_SupprimerData(int? Id)async {
     try {
      await THttpHelper.delete("${TEndpoint.linkEleve}/$Id");
      return true;
    } catch (e) {
      return false;
    }
  }


/////RECUPERATION DES DATAS
@override
 Future H_RecupData({String? param})async {
  
     try {
      final data = await THttpHelper.get(TEndpoint.linkEleve);
      return data;
    } catch (e) {
     
      return null;
    }
  }




}
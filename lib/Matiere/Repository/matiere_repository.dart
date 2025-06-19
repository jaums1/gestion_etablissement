import 'package:get/get.dart';
import '../../Configs/utils/Implements/repository_data.dart';
import '../../Configs/utils/endpoint/endpoint.dart';
import '../../Configs/utils/http/http_client.dart';
import '../Model/matiere_model.dart';


class TMatiereRepository extends GetxController with TRepositoryData<TMatiereModel>{
  static TMatiereRepository get instance =>Get.find();

 ///// ENREGISTRER
 @override
  Future<bool?> H_EnregistrerData(TMatiereModel Model) async{
    try {
    await THttpHelper.post(TEndpoint.linkMatiere, Model.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

///// MODIFIER
@override
  Future<bool?> H_ModifierData(TMatiereModel Model) async{
     try {
      await THttpHelper.patch(TEndpoint.linkMatiere, Model.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

/////RECUPERATION DES DATAS
@override
  Future<bool?> H_SupprimerData(int? Id)async {
     try {
      await THttpHelper.delete("${TEndpoint.linkMatiere}/$Id");
      return true;
    } catch (e) {
      return false;
    }
  }


/////RECUPERATION DES DATAS
@override
 Future H_RecupData({String? param})async {
  
     try {
     if (param!.isEmpty) {
      final data = await THttpHelper.get(TEndpoint.linkMatiere);
      // print(data);
       return data;
     }else{
      return await THttpHelper.get("${TEndpoint.linkMatiere}/$param");
     }  
    } catch (e) {
      return null;
    }
  }




}
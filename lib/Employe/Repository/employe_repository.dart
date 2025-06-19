import 'package:ecole/Employe/Model/employe_model.dart';
import 'package:get/get.dart';
import '../../Configs/utils/Implements/repository_data.dart';
import '../../Configs/utils/endpoint/endpoint.dart';
import '../../Configs/utils/http/http_client.dart';


class TEmployeRepository extends GetxController with TRepositoryData<TEmployeModel>{
  static TEmployeRepository get instance =>Get.find();

 ///// ENREGISTRER
 @override
  Future<bool?> H_EnregistrerData(TEmployeModel Model) async{
    try {
    await THttpHelper.post(TEndpoint.linkEmploye, Model.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

///// MODIFIER
@override
  Future<bool?> H_ModifierData(TEmployeModel Model) async{
     try {
      await THttpHelper.patch(TEndpoint.linkEmploye, Model.toJson());
      
      return true;
    } catch (e) {
      return false;
    }
  }

/////RECUPERATION DES DATAS
@override
  Future<bool?> H_SupprimerData(int? Id)async {
     try {
      await THttpHelper.delete("${TEndpoint.linkEmploye}/$Id");
      return true;
    } catch (e) {
      return false;
    }
  }


/////RECUPERATION DES DATAS
@override
 Future H_RecupData({String? param})async {
  
     try {
      final data = await THttpHelper.get(TEndpoint.linkEmploye);
      return data;
    } catch (e) {
     
      return null;
    }
  }




}
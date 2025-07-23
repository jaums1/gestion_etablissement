import 'package:get/get.dart';
import '../../Configs/utils/Implements/repository_data.dart';
import '../../Configs/utils/endpoint/endpoint.dart';
import '../../Configs/utils/http/http_client.dart';
import '../Model/matierecoef_model.dart';


class TCoefficientRepository extends GetxController with TRepositoryData<TCoefficientModel>{
  static TCoefficientRepository get instance =>Get.find();

 ///// ENREGISTRER
 @override
  Future<bool?> H_EnregistrerData(TCoefficientModel Model) async{
    try {
    await THttpHelper.post(TEndpoint.linkCoefficient, Model.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

///// MODIFIER
@override
  Future<bool?> H_ModifierData(TCoefficientModel Model) async{
     try {
      await THttpHelper.patch(TEndpoint.linkCoefficient, Model.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

/////RECUPERATION DES DATAS
@override
  Future<bool?> H_SupprimerData(int? Id)async {
     try {
      await THttpHelper.delete("${TEndpoint.linkCoefficient}/$Id");
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
      final data = await THttpHelper.get(TEndpoint.linkCoefficient);
       return data;
     }else{
      return await THttpHelper.get("${TEndpoint.linkCoefficient}/$param");
     }  
    } catch (e) {
      return null;
    }
  }




}
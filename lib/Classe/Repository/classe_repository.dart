import 'package:get/get.dart';
import '../../Configs/utils/Implements/repository_data.dart';
import '../../Configs/utils/endpoint/endpoint.dart';
import '../../Configs/utils/http/http_client.dart';
import '../Model/classe_model.dart';


class TClasseRepository extends GetxController with TRepositoryData<TClasseModel>{
  static TClasseRepository get instance =>Get.find();

 ///// ENREGISTRER
 @override
  Future<bool?> H_EnregistrerData(TClasseModel Model) async{
    try {
    await THttpHelper.post(TEndpoint.linkClasse, Model.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

///// MODIFIER
@override
  Future<bool?> H_ModifierData(TClasseModel Model) async{
     try {
      await THttpHelper.patch(TEndpoint.linkClasse, Model.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

/////RECUPERATION DES DATAS
@override
  Future<bool?> H_SupprimerData(int? Id)async {
     try {
      await THttpHelper.delete("${TEndpoint.linkClasse}/$Id");
      return true;
    } catch (e) {
      return false;
    }
  }


/////RECUPERATION DES DATAS
@override
 Future H_RecupData({String? param})async {
  
     try {
      final data = await THttpHelper.get(TEndpoint.linkClasse);
      return data;
    } catch (e) {
     
      return null;
    }
  }




}
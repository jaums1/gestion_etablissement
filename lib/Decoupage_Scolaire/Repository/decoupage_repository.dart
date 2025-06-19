import 'package:get/get.dart';

import '../../Configs/utils/endpoint/endpoint.dart';
import '../../Configs/utils/http/http_client.dart';
import '../Model/decoupage_model.dart';

class TDecoupageScolaireRepository extends GetxController {
  static TDecoupageScolaireRepository get instance =>Get.find();

  /////Register
  Future<bool> register(TDecoupageModel? decoupageModel)async{
     
    try {
      await THttpHelper.post(TEndpoint.linkTypeDecoupageScolaire, decoupageModel!.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }
   /////Update
   Future<bool> updateData(TDecoupageModel? decoupageModel)async{
    try {
      await THttpHelper.patch(TEndpoint.linkTypeDecoupageScolaire, decoupageModel!.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }
  
/////Get Data

Future <Map<String,dynamic>> getData(TDecoupageModel? decoupageModel)async{
    try {
    
      return await THttpHelper.get(TEndpoint.linkTypeDecoupageScolaire);
      
    } catch (e) {
      return await THttpHelper.get(TEndpoint.linkTypeDecoupageScolaire);
    }
  }



}
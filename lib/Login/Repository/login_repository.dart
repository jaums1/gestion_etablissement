import 'package:get/get.dart';

import '../../Configs/routes/route.dart';
import '../../Configs/utils/endpoint/endpoint.dart';
import '../../Configs/utils/http/http_client.dart';
import '../Model/login_model.dart';

class LoginRepository extends GetxController {
  static LoginRepository get instance =>Get.find();

  /////Register
  Future<bool> register(UserModel? user)async{
    try {
      await THttpHelper.post(TEndpoint.registerLogin, user!.toMap());
     
      return true;
    } catch (e) {
      return false;
    }
  }
  
/////Login
Future <Map<String,dynamic>> loginUser(UserModel? user)async{
    try {
    
      return await THttpHelper.get("${TEndpoint.registerLogin}/${user!.user.toString()}/${user.motDePasse}");
      
    } catch (e) {
      return await THttpHelper.get("${TEndpoint.registerLogin}/${user!.user}/${user.motDePasse}");
    }
  }


  ////Redirection Screen 
  void registerLoginRedirectionScreen(bool result){
  if (result) {
    Get.offAllNamed(TRoutes.login);
  }
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Configs/routes/route.dart';
import '../../Configs/utils/Constant/image_string.dart';
import '../../Configs/utils/Popup/full_screen_loader.dart';
import '../../Configs/utils/Popup/loaders.dart';
import '../Model/login_model.dart';
import '../Repository/login_repository.dart';

class TLoginController {
  static TLoginController get instance => Get.find();

  final hidePassword  = true.obs;
  final hidePasswordConfirm  = true.obs;
  final rememberMe    = true.obs;

  final user =TextEditingController();
  final password =TextEditingController();
  final passwordConfirm =TextEditingController();
  final loginFromKey = GlobalKey<FormState>();
  final registerFromKey = GlobalKey<FormState>();
  late  UserModel dataUser;
  /////INIT userController
  LoginRepository usercontroller = Get.put(LoginRepository());
  UserModel userModel = Get.put(UserModel());

  void hLitUser(){
    userModel.user =user.text;
    userModel.motDePasse =password.text;
    userModel.statut ="Connectez";
    userModel.role ="User";
  

  }

  bool ishidePassword(){
    return hidePassword.value = !hidePassword.value;
  }

  bool ishidePasswordConfirm(){
    return hidePasswordConfirm.value = !hidePasswordConfirm.value;
  }

  /////CONNECTION
  
  /////Register user
  Future <void> registerUser()async{
    try {
      
      /// Start login
    TFullScreenLoader.openLoadingDialog("Enregistrement encours", TImages.docerAnimation);

   
     ///Traitement data
        /// FORM
        if (loginFromKey.currentState!.validate()) {
              hLitUser();
          if (password.text == passwordConfirm.text){
              bool result = await usercontroller.register(userModel);
              TFullScreenLoader.stopLoading();
          result == true? usercontroller.registerLoginRedirectionScreen(result):
          TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion");
          }else{
            
            TFullScreenLoader.stopLoading();
            TLoader.errorSnack(title: "Mot de Passe",message: "Mot de passe non correspondant");
          }
        }else{
          TFullScreenLoader.stopLoading();
        }
          
    } catch (e) {
       ///Stop loading
  
     TFullScreenLoader.stopLoading();
     TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion");
    }
  }

     ////Connectez
    Future <void> connexionUser()async{
     try {
      
      /// Start login
    TFullScreenLoader.openLoadingDialog("Connexion encours", TImages.docerAnimation);

   
     ///Traitement data
        /// FORM
        if (loginFromKey.currentState!.validate()) {
              // hLitUser();
              userModel.user =user.text;
             userModel.motDePasse =password.text;
              final result = await usercontroller.loginUser(userModel);
              TFullScreenLoader.stopLoading(); 
              
              if(result.containsKey("fault")){
               TLoader.errorSnack(title: "IDENTIFIANT",message: "Veuillez vérifier votre identifiant");
              }else{
               
                   dataUser = UserModel.fromMap(result);
                   Get.offAllNamed(TRoutes.menu,arguments: dataUser);
                  //  Get.toNamed(TRoutes.menu);
                  //  Get.offNamed(TRoutes.login);
                   
                 
              }
             
              
           
        }else{
          // print("Erreur");
          TFullScreenLoader.stopLoading();
          
        }
        
   
     
    } catch (e) {
       ///Stop loading
     TFullScreenLoader.stopLoading();
     TLoader.errorSnack(title: "Erreur",message: "Veuillez vérifier votre connexion");
   
    }


    }
}
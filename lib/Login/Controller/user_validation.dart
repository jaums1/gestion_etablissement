import 'package:ecole/Configs/routes/route.dart';
import 'package:ecole/Configs/utils/Constant/texte_string.dart';
import 'package:ecole/Configs/utils/Popup/showdialogue.dart';
import 'package:ecole/Login/Controller/user_filtre.dart';
import 'package:get/get.dart';
import '../../Configs/utils/Constant/enums.dart';
import '../../Configs/utils/Implements/controller_data.dart';
import '../../Configs/utils/Popup/loaders.dart';
import 'user_controller.dart';

class TUserValidation with TControllerData {
  final controller = Get.find<TUserController>();
   final filtre = TUtilisateurFiltre();

 H_CreationCompte()async{
  controller.variable.role.text = AppRole.Admin.name;
  final result=await controller.H_Enregistrer();
  if(result){
     controller.variable.clear();
     Get.offNamed(TRoutes.login);
     }
 }

H_Connexion()async{
  if(controller.variable.password.text.isEmpty || controller.variable.user.text.isEmpty){
    TLoader.errorSnack(title: "CHAMP",message: "Veuillez renseigner tous les champs");
    return;
  }
  final result=await controller.H_Connexion();
  if(result){
    if(controller.DataUserPrincipale.value.idUtilisateur !=0 )  Get.offNamed(TRoutes.menu); 
   }
  }


@override
  H_Enregistrer() async{
    ////// VERIFICATION
     
    ///// DE SELECTION D'EMPLOYE
    if(controller.controller.DataEmploye.value.IDEmploye==null){
      TLoader.errorSnack(title: TText.Employe.toUpperCase(), message: TText.messageSelectEmploye);
      return;
    }     

     if (filtre.H_Verification(param: controller.variable.user.text) != -1) {
      TLoader.errorSnack(title: TText.User.toUpperCase(), message: TText.messageUtilisateurExiste);
      return;
    }
    
    ///// VERIFICATION DE LA CONFORMITER DE MOT DE PASSE
    
    if(controller.variable.password.text==controller.variable.passwordConfirm.text){}else{
      TLoader.errorSnack(title:TText.User.toUpperCase(), message:TText.messagePasswordNonconforme);
       return;
    }


    ////// VALIDATION DES DATAS
    final result = await controller.H_Enregistrer();
    if (result) {
      TLoader.messageEnregistrer(TRoutes.utilisateur);
    }
  }

  @override
  H_Modifier() async {
    final result = await controller.H_Modifier();
    if (result) {
      TLoader.messageModifier(TRoutes.utilisateur);
    }
  }

  @override
  H_Supprimer({int? id, String? param}) {
    TShowdialogue().showSupprimer( onPressedValide:() =>controller.H_Supprimer(id: id));
    // TShowdialogue().showQuestion(
    //   titre: TText.supprimer,
    //   message:TText.messageSupprimer,
    //   onPressedValide: () => controller.H_Supprimer(id: id),
    // );

 
  }
} 
